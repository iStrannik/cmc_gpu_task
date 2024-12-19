#include <stdlib.h>
#include <iostream>
#include "mpi.h"

void saxpy(int n, float a, float * x, float * y) {
    #pragma acc kernels
    for (int i = 0; i < n; ++i) {
        y[i] = a * x[i] + y[i];
    }
}

int main() {

    int size, myrank;
    MPI_Init(NULL, NULL);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &size); 
    int N = 1<<20;
    float *x = (float *)malloc(N * sizeof(float));
    float *y = (float *)malloc(N * sizeof(float));
    for (int i = 0; i < N; ++i) {
        x[i] = 2.0f;
        y[i] = 1.0f;
    }

    double start_time_mpi = MPI_Wtime();
    saxpy(N, 3.0f, x, y);

    std::cout << MPI_Wtime() - start_time_mpi << std::endl;

    MPI_Finalize();

    return 0;
}