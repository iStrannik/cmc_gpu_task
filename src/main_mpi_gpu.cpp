#include "stdio.h"
#include "math.h"
#include "mpi.h"

const size_t N = 90;
const size_t M = 80;


double A_x = 1.0, A_y = -sqrt(2.0);
double B_x = 1.0, B_y = sqrt(2.0);
double C_x = 3.0, C_y = sqrt(2.0);
double D_x = 3.0, D_y = -sqrt(2.0);

double stop_method = 3e-7;
// double stop_method = 26e-9;

double *operatorA_a, *operatorA_b, *operatorA_f, *extended_A, *extended_B, *extended_w, *send_buffer;

// y^2 = (x^2 - 1) / 4
double calculate_F_value_y(Point* q) {
    return (q->x * q->x - 1) / 4;
}

// x^2 = 4 * y^2 + 1
double calculate_F_value_x(Point* q) {
    return q->y * q->y * 4 + 1;
}

double* generate_grid_vector(double start, double step, size_t size) {
    double* result = new double[size];
    for (size_t i = 0; i < size; ++i) {
        result[i] = start + i * step;
    }
    return result;
}

double* grid_x;
double* grid_y;
double step_x;
double step_y;
double epsilon;
size_t global_position_x;
size_t global_position_y;
size_t global_step_x;
size_t global_step_y;
int* neighbours_ranks; // left, top, right, down
int myrank, size;

// Point(A.x + x_start * step_x, A.y + y_start * step_y), step_x, step_y, M, N, x_start, y_start, current_dimension_size_x, current_dimension_size_y, neighbours_ranks, myrank);


void init_grid() {
    step_x = (D.x - A.x) / M;
    step_y = (B.y - A.y) / N;

    int dim[2] = {};

    MPI_Dims_create(size, 2, dim);

    neighbours_ranks = new int(4);

    if (myrank / dim[0] == 0) {
        neighbours_ranks[0] = -1;
    } else {
        neighbours_ranks[0] = myrank - dim[0];
    }

    if (myrank % dim[0] == dim[0] - 1) {
        neighbours_ranks[1] = -1;
    } else {
        neighbours_ranks[1] = myrank + 1;
    }

    if (myrank / dim[0] == dim[1] - 1) {
        neighbours_ranks[2] = -1;
    } else {
        neighbours_ranks[2] = myrank + dim[0];
    }

    if (myrank % dim[0] == 0) {
        neighbours_ranks[3] = -1;
    } else {
        neighbours_ranks[3] = myrank - 1;
    }
    
    int dimension_size_y = (N + 1) / dim[0];
    int dimension_size_x = (M + 1) / dim[1];

    global_position_y = (N + 1) % dimension_size_y;
    global_position_x = (M + 1) % dimension_size_x;
    if (myrank % dim[0] < global_position_y) {
        global_position_y = myrank % dim[0];
    }
    if (myrank / dim[0] < global_position_x) {
        global_position_x = myrank / dim[0];
    }
    global_position_y += dimension_size_y * (myrank % dim[0]);
    global_position_x += dimension_size_x * (myrank / dim[0]);

    global_step_x = dimension_size_x;
    if (myrank / dim[0] < (M + 1) % dimension_size_x) {
        ++global_step_x;
    }
    global_step_y = dimension_size_y;
    if (myrank % dim[0] < (N + 1) % dimension_size_y) {
        ++global_step_y;
    }

    grid_x = generate_grid_vector(A.x + global_position_x * step_x, step_x, global_step_x);
    grid_y = generate_grid_vector(A.y + global_position_y * step_y, step_y, global_step_y);

    if (step_x > step_y) {
        epsilon = step_x;
    } else {
        epsilon = step_y;
    }
    epsilon *= epsilon;
}

void init_operator() {
    extended_A = new double[2 * (global_step_x + global_step_y)];
    extended_B = new double[2 * (global_step_x + global_step_y)];
    send_buffer = new double[2 * (global_step_x + global_step_y)];
    extended_w = new double[2 * (global_step_x + global_step_y)];
}

bool check_point_inside_D(Point* q) {
    return 1.0 < q->x && q->x < 3.0 && q->y * q->y < calculate_F_value_y(q);
}


// Here we need to calculate integral (11) for a
double calculate_a_ij(size_t i, size_t j) {
    double x = grid_x[i] - 0.5 * step_x;

    double y_min = grid_y[j] - 0.5 * step_y;
    double y_max = grid_y[j] + 0.5 * step_y;
    Point start(x, y_min);
    Point end(x, y_max);
    if (check_point_inside_D(&start) && check_point_inside_D(&end)) {
        return 1.0;
    }
    if (!check_point_inside_D(&start) && !check_point_inside_D(&end)) {
        return 1 / epsilon;
    }

    // there is intersection with hyperbola
    double intersection_y = sqrt(calculate_F_value_y(&start));

    // calculate length
    double lup = intersection_y;
    if (y_max < lup) {
        lup = y_max;
    }

    double ldown = -intersection_y;
    if (y_min > ldown) {
        ldown = y_min;
    }

    double length = lup - ldown;
    return length / step_y + (1.0 - length / step_y) / epsilon;
}

// Here we need to calculate integral (11) for b
double calculate_b_ij(size_t i, size_t j) {
    double y = grid_y[j] - 0.5 * step_y;

    double x_min = grid_x[i] - 0.5 * step_x;
    double x_max = grid_x[i] + 0.5 * step_x;
    Point start(x_min, y);
    Point end(x_max, y);
    if (check_point_inside_D(&start) && check_point_inside_D(&end)) {
        return 1.0;
    }
    if (!check_point_inside_D(&start) && !check_point_inside_D(&end)) {
        return 1 / epsilon;
    }

    // there is intersection with hyperbola
    double intersection_x = sqrt(calculate_F_value_x(&start));

    if (x_max > 3.0) {
        x_max = 3.0;
    }

    if (intersection_x < x_min) {
        intersection_x = x_min;
    }

    if (intersection_x > 3.0) {
        intersection_x = 3.0;
    }
    // in that case whe alreay know that length = x_max - intersection_x
    double length = x_max - intersection_x;

    return length / step_x + (1.0 - length / step_x) / epsilon;
}

// Here we need to calculate integral (12)
double calculate_f_ij(size_t i, size_t j) {
    if ((i + global_position_x == 0) 
        || (i + global_position_x == M)
        || (j + global_position_y == 0)
        || (j + global_position_y == N)) {
        return 0;
    }

    double y_min = grid_y[j] - 0.5 * step_y;
    double y_max = grid_y[j] + 0.5 * step_y;    

    double x_min = grid_x[i] - 0.5 * step_x;
    double x_max = grid_x[i] + 0.5 * step_x;

    // we need to process only parts of rectangle with 1.0 < x < 3.0, so we can cut it.
    if (x_min >= 3.0) {
        return 0;
    }
    if (x_max >= 3.0) {
        x_max = 3.0;
    }
    if (x_max <= 1.0) {
        return 0;
    }
    if (x_min <= 1.0) {
        x_min = 1.0;
    }
    Point A_left_down(x_min, y_min);
    Point A_left_up(x_min, y_max);
    Point A_right_up(x_max, y_max);
    Point A_right_down(x_max, y_min);
    if (check_point_inside_D(&A_left_down) && check_point_inside_D(&A_left_up)) {
        return (x_max - x_min) * (y_max - y_min) / (step_x * step_y);
    }

    if (!check_point_inside_D(&A_left_down) && !check_point_inside_D(&A_left_up) && !check_point_inside_D(&A_right_up) &&  !check_point_inside_D(&A_right_down)) {
        return 0.0;
    }

    // now check A_left_down-A_right_down intersect upper part of hyperbola

    double intersection_x = sqrt(calculate_F_value_x(&A_left_down));
    if (A_left_down.y >= 0 && A_left_down.x < intersection_x && intersection_x < A_right_down.x) {
        // first check A_right_up-A_right_down
        double intersection_y = sqrt(calculate_F_value_y(&A_right_up));
        if (intersection_y <= A_right_up.y) {
            // right-angled triangle
            return ((x_max - intersection_x) * (intersection_y - y_min) / 2) / (step_x * step_y);
        } else {
            // in this case we intersect A_left_up-A_right_up. Calculate as trapezoid
            double intersection_x_2 = sqrt(calculate_F_value_x(&A_left_up));
            return ((x_max - intersection_x_2 + x_max - intersection_x) * (y_max - y_min) / 2) / (step_x * step_y);
        }
    }

    // now check A_left_up-A_left_down intersect lower part of hyperbola

    intersection_x = sqrt(calculate_F_value_x(&A_left_up));
    if (A_left_up.y <= 0 && A_left_up.x < intersection_x && intersection_x < A_right_up.x) {
        // first check A_right_up-A_right_down
        double intersection_y = -sqrt(calculate_F_value_y(&A_right_down));
        if (intersection_y >= A_right_down.y) {
            // right-angled triangle
            return ((x_max - intersection_x) * (y_max - intersection_y) / 2) / (step_x * step_y);
        } else {
            // in this case we intersect A_left_down-A_right_down. Calculate as trapezoid
            double intersection_x_2 = sqrt(calculate_F_value_x(&A_left_down));
            return ((x_max - intersection_x_2 + x_max - intersection_x) * (y_max - y_min) / 2) / (step_x * step_y);
        }
    }

    // now segment A_left_down-A_left_up always intersect hyperbola
    // lets calculate instersection area as sum of trapezoid and rectangle
    // in case  y_min < 0 < y_max it is easier to calculate area as separate sum for each 

    double intersection_y = sqrt(calculate_F_value_y(&A_left_up));

    // calculate length of small trapezoid side
    double lup = intersection_y;
    if (y_max < lup) {
        lup = y_max;
    }
    double ldown = -intersection_y;
    if (y_min > ldown) {
        ldown = y_min;
    }
    double small_trapezoid_length = lup - ldown;
    
    // now we need to find intersections for large trapezoid side. There are two variants - A_left_up-A_right_up segment or A_right_up-A_right_down segment
    // first check A_right_up-A_right_down
    intersection_y = sqrt(calculate_F_value_y(&A_right_up));

    if (intersection_y <= A_right_up.y) {
        return ((intersection_y - A_left_down.y + small_trapezoid_length) * (x_max - x_min) / 2) / (step_x * step_y);
    }

    if (-intersection_y >= A_left_down.y) {
        return ((A_right_up.y - (-intersection_y) + small_trapezoid_length) * (x_max - x_min) / 2) / (step_x * step_y);
    }

    // now we are sure that hyperbolla intersect A_left_up-A_right_up or A_left_down-A_right_down or both
    if (y_max >= 0.0 && y_min <= 0.0) {
        double sum = 0.0;
        double intersection_y = sqrt(calculate_F_value_y(&A_left_down));
        if (y_max <= intersection_y) {
            sum += y_max * (x_max - x_min);
        } else {
            double intersection_x = sqrt(calculate_F_value_x(&A_left_up));
            sum += (intersection_y + A_left_up.y) * (intersection_x - A_left_up.x) / 2 + (A_right_up.x - intersection_x) * A_right_up.y;
        }
        if (y_min >= -intersection_y) {
            sum += -y_min * (x_max - x_min);
        } else {
            double intersection_x = sqrt(calculate_F_value_x(&A_left_down));
            sum += (-intersection_y - A_left_down.y) * (intersection_x - A_left_down.x) / 2 + (A_right_down.x - intersection_x) * (-A_right_down.y);
        }
        return sum / (step_x * step_y);
    }
    if (y_max >= 0.0) {
        double intersection_y = sqrt(calculate_F_value_y(&A_left_up));
        double intersection_x = sqrt(calculate_F_value_x(&A_left_up));
        return ((intersection_y - A_left_down.y + A_left_up.y - A_left_down.y) * (intersection_x - A_left_up.x) / 2 + (A_right_up.x - intersection_x) * (A_right_up.y - A_right_down.y)) / (step_x * step_y);
    }

    intersection_y = -sqrt(calculate_F_value_y(&A_left_down));
    intersection_x = sqrt(calculate_F_value_x(&A_left_down));
    return ((A_left_up.y - intersection_y + A_left_up.y - A_left_down.y) * (intersection_x - A_left_down.x) / 2 + (A_right_down.x - intersection_x) * (A_right_up.y - A_right_down.y)) / (step_x * step_y);
}

void generate_operatorA() {
    operatorA_a = new double[global_step_x * global_step_y];
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            operatorA_a[i * global_step_y + j] = calculate_a_ij(i, j);
        }
    }

    operatorA_b = new double[global_step_x * global_step_y];
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            operatorA_b[i * global_step_y + j] = calculate_b_ij(i, j);
        }
    }
    
    operatorA_f = new double[global_step_x * global_step_y];
    
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            operatorA_f[i * global_step_y + j] = calculate_f_ij(i, j);
        }
    }

    init_operator();
    return;
}

void extend_matrix(double* w, double* extended_w, int tag) {
    MPI_Request requests[8];
    int cnt_requests = 0;
    
    if (neighbours_ranks[0] != -1) { // left
        for (size_t j = 0; j < global_step_y; ++j) {
            send_buffer[j] = w[j];
        }
        MPI_Isend(send_buffer, global_step_y, MPI_DOUBLE, neighbours_ranks[0], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        MPI_Irecv(extended_w, global_step_y, MPI_DOUBLE, neighbours_ranks[0], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
    }

    if (neighbours_ranks[1] != -1) { // top
        for (size_t j = 0; j < global_step_x; ++j) {
            send_buffer[global_step_y + j] = w[j * global_step_y + global_step_y - 1];
        }
        MPI_Isend(&(send_buffer[global_step_y]), global_step_x, MPI_DOUBLE, neighbours_ranks[1], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        MPI_Irecv(&(extended_w[global_step_y]), global_step_x, MPI_DOUBLE, neighbours_ranks[1], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
    }

    if (neighbours_ranks[2] != -1) { // right
        for (size_t j = 0; j < global_step_y; ++j) {
            send_buffer[global_step_y + global_step_x + j] = w[(global_step_x - 1) * global_step_y + j];
        }   
        MPI_Isend(&(send_buffer[global_step_y + global_step_x]), global_step_y, MPI_DOUBLE, neighbours_ranks[2], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        MPI_Irecv(&(extended_w[global_step_y + global_step_x]), global_step_y, MPI_DOUBLE, neighbours_ranks[2], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
    }

    if (neighbours_ranks[3] != -1) { // down
        for (size_t j = 0; j < global_step_x; ++j) {
            send_buffer[2 * global_step_y + global_step_x + j] = w[global_step_y * j];
        }

        MPI_Isend(&(send_buffer[2 * global_step_y + global_step_x]), global_step_x, MPI_DOUBLE, neighbours_ranks[3], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        MPI_Irecv(&(extended_w[2 * global_step_y + global_step_x]), global_step_x, MPI_DOUBLE, neighbours_ranks[3], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
    }
    // std::cout << "Requests sent " << cnt_requests << std::endl;

    MPI_Status statuses[8];
    MPI_Waitall(cnt_requests, requests, statuses);
}

void update_neighbours() {
    extend_matrix(operatorA_a, extended_A, 0x61);
    extend_matrix(operatorA_b, extended_B, 0x62);
}

double get_by_index(double* matrix, double* extend_matrix, size_t i, size_t j) {
    if (i == -1) {
        return extend_matrix[j];
    }
    if (i == global_step_x) {
        return extend_matrix[global_step_x + global_step_y + j];
    }
    if (j == -1) {
        return extend_matrix[global_step_x + 2 * global_step_y + i];
    }
    if (j == global_step_y) {
        return extend_matrix[global_step_y + i];
    }
    return matrix[i * global_step_y + j];
}

void apply_operator(double* w, double* r, bool subtractF) {
    extend_matrix(w, extended_w, 0x63);
    // #pragma acc parallel loop
    for (size_t idx = 0; idx < global_step_x * global_step_y; ++idx) {
        int i = idx / global_step_y;
        int j = idx % global_step_y;
        if ((i + global_position_x == 0) 
            || (i + global_position_x == M)
            || (j + global_position_y == 0)
            || (j + global_position_y == N)) {
            r[i * global_step_y + j] = 0.0;
            continue;
        }

        r[i * global_step_y + j] = 
            (-1.0 / step_x) * (
                get_by_index(operatorA_a, extended_A, i + 1, j) * (get_by_index(w, extended_w, i + 1, j) - get_by_index(w, extended_w, i, j)) / step_x -
                get_by_index(operatorA_a, extended_A, i, j) * (get_by_index(w, extended_w, i, j) - get_by_index(w, extended_w, i - 1, j)) / step_x
            ) +
            (-1.0 / step_y) * (
                get_by_index(operatorA_b, extended_B, i, j + 1) * (get_by_index(w, extended_w, i, j + 1) - get_by_index(w, extended_w, i, j)) / step_y -
                get_by_index(operatorA_b, extended_B, i, j) * (get_by_index(w, extended_w, i, j) - get_by_index(w, extended_w, i, j - 1)) / step_y
            );
    }

    if (subtractF) {
        // #pragma acc parallel loop
        for (size_t idx = 0; idx < global_step_x * global_step_y; ++idx) {
            r[idx] -= operatorA_f[idx];
        }
    }
}

double scalar_product(double* a, double* b) {
    double result = 0;
    // #pragma acc parallel loop reduction(+:result)
    for (size_t idx = 0; idx < global_step_x * global_step_y; ++idx) {
        result += a[idx] * b[idx];
    }
    return step_x * step_y * result;
}

void new_w(double* w, double* r, double tau) {
    // #pragma acc parallel loop
    for (size_t idx = 0; idx < global_step_x * global_step_y; ++idx) {
        w[idx] -= tau * r[idx];
    }
}

int main(int argc, char **argv) {
    MPI_Init(NULL, NULL);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &size); 

    init_grid();

    generate_operatorA();

    update_neighbours();

    double* w = new double[global_step_x * global_step_y];
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            w[i * global_step_y + j] = 0.0;
        }
    }
    double* r = new double[global_step_x * global_step_y];
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            r[i * global_step_y + j] = 0.0;
        }
    }

    double* Ar = new double[global_step_x * global_step_y];
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            Ar[i * global_step_y + j] = 0.0;
        }
    }

    double start_time_mpi = MPI_Wtime();

    size_t it = 0;
    double error_rate;
    // #pragma acc data copy(w[:global_step_x * global_step_y], r, Ar, operatorA_a, operatorA_b, operatorA_f, extended_A, extended_B)
    // #pragma acc data copy(w[:global_step_x * global_step_y])
    do {
        apply_operator(w, r, true);
        apply_operator(r, Ar, false);

        double scalar_helper[2]; // r * r and Ar * r

        scalar_helper[0] = scalar_product(r, r);
        scalar_helper[1] = scalar_product(Ar, r);

        double scalar_results[2]; 
        MPI_Allreduce(scalar_helper, scalar_results, 2, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
        double tau = scalar_results[0] / scalar_results[1];
        new_w(w, r, tau);
        error_rate = sqrt(tau * tau * scalar_results[0]);
        it += 1;
        // std::cout << it << " " << error_rate << " " << tau << std::endl;
   } while(error_rate > stop_method);

    if (myrank == 0) {
        std::cout << it << " " << MPI_Wtime() - start_time_mpi << std::endl;
    }

    MPI_Finalize();

    return 0;
}
