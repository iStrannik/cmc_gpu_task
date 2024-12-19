#include <stdio.h>
#include <iostream>
#include <math.h>
#include <iomanip>
#include <chrono>
#include <fstream>
#include "mpi.h"

const size_t N = 180;
const size_t M = 160;

struct Point {
    double x;
    double y;

    Point(double x, double y) {
        this->x = x;
        this->y = y;
    }
};

Point A = Point(1.0, -sqrt(2.0));
Point B = Point(1.0, sqrt(2.0));
Point C = Point(3.0, sqrt(2.0));
Point D = Point(3.0, -sqrt(2.0));

// double stop_method = 3e-7;
double stop_method = 26e-9;

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
    // #pragma omp parallel for
    for (size_t i = 0; i < size; ++i) {
        result[i] = start + i * step;
    }
    return result;
}

struct Grid{
    double* grid_x;
    double* grid_y;
    double step_x;
    double step_y;
    double epsilon;
    size_t global_position_x;
    size_t global_position_y;
    size_t global_step_x;
    size_t global_step_y;
    size_t N;
    size_t M;
    int* neighbours_ranks; // left, top, right, down
    int myrank;
    Grid(Point start, double step_x, double step_y, size_t M, size_t N, size_t global_position_x, size_t global_position_y, size_t global_step_x, size_t global_step_y, int* neighbours_ranks, int myrank) {
        this->step_x = step_x;
        this->step_y = step_y;
        this->M = M;
        this->N = N;
        this->grid_x = generate_grid_vector(start.x, step_x, global_step_x);
        this->grid_y = generate_grid_vector(start.y, step_y, global_step_y);
        this->global_position_x = global_position_x;
        this->global_position_y = global_position_y;
        this->global_step_x = global_step_x;
        this->global_step_y = global_step_y;
        if (this->step_x > this->step_y) {
            this->epsilon = this->step_x;
        } else {
            this->epsilon = this->step_y;
        }
        this->epsilon *= this->epsilon;
        this->neighbours_ranks = neighbours_ranks;
        this->myrank = myrank;
    }
};

struct Operator{
    double* operatorA_a;
    double* operatorA_b;
    double* operatorA_f;
    double* extended_A; // left, top, right, down
    double* extended_B; // left, top, right, down
    Grid* grid;
    double* send_buffer;
    double* extended_w;
    Operator(double* operatorA_a, double* operatorA_b, double* operatorA_f, Grid* grid) {
        this->operatorA_a = operatorA_a;
        this->operatorA_b = operatorA_b;
        this->operatorA_f = operatorA_f;
        this->grid = grid;
        this->extended_A = new double[2 * (grid->global_step_x + grid->global_step_y)];
        this->extended_B = new double[2 * (grid->global_step_x + grid->global_step_y)];
        this->send_buffer = new double[std::max(grid->global_step_x, grid->global_step_y)];
        this->extended_w = new double[2 * (grid->global_step_x + grid->global_step_y)];
    }
};

bool check_point_inside_D(Point* q) {
    return 1.0 < q->x && q->x < 3.0 && q->y * q->y < calculate_F_value_y(q);
}


// Here we need to calculate integral (11) for a
double calculate_a_ij(size_t i, size_t j, Grid* grid) {
    double x = grid->grid_x[i] - 0.5 * grid->step_x;

    double y_min = grid->grid_y[j] - 0.5 * grid->step_y;
    double y_max = grid->grid_y[j] + 0.5 * grid->step_y;
    Point start(x, y_min);
    Point end(x, y_max);
    if (check_point_inside_D(&start) && check_point_inside_D(&end)) {
        return 1.0;
    }
    if (!check_point_inside_D(&start) && !check_point_inside_D(&end)) {
        return 1 / grid->epsilon;
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
    return length / grid->step_y + (1.0 - length / grid->step_y) / grid->epsilon;
}

// Here we need to calculate integral (11) for b
double calculate_b_ij(size_t i, size_t j, Grid* grid) {
    /*
    if (i == 0 || i == grid->M || j == 0 || j == grid->N) {
        return 0;
    }
    */

    double y = grid->grid_y[j] - 0.5 * grid->step_y;

    double x_min = grid->grid_x[i] - 0.5 * grid->step_x;
    double x_max = grid->grid_x[i] + 0.5 * grid->step_x;
    Point start(x_min, y);
    Point end(x_max, y);
    if (check_point_inside_D(&start) && check_point_inside_D(&end)) {
        return 1.0;
    }
    if (!check_point_inside_D(&start) && !check_point_inside_D(&end)) {
        return 1 / grid->epsilon;
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

    return length / grid->step_x + (1.0 - length / grid->step_x) / grid->epsilon;
}

// Here we need to calculate integral (12)
double calculate_f_ij(size_t i, size_t j, Grid* grid) {
    if ((i + grid->global_position_x == 0) 
        || (i + grid->global_position_x == grid->M)
        || (j + grid->global_position_y == 0)
        || (j + grid->global_position_y == grid->N)) {
        return 0;
    }

    double y_min = grid->grid_y[j] - 0.5 * grid->step_y;
    double y_max = grid->grid_y[j] + 0.5 * grid->step_y;    

    double x_min = grid->grid_x[i] - 0.5 * grid->step_x;
    double x_max = grid->grid_x[i] + 0.5 * grid->step_x;

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
        return (x_max - x_min) * (y_max - y_min) / (grid->step_x * grid->step_y);
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
            return ((x_max - intersection_x) * (intersection_y - y_min) / 2) / (grid->step_x * grid->step_y);
        } else {
            // in this case we intersect A_left_up-A_right_up. Calculate as trapezoid
            double intersection_x_2 = sqrt(calculate_F_value_x(&A_left_up));
            return ((x_max - intersection_x_2 + x_max - intersection_x) * (y_max - y_min) / 2) / (grid->step_x * grid->step_y);
        }
    }

    // now check A_left_up-A_left_down intersect lower part of hyperbola

    intersection_x = sqrt(calculate_F_value_x(&A_left_up));
    if (A_left_up.y <= 0 && A_left_up.x < intersection_x && intersection_x < A_right_up.x) {
        // first check A_right_up-A_right_down
        double intersection_y = -sqrt(calculate_F_value_y(&A_right_down));
        if (intersection_y >= A_right_down.y) {
            // right-angled triangle
            return ((x_max - intersection_x) * (y_max - intersection_y) / 2) / (grid->step_x * grid->step_y);
        } else {
            // in this case we intersect A_left_down-A_right_down. Calculate as trapezoid
            double intersection_x_2 = sqrt(calculate_F_value_x(&A_left_down));
            return ((x_max - intersection_x_2 + x_max - intersection_x) * (y_max - y_min) / 2) / (grid->step_x * grid->step_y);
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
        return ((intersection_y - A_left_down.y + small_trapezoid_length) * (x_max - x_min) / 2) / (grid->step_x * grid->step_y);
    }

    if (-intersection_y >= A_left_down.y) {
        return ((A_right_up.y - (-intersection_y) + small_trapezoid_length) * (x_max - x_min) / 2) / (grid->step_x * grid->step_y);
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
        return sum / (grid->step_x * grid->step_y);
    }
    if (y_max >= 0.0) {
        double intersection_y = sqrt(calculate_F_value_y(&A_left_up));
        double intersection_x = sqrt(calculate_F_value_x(&A_left_up));
        return ((intersection_y - A_left_down.y + A_left_up.y - A_left_down.y) * (intersection_x - A_left_up.x) / 2 + (A_right_up.x - intersection_x) * (A_right_up.y - A_right_down.y)) / (grid->step_x * grid->step_y);
    }

    intersection_y = -sqrt(calculate_F_value_y(&A_left_down));
    intersection_x = sqrt(calculate_F_value_x(&A_left_down));
    return ((A_left_up.y - intersection_y + A_left_up.y - A_left_down.y) * (intersection_x - A_left_down.x) / 2 + (A_right_down.x - intersection_x) * (A_right_up.y - A_right_down.y)) / (grid->step_x * grid->step_y);
}

Operator* generate_operatorA(Grid* grid) {
    double* operatorA_a = new double[grid->global_step_x * grid->global_step_y];
    // #pragma omp parallel for collapse(2)
    for (size_t i = 0; i < grid->global_step_x; ++i) {
        for (size_t j = 0; j < grid->global_step_y; ++j) {
            operatorA_a[i * grid->global_step_y + j] = calculate_a_ij(i, j, grid);
        }
    }

    double* operatorA_b = new double[grid->global_step_x * grid->global_step_y];
    // #pragma omp parallel for collapse(2)
    for (size_t i = 0; i < grid->global_step_x; ++i) {
        for (size_t j = 0; j < grid->global_step_y; ++j) {
            operatorA_b[i * grid->global_step_y + j] = calculate_b_ij(i, j, grid);
        }
    }
    
    double* operatorA_f = new double[grid->global_step_x * grid->global_step_y];
    
    // #pragma omp parallel for collapse(2)
    for (size_t i = 0; i < grid->global_step_x; ++i) {
        for (size_t j = 0; j < grid->global_step_y; ++j) {
            operatorA_f[i * grid->global_step_y + j] = calculate_f_ij(i, j, grid);
        }
    }

    return new Operator(operatorA_a, operatorA_b, operatorA_f, grid);
}

void extend_matrix(Operator* A, double* w, double* extended_w, int tag) {
    MPI_Status status;
    if (A->grid->neighbours_ranks[0] != -1) { // left
        for (size_t j = 0; j < A->grid->global_step_y; ++j) {
            A->send_buffer[j] = w[j];
        }
        MPI_Sendrecv(A->send_buffer, A->grid->global_step_y, MPI_DOUBLE, A->grid->neighbours_ranks[0], tag, 
                     extended_w, A->grid->global_step_y, MPI_DOUBLE, A->grid->neighbours_ranks[0], tag, 
                    MPI_COMM_WORLD, &status);
    }

    if (A->grid->neighbours_ranks[1] != -1) { // top
        for (size_t j = 0; j < A->grid->global_step_x; ++j) {
            A->send_buffer[j] = w[j * A->grid->global_step_y + A->grid->global_step_y - 1];
        }

        MPI_Sendrecv(A->send_buffer, A->grid->global_step_x, MPI_DOUBLE, A->grid->neighbours_ranks[1], tag, 
                        &(extended_w[A->grid->global_step_y]), A->grid->global_step_x, MPI_DOUBLE, A->grid->neighbours_ranks[1], tag, 
                        MPI_COMM_WORLD, &status);
    }

    if (A->grid->neighbours_ranks[2] != -1) { // right
        for (size_t j = 0; j < A->grid->global_step_y; ++j) {
            A->send_buffer[j] = w[(A->grid->global_step_x - 1) * A->grid->global_step_y + j];
        }
        MPI_Sendrecv(A->send_buffer, A->grid->global_step_y, MPI_DOUBLE, A->grid->neighbours_ranks[2], tag, 
                        &(extended_w[A->grid->global_step_y + A->grid->global_step_x]), A->grid->global_step_y, MPI_DOUBLE, A->grid->neighbours_ranks[2], tag, 
                        MPI_COMM_WORLD, &status);
    }

    if (A->grid->neighbours_ranks[3] != -1) { // down
        for (size_t j = 0; j < A->grid->global_step_x; ++j) {
            A->send_buffer[j] = w[A->grid->global_step_y * j];
        }

        MPI_Sendrecv(A->send_buffer, A->grid->global_step_x, MPI_DOUBLE, A->grid->neighbours_ranks[3], tag, 
                        &(extended_w[2 * A->grid->global_step_y + A->grid->global_step_x]), A->grid->global_step_x, MPI_DOUBLE, A->grid->neighbours_ranks[3], tag, 
                        MPI_COMM_WORLD, &status);
    }
}

void update_neighbours(Operator* A) {
    extend_matrix(A, A->operatorA_a, A->extended_A, 0x61);
    extend_matrix(A, A->operatorA_b, A->extended_B, 0x62);
}

double get_by_index(Operator* A, double* matrix, double* extend_matrix, size_t i, size_t j) {
    if (i == -1) {
        return extend_matrix[j];
    }
    if (i == A->grid->global_step_x) {
        return extend_matrix[A->grid->global_step_x + A->grid->global_step_y + j];
    }
    if (j == -1) {
        return extend_matrix[A->grid->global_step_x + 2 * A->grid->global_step_y + i];
    }
    if (j == A->grid->global_step_y) {
        return extend_matrix[A->grid->global_step_y + i];
    }
    return matrix[i * A->grid->global_step_y + j];
}

void apply_operator(Operator* A, double* w, double* r, bool subtractF) {
    extend_matrix(A, w, A->extended_w, 0x63);
    // #pragma omp parallel for collapse(2)
    for (size_t i = 0; i < A->grid->global_step_x; ++i) {
        for (size_t j = 0; j < A->grid->global_step_y; ++j) {
            if ((i + A->grid->global_position_x == 0) 
                || (i + A->grid->global_position_x == A->grid->M)
                || (j + A->grid->global_position_y == 0)
                || (j + A->grid->global_position_y == A->grid->N)) {
                r[i * A->grid->global_step_y + j] = 0.0;
                continue;
            }

            r[i * A->grid->global_step_y + j] = 
                (-1.0 / A->grid->step_x) * (
                    get_by_index(A, A->operatorA_a, A->extended_A, i + 1, j) * (get_by_index(A, w, A->extended_w, i + 1, j) - get_by_index(A, w, A->extended_w, i, j)) / A->grid->step_x -
                    get_by_index(A, A->operatorA_a, A->extended_A, i, j) * (get_by_index(A, w, A->extended_w, i, j) - get_by_index(A, w, A->extended_w, i - 1, j)) / A->grid->step_x
                ) +
                (-1.0 / A->grid->step_y) * (
                    get_by_index(A, A->operatorA_b, A->extended_B, i, j + 1) * (get_by_index(A, w, A->extended_w, i, j + 1) - get_by_index(A, w, A->extended_w, i, j)) / A->grid->step_y -
                    get_by_index(A, A->operatorA_b, A->extended_B, i, j) * (get_by_index(A, w, A->extended_w, i, j) - get_by_index(A, w, A->extended_w, i, j - 1)) / A->grid->step_y
                );
        }
    }
    if (subtractF) {
        // #pragma omp parallel for collapse(2)
        for (size_t i = 0; i < A->grid->global_step_x; ++i) {
            for (size_t j = 0; j < A->grid->global_step_y; ++j) {
                if ((i + A->grid->global_position_x == 0) 
                    || (i + A->grid->global_position_x == A->grid->M)
                    || (j + A->grid->global_position_y == 0)
                    || (j + A->grid->global_position_y == A->grid->N)) {
                    r[i * A->grid->global_step_y + j] = 0.0;
                    continue;
                }
                r[i * A->grid->global_step_y + j] -= A->operatorA_f[i * A->grid->global_step_y + j];
            }
        }
    }
}

double scalar_product(double* a, double* b, Grid* grid) {
    double result = 0;
    // #pragma omp parallel for reduction (+: result)
    for (size_t i = 0; i < grid->global_step_x; ++i) {
        double sum = 0.0;
        for (size_t j = 0; j < grid->global_step_y; ++j) {
            sum += a[i * grid->global_step_y + j] * b[i * grid->global_step_y + j];
        }
        result += sum;
    }
    return grid->step_x * grid->step_y * result;
}

void new_w(double* w, double* r, double tau, Grid* grid) {
    // #pragma omp parallel for collapse(2)
    for (size_t i = 0; i < grid->global_step_x; ++i) {
        for (size_t j = 0; j < grid->global_step_y; ++j) {
            w[i * grid->global_step_y + j] -= tau * r[i * grid->global_step_y + j];
        }
    }
}

int main(int argc, char **argv) {
    int size, myrank;
    MPI_Init(NULL, NULL);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &size); 

    double step_x = (D.x - A.x) / M;
    double step_y = (B.y - A.y) / N;

    int dim[2] = {};

    MPI_Dims_create(size, 2, dim);

    // std::cout << myrank << " " << dim[0] << " " << dim[1] << std::endl;

    if (dim[0] * dim[1] < size) {
        return 1;
    }
    
    // example for splitting x side - (a + 1) (a + 1) (a + 1) a a totally 3 * (a + 1) + 2 * a = N + 1
    // and all constraints satisfied

    int* neighbours_ranks = new int(4);

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
    int y_start = (N + 1) % dimension_size_y;
    int x_start = (M + 1) % dimension_size_x;

    if (myrank % dim[0] < y_start) {
        y_start = myrank % dim[0];
    }
    if (myrank / dim[0] < x_start) {
        x_start = myrank / dim[0];
    }
    y_start += dimension_size_y * (myrank % dim[0]);
    x_start += dimension_size_x * (myrank / dim[0]);

    int current_dimension_size_x = dimension_size_x;
    if (myrank / dim[0] < (M + 1) % dimension_size_x) {
        ++current_dimension_size_x;
    }

    int current_dimension_size_y = dimension_size_y;
    if (myrank % dim[0] < (N + 1) % dimension_size_y) {
        ++current_dimension_size_y;
    }

    Grid grid = Grid(Point(A.x + x_start * step_x, A.y + y_start * step_y), step_x, step_y, M, N, x_start, y_start, current_dimension_size_x, current_dimension_size_y, neighbours_ranks, myrank);

    Operator* operatorA = generate_operatorA(&grid);

    update_neighbours(operatorA);

    double* w = new double[grid.global_step_x * grid.global_step_y];
    // #pragma omp parallel for collapse(2)
    for (size_t i = 0; i < grid.global_step_x; ++i) {
        for (size_t j = 0; j < grid.global_step_y; ++j) {
            w[i * grid.global_step_y + j] = 0.0;
        }
    }
    double* r = new double[grid.global_step_x * grid.global_step_y];
    // #pragma omp parallel for collapse(2)
    for (size_t i = 0; i < grid.global_step_x; ++i) {
        for (size_t j = 0; j < grid.global_step_y; ++j) {
            r[i * grid.global_step_y + j] = 0.0;
        }
    }

    double* Ar = new double[grid.global_step_x * grid.global_step_y];
    // #pragma omp parallel for collapse(2)
    for (size_t i = 0; i < grid.global_step_x; ++i) {
        for (size_t j = 0; j < grid.global_step_y; ++j) {
            Ar[i * grid.global_step_y + j] = 0.0;
        }
    }

    std::chrono::steady_clock::time_point startTime = std::chrono::steady_clock::now();
    double start_time_mpi = MPI_Wtime();

    size_t it = 0;
    double error_rate;
    do {
        apply_operator(operatorA, w, r, true);
        apply_operator(operatorA, r, Ar, false);

        double scalar_helper[2]; // r * r and Ar * r

        scalar_helper[0] = scalar_product(r, r, &grid);
        scalar_helper[1] = scalar_product(Ar, r, &grid);

        double scalar_results[2]; 
        MPI_Allreduce(scalar_helper, scalar_results, 2, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
        double tau = scalar_results[0] / scalar_results[1];
        new_w(w, r, tau, &grid);
        error_rate = sqrt(tau * tau * scalar_results[0]);
        it += 1;
        // std::cout << it << " " << error_rate << " " << tau << std::endl;
   } while(error_rate > stop_method);

    std::chrono::steady_clock::time_point endTime = std::chrono::steady_clock::now();

    if (myrank == 0) {
        // std::cout << it << " " << std::chrono::duration_cast<std::chrono::milliseconds>(endTime - startTime).count() << std::endl;
        std::cout << it << " " << MPI_Wtime() - start_time_mpi << std::endl;
    }

    /*
    std::ofstream out;
    out.open("w.txt");
    for (size_t j = 1; j < N; ++j) {
        for (size_t i = 1; i < M; ++i) {
            out << w[i * (N + 1) + j] << " ";
        }
        out << std::endl;
    }
    out.close();
    */

    MPI_Finalize();

    return 0;
}