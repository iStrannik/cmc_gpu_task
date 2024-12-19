build: main_mpi_gpu_160_180.c
	load openmpi
	load pgi
	mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu_160_180 main_mpi_gpu_160_180.c

