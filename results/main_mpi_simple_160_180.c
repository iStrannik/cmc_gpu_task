#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <stdlib.h>
#include "mpi.h"

const size_t N = 180;
const size_t M = 160;


double A_x = 1.0;
double A_y = 2.0;
double B_x = 1.0;
double B_y = 2.0;
double C_x = 3.0;
double C_y = 2.0;
double D_x = 3.0;
double D_y = 2.0;

// double stop_method = 3e-7;
double stop_method = 26e-9;

double *operatorA_a, *operatorA_b, *operatorA_f, *extended_A, *extended_B, *extended_w, *send_buffer_w, *send_buffer_r, *recieve_buffer_r;

// y^2 = (x^2 - 1) / 4
double calculate_F_value_y(double q_x, double q_y) {
    return (q_x * q_x - 1) / 4;
}

// x^2 = 4 * y^2 + 1
double calculate_F_value_x(double q_x, double q_y) {
    return q_y * q_y * 4 + 1;
}

double* generate_grid_vector(double start, double step, size_t size) {
    double* result = (double*)malloc(size * sizeof(double));
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
    A_y = -sqrt(A_y);
    B_y = sqrt(B_y);
    C_y = sqrt(C_y);
    D_y = -sqrt(D_y);

    step_x = (D_x - A_x) / M;
    step_y = (B_y - A_y) / N;

    int dim[2] = {0, 0};

    MPI_Dims_create(size, 2, dim);

    neighbours_ranks = (int*)malloc(4 * sizeof(int));

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

    grid_x = generate_grid_vector(A_x + global_position_x * step_x, step_x, global_step_x);
    grid_y = generate_grid_vector(A_y + global_position_y * step_y, step_y, global_step_y);

    if (step_x > step_y) {
        epsilon = step_x;
    } else {
        epsilon = step_y;
    }
    epsilon *= epsilon;
}

void init_operator() {
    extended_A = (double*)malloc(sizeof(double) * 2 * (global_step_x + global_step_y));
    extended_B = (double*)malloc(sizeof(double) * 2 * (global_step_x + global_step_y));
    send_buffer_w = (double*)malloc(sizeof(double) * 2 * (global_step_x + global_step_y));
    send_buffer_r = (double*)malloc(sizeof(double) * 2 * (global_step_x + global_step_y));
    recieve_buffer_r = (double*)malloc(sizeof(double) * 2 * (global_step_x + global_step_y));
    extended_w = (double*)malloc(sizeof(double) * 2 * (global_step_x + global_step_y));
}

bool check_point_inside_D(double q_x, double q_y) {
    return 1.0 < q_x && q_x < 3.0 && q_y * q_y < calculate_F_value_y(q_x, q_y);
}


// Here we need to calculate integral (11) for a
double calculate_a_ij(size_t i, size_t j) {
    double x = grid_x[i] - 0.5 * step_x;

    double y_min = grid_y[j] - 0.5 * step_y;
    double y_max = grid_y[j] + 0.5 * step_y;
    double start_x = x;
    double start_y = y_min;
    double end_x = x;
    double end_y = y_max;
    if (check_point_inside_D(start_x, start_y) && check_point_inside_D(end_x, end_y)) {
        return 1.0;
    }
    if (!check_point_inside_D(start_x, start_y) && !check_point_inside_D(end_x, end_y)) {
        return 1 / epsilon;
    }

    // there is intersection with hyperbola
    double intersection_y = sqrt(calculate_F_value_y(start_x, start_y));

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
    double start_x = x_min;
    double start_y = y;
    double end_x = x_max;
    double end_y = y;
    if (check_point_inside_D(start_x, start_y) && check_point_inside_D(end_x, end_y)) {
        return 1.0;
    }
    if (!check_point_inside_D(start_x, start_y) && !check_point_inside_D(end_x, end_y)) {
        return 1 / epsilon;
    }

    // there is intersection with hyperbola
    double intersection_x = sqrt(calculate_F_value_x(start_x, start_y));

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
    double A_left_down_x = x_min;
    double A_left_down_y = y_min;
    double A_left_up_x = x_min;
    double A_left_up_y = y_max;
    double A_right_up_x = x_max;
    double A_right_up_y = y_max;
    double A_right_down_x = x_max;
    double A_right_down_y = y_min;
    if (check_point_inside_D(A_left_down_x, A_left_down_y) && check_point_inside_D(A_left_up_x, A_left_up_y)) {
        return (x_max - x_min) * (y_max - y_min) / (step_x * step_y);
    }

    if (!check_point_inside_D(A_left_down_x, A_left_down_y) && !check_point_inside_D(A_left_up_x, A_left_up_y) && !check_point_inside_D(A_right_up_x, A_right_up_y) &&  !check_point_inside_D(A_right_down_x, A_right_down_y)) {
        return 0.0;
    }

    // now check A_left_down-A_right_down intersect upper part of hyperbola

    double intersection_x = sqrt(calculate_F_value_x(A_left_down_x, A_left_down_y));
    if (A_left_down_y >= 0 && A_left_down_x < intersection_x && intersection_x < A_right_down_x) {
        // first check A_right_up-A_right_down
        double intersection_y = sqrt(calculate_F_value_y(A_right_up_x, A_right_up_y));
        if (intersection_y <= A_right_up_y) {
            // right-angled triangle
            return ((x_max - intersection_x) * (intersection_y - y_min) / 2) / (step_x * step_y);
        } else {
            // in this case we intersect A_left_up-A_right_up. Calculate as trapezoid
            double intersection_x_2 = sqrt(calculate_F_value_x(A_left_up_x, A_left_up_y));
            return ((x_max - intersection_x_2 + x_max - intersection_x) * (y_max - y_min) / 2) / (step_x * step_y);
        }
    }

    // now check A_left_up-A_left_down intersect lower part of hyperbola

    intersection_x = sqrt(calculate_F_value_x(A_left_up_x, A_left_up_y));
    if (A_left_up_y <= 0 && A_left_up_x < intersection_x && intersection_x < A_right_up_x) {
        // first check A_right_up-A_right_down
        double intersection_y = -sqrt(calculate_F_value_y(A_right_down_x, A_right_down_y));
        if (intersection_y >= A_right_down_y) {
            // right-angled triangle
            return ((x_max - intersection_x) * (y_max - intersection_y) / 2) / (step_x * step_y);
        } else {
            // in this case we intersect A_left_down-A_right_down. Calculate as trapezoid
            double intersection_x_2 = sqrt(calculate_F_value_x(A_left_down_x, A_left_down_y));
            return ((x_max - intersection_x_2 + x_max - intersection_x) * (y_max - y_min) / 2) / (step_x * step_y);
        }
    }

    // now segment A_left_down-A_left_up always intersect hyperbola
    // lets calculate instersection area as sum of trapezoid and rectangle
    // in case  y_min < 0 < y_max it is easier to calculate area as separate sum for each 

    double intersection_y = sqrt(calculate_F_value_y(A_left_up_x, A_left_up_y));

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
    intersection_y = sqrt(calculate_F_value_y(A_right_up_x, A_right_up_y));

    if (intersection_y <= A_right_up_y) {
        return ((intersection_y - A_left_down_y + small_trapezoid_length) * (x_max - x_min) / 2) / (step_x * step_y);
    }

    if (-intersection_y >= A_left_down_y) {
        return ((A_right_up_y - (-intersection_y) + small_trapezoid_length) * (x_max - x_min) / 2) / (step_x * step_y);
    }

    // now we are sure that hyperbolla intersect A_left_up-A_right_up or A_left_down-A_right_down or both
    if (y_max >= 0.0 && y_min <= 0.0) {
        double sum = 0.0;
        double intersection_y = sqrt(calculate_F_value_y(A_left_down_x, A_left_down_y));
        if (y_max <= intersection_y) {
            sum += y_max * (x_max - x_min);
        } else {
            double intersection_x = sqrt(calculate_F_value_x(A_left_up_x, A_left_up_y));
            sum += (intersection_y + A_left_up_y) * (intersection_x - A_left_up_x) / 2 + (A_right_up_x - intersection_x) * A_right_up_y;
        }
        if (y_min >= -intersection_y) {
            sum += -y_min * (x_max - x_min);
        } else {
            double intersection_x = sqrt(calculate_F_value_x(A_left_down_x, A_left_down_y));
            sum += (-intersection_y - A_left_down_y) * (intersection_x - A_left_down_x) / 2 + (A_right_down_x - intersection_x) * (-A_right_down_y);
        }
        return sum / (step_x * step_y);
    }
    if (y_max >= 0.0) {
        double intersection_y = sqrt(calculate_F_value_y(A_left_up_x, A_left_up_y));
        double intersection_x = sqrt(calculate_F_value_x(A_left_up_x, A_left_up_y));
        return ((intersection_y - A_left_down_y + A_left_up_y - A_left_down_y) * (intersection_x - A_left_up_x) / 2 + (A_right_up_x - intersection_x) * (A_right_up_y - A_right_down_y)) / (step_x * step_y);
    }

    intersection_y = -sqrt(calculate_F_value_y(A_left_down_x, A_left_down_y));
    intersection_x = sqrt(calculate_F_value_x(A_left_down_x, A_left_down_y));
    return ((A_left_up_y - intersection_y + A_left_up_y - A_left_down_y) * (intersection_x - A_left_down_x) / 2 + (A_right_down_x - intersection_x) * (A_right_up_y - A_right_down_y)) / (step_x * step_y);
}

void generate_operatorA() {
    operatorA_a = (double*)malloc(sizeof(double) * global_step_x * global_step_y);
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            operatorA_a[i * global_step_y + j] = calculate_a_ij(i, j);
        }
    }

    operatorA_b = (double*)malloc(sizeof(double) * global_step_x * global_step_y);
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            operatorA_b[i * global_step_y + j] = calculate_b_ij(i, j);
        }
    }
    
    operatorA_f = (double*)malloc(sizeof(double) * global_step_x * global_step_y);
    
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
            send_buffer_w[j] = w[j];
        }
        MPI_Isend(send_buffer_w, global_step_y, MPI_DOUBLE, neighbours_ranks[0], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        MPI_Irecv(extended_w, global_step_y, MPI_DOUBLE, neighbours_ranks[0], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
    }

    if (neighbours_ranks[1] != -1) { // top
        for (size_t j = 0; j < global_step_x; ++j) {
            send_buffer_w[global_step_y + j] = w[j * global_step_y + global_step_y - 1];
        }
        MPI_Isend(&(send_buffer_w[global_step_y]), global_step_x, MPI_DOUBLE, neighbours_ranks[1], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        MPI_Irecv(&(extended_w[global_step_y]), global_step_x, MPI_DOUBLE, neighbours_ranks[1], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
    }

    if (neighbours_ranks[2] != -1) { // right
        for (size_t j = 0; j < global_step_y; ++j) {
            send_buffer_w[global_step_y + global_step_x + j] = w[(global_step_x - 1) * global_step_y + j];
        }   
        MPI_Isend(&(send_buffer_w[global_step_y + global_step_x]), global_step_y, MPI_DOUBLE, neighbours_ranks[2], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        MPI_Irecv(&(extended_w[global_step_y + global_step_x]), global_step_y, MPI_DOUBLE, neighbours_ranks[2], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
    }

    if (neighbours_ranks[3] != -1) { // down
        for (size_t j = 0; j < global_step_x; ++j) {
            send_buffer_w[2 * global_step_y + global_step_x + j] = w[global_step_y * j];
        }

        MPI_Isend(&(send_buffer_w[2 * global_step_y + global_step_x]), global_step_x, MPI_DOUBLE, neighbours_ranks[3], tag, MPI_COMM_WORLD, &(requests[cnt_requests++]));
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

double get_by_index(double* matrix, double* extend_matrix, size_t i, size_t j, size_t global_step_x, size_t global_step_y) {
    return i == -1 ? extend_matrix[j] : (i == global_step_x ? extend_matrix[global_step_x + global_step_y + j] : (j == -1 ? extend_matrix[global_step_x + 2 * global_step_y + i] : (j == global_step_y ? extend_matrix[global_step_y + i] : matrix[i * global_step_y + j])));
}

int main(int argc, char **argv) {
    MPI_Init(NULL, NULL);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    printf("%d %d\n", myrank,  size);

    init_grid();

    generate_operatorA();

    update_neighbours();

    double* w = (double*)malloc(sizeof(double) * global_step_x * global_step_y);
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            w[i * global_step_y + j] = 0.0;
        }
    }
    double* r = (double*)malloc(sizeof(double) * global_step_x * global_step_y);
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            r[i * global_step_y + j] = 0.0;
        }
    }

    double* Ar = (double*)malloc(sizeof(double) * global_step_x * global_step_y);
    for (size_t i = 0; i < global_step_x; ++i) {
        for (size_t j = 0; j < global_step_y; ++j) {
            Ar[i * global_step_y + j] = 0.0;
        }
    }

    for (size_t idx = 0; idx < 2 * (global_step_x + global_step_y); ++idx) {
        extended_w[idx] = 0.0;
    }

    for (size_t idx = 0; idx < 2 * (global_step_x + global_step_y); ++idx) {
        recieve_buffer_r[idx] = 0.0;
    }

    double start_time_mpi = MPI_Wtime();

    double time_AW = 0;
    double time_update_to_host_r = 0;
    double time_scalar_r_r = 0;
    double time_asycn_send = 0;
    double time_update_to_device_r = 0;
    double time_Ar = 0;
    double time_scalar_Ar_r = 0;
    double time_tau = 0;
    double time_new_w = 0;

    size_t it = 0;
    double error_rate;
    double tau = 0.0;
    // #pragma acc data copy(w[0:global_step_x * global_step_y], r[0:global_step_x * global_step_y], Ar[0:global_step_x * global_step_y], operatorA_a[0:global_step_x * global_step_y], operatorA_b[0:global_step_x * global_step_y], operatorA_f[0:global_step_x * global_step_y], extended_A[0:2 * (global_step_x + global_step_y)], extended_B[0:2 * (global_step_x + global_step_y)], extended_w[0:2 * (global_step_x + global_step_y)], recieve_buffer_r[0:2 * (global_step_x + global_step_y)], send_buffer_r[0:2 * (global_step_x + global_step_y)])
    do {
        double time_AW_start = MPI_Wtime();
        { // apply_operator(w, r, true);    
            // #pragma acc parallel loop
            for (size_t idx = 0; idx < global_step_x * global_step_y; ++idx) {
                int i = idx / global_step_y;
                int j = idx % global_step_y;
                if ((i + global_position_x == 0) 
                    || (i + global_position_x == M)
                    || (j + global_position_y == 0)
                    || (j + global_position_y == N)) {
                    r[idx] = 0.0;
                    continue;
                }

                r[idx] = 
                    (-1.0 / step_x) * (
                        get_by_index(operatorA_a, extended_A, i + 1, j, global_step_x, global_step_y)
                         * (get_by_index(w, extended_w, i + 1, j, global_step_x, global_step_y)
                         - get_by_index(w, extended_w, i, j, global_step_x, global_step_y)) / step_x -
                        get_by_index(operatorA_a, extended_A, i, j, global_step_x, global_step_y) 
                        * (get_by_index(w, extended_w, i, j, global_step_x, global_step_y)
                        - get_by_index(w, extended_w, i - 1, j, global_step_x, global_step_y)) / step_x
                    ) +
                    (-1.0 / step_y) * (
                        get_by_index(operatorA_b, extended_B, i, j + 1, global_step_x, global_step_y) * (get_by_index(w, extended_w, i, j + 1, global_step_x, global_step_y) - get_by_index(w, extended_w, i, j, global_step_x, global_step_y)) / step_y -
                        get_by_index(operatorA_b, extended_B, i, j, global_step_x, global_step_y) * (get_by_index(w, extended_w, i, j, global_step_x, global_step_y) - get_by_index(w, extended_w, i, j - 1, global_step_x, global_step_y)) / step_y
                    );
                r[idx] -= operatorA_f[idx];
                if (i == 0) {
                    send_buffer_r[j] = r[idx];
                }
                if (j == global_step_y - 1) {
                    send_buffer_r[global_step_y + i] = r[idx];
                }
                if (i == global_step_x - 1) {
                    send_buffer_r[global_step_y + global_step_x + j] = r[idx];
                }
                if (j == 0) {
                    send_buffer_r[2 * global_step_y + global_step_x + i] = r[idx];
                }
            }
        }
        time_AW += MPI_Wtime() - time_AW_start;

        double time_update_to_host_r_start = MPI_Wtime();
        // apply_operator(r, Ar, false);
        // #pragma acc update self(send_buffer_r[0:2 * (global_step_x + global_step_y)])

        time_update_to_host_r += MPI_Wtime() - time_update_to_host_r_start;

        MPI_Request requests[8];
        int cnt_requests = 0;
        if (neighbours_ranks[0] != -1) { // left
            MPI_Isend(send_buffer_r, global_step_y, MPI_DOUBLE, neighbours_ranks[0], 0x63, MPI_COMM_WORLD, &(requests[cnt_requests++]));
            MPI_Irecv(recieve_buffer_r, global_step_y, MPI_DOUBLE, neighbours_ranks[0], 0x63, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        }
        if (neighbours_ranks[1] != -1) { // top
            MPI_Isend(&(send_buffer_r[global_step_y]), global_step_x, MPI_DOUBLE, neighbours_ranks[1], 0x63, MPI_COMM_WORLD, &(requests[cnt_requests++]));
            MPI_Irecv(&(recieve_buffer_r[global_step_y]), global_step_x, MPI_DOUBLE, neighbours_ranks[1], 0x63, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        }
        if (neighbours_ranks[2] != -1) { // right
            MPI_Isend(&(send_buffer_r[global_step_y + global_step_x]), global_step_y, MPI_DOUBLE, neighbours_ranks[2], 0x63, MPI_COMM_WORLD, &(requests[cnt_requests++]));
            MPI_Irecv(&(recieve_buffer_r[global_step_y + global_step_x]), global_step_y, MPI_DOUBLE, neighbours_ranks[2], 0x63, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        }
        if (neighbours_ranks[3] != -1) { // down
            MPI_Isend(&(send_buffer_r[2 * global_step_y + global_step_x]), global_step_x, MPI_DOUBLE, neighbours_ranks[3], 0x63, MPI_COMM_WORLD, &(requests[cnt_requests++]));
            MPI_Irecv(&(recieve_buffer_r[2 * global_step_y + global_step_x]), global_step_x, MPI_DOUBLE, neighbours_ranks[3], 0x63, MPI_COMM_WORLD, &(requests[cnt_requests++]));
        }

        double scalar_helper[2]; // r * r and Ar * r

        double time_scalar_r_r_start = MPI_Wtime();
        double result = 0;
        // #pragma acc parallel loop reduction(+:result)
        for (size_t idx = 0; idx < global_step_x * global_step_y; ++idx) {
            result += r[idx] * r[idx];
        }
        time_scalar_r_r += MPI_Wtime() - time_scalar_r_r_start;
        double time_asycn_send_waiting = MPI_Wtime();
        
        scalar_helper[0] =  step_x * step_y * result;
        MPI_Status statuses[8];
        MPI_Waitall(cnt_requests, requests, statuses);
        time_asycn_send += MPI_Wtime() - time_asycn_send_waiting;

        double time_update_to_device_r_start = MPI_Wtime();
        // #pragma acc update device(recieve_buffer_r[0:2 * (global_step_x + global_step_y)])
        time_update_to_device_r += MPI_Wtime() - time_update_to_device_r_start;

        double time_Ar_start = MPI_Wtime();
        // #pragma acc parallel loop
        for (size_t idx = 0; idx < global_step_x * global_step_y; ++idx) {
            int i = idx / global_step_y;
            int j = idx % global_step_y;
            if ((i + global_position_x == 0) 
                || (i + global_position_x == M)
                || (j + global_position_y == 0)
                || (j + global_position_y == N)) {
                Ar[idx] = 0.0;
                continue;
            }

            Ar[idx] = 
                (-1.0 / step_x) * (
                    get_by_index(operatorA_a, extended_A, i + 1, j, global_step_x, global_step_y) * (get_by_index(r, recieve_buffer_r, i + 1, j, global_step_x, global_step_y) - get_by_index(r, recieve_buffer_r, i, j, global_step_x, global_step_y)) / step_x -
                    get_by_index(operatorA_a, extended_A, i, j, global_step_x, global_step_y) * (get_by_index(r, recieve_buffer_r, i, j, global_step_x, global_step_y) - get_by_index(r, recieve_buffer_r, i - 1, j, global_step_x, global_step_y)) / step_x
                ) +
                (-1.0 / step_y) * (
                    get_by_index(operatorA_b, extended_B, i, j + 1, global_step_x, global_step_y) * (get_by_index(r, recieve_buffer_r, i, j + 1, global_step_x, global_step_y) - get_by_index(r, recieve_buffer_r, i, j, global_step_x, global_step_y)) / step_y -
                    get_by_index(operatorA_b, extended_B, i, j, global_step_x, global_step_y) * (get_by_index(r, recieve_buffer_r, i, j, global_step_x, global_step_y) - get_by_index(r, recieve_buffer_r, i, j - 1, global_step_x, global_step_y)) / step_y
                );
        }
        time_Ar += MPI_Wtime()- time_Ar_start;

        result = 0;
        double time_scalar_Ar_r_start = MPI_Wtime();
        // #pragma acc parallel loop reduction(+:result)
        for (size_t idx = 0; idx < global_step_x * global_step_y; ++idx) {
            result += Ar[idx] * r[idx];
        }
        time_scalar_Ar_r += MPI_Wtime() - time_scalar_Ar_r_start;
        scalar_helper[1] =  step_x * step_y * result;


        double time_tau_start = MPI_Wtime();
        double scalar_results[2]; 
        MPI_Allreduce(scalar_helper, scalar_results, 2, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
        tau = scalar_results[0] / scalar_results[1];
        time_tau += MPI_Wtime() - time_tau_start;

        double time_new_w_start = MPI_Wtime();
        // #pragma acc parallel loop
        for (size_t idx = 0; idx < global_step_x * global_step_y; ++idx) {
            w[idx] -= tau * r[idx];
            if (idx < 2 * (global_step_x + global_step_y)) {
                extended_w[idx] -= tau * recieve_buffer_r[idx];
            }
        }
        time_new_w += MPI_Wtime() - time_new_w_start;
        error_rate = sqrt(tau * tau * scalar_results[0]);
        it += 1;
        // std::cout << it << " " << error_rate << " " << tau << std::endl;
   } while(error_rate > stop_method);

    if (myrank == 0) {
        printf("%ld %f\n", it,  MPI_Wtime() - start_time_mpi);
        printf("time_AW = %f\n", time_AW);
        printf("time_update_to_host_r = %f\n", time_update_to_host_r);
        printf("time_scalar_r_r = %f\n", time_scalar_r_r);
        printf("time_asycn_send = %f\n", time_asycn_send);
        printf("time_update_to_device_r = %f\n", time_update_to_device_r);
        printf("time_Ar = %f\n", time_Ar);
        printf("time_scalar_Ar_r = %f\n", time_scalar_Ar_r);
        printf("time_tau = %f\n", time_tau);
        printf("time_new_w = %f\n", time_new_w);
    }

    MPI_Finalize();

    return 0;
}
