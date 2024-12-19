## Конфигурация программы
Предварительно в коде выставляются M, N и delta

## Сборка и запуск программ

далее delta = 3e-7

последовательная программа

```
bsub -n 1 -q normal -o output_10_10_1 -e error_10_10_1 -m "polus-c3-ib polus-c4-ib" -J 10_10_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_10_10"

bsub -n 1 -q normal -o output_20_20_1 -e error_20_20_1 -m "polus-c3-ib polus-c4-ib" -J 20_20_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_20_20"

bsub -n 1 -q normal -o output_serial_40_40 -e error_serial_40_40 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_serial_40_40"
```

параллельная на матрице 40x40

```
bsub -n 1 -q normal -o output_40_40_2 -e error_40_40_2 -m "polus-c3-ib polus-c4-ib" -J 40_40_2 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 ./main_40_40"

bsub -n 1 -q normal -o output_40_40_4 -e error_40_40_4 -m "polus-c3-ib polus-c4-ib" -J 40_40_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_40_40"

bsub -n 1 -q normal -o output_40_40_8 -e error_40_40_8 -m "polus-c3-ib polus-c4-ib" -J 40_40_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_40_40"
```

параллельная на матрице 80x90

```
g++ -std=gnu++11 -O3 -o main_openmp_80_90 -fopenmp main_openmp_80_90.cpp

bsub -n 1 -q normal -o output_openmp_80_90_1 -e error_openmp_80_90_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_openmp_80_90"

bsub -n 1 -q normal -o output_openmp_80_90_4 -e error_openmp_80_90_4 -m "polus-c3-ib polus-c4-ib" -J 80_90_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_openmp_80_90"

bsub -n 1 -q normal -o output_openmp_80_90_8 -e error_openmp_80_90_8 -m "polus-c3-ib polus-c4-ib" -J 80_90_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_openmp_80_90"

bsub -n 1 -q normal -o output_openmp_80_90_16_1 -e error_openmp_80_90_16_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_16_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_openmp_80_90"
```

параллельная на матрице 160x180

далее delta = 26e-9

```
g++ -std=gnu++11 -O3 -o main_openmp_160_180 -fopenmp main_openmp_160_180.cpp

bsub -n 1 -q normal -o output_openmp_160_180_1 -e error_openmp_160_180_1 -m "polus-c3-ib polus-c4-ib" -J 160_180_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_openmp_160_180"

bsub -n 1 -q normal -o output_openmp_160_180_4 -e error_openmp_160_180_4 -m "polus-c3-ib polus-c4-ib" -J 160_180_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_openmp_160_180"

bsub -n 1 -q normal -o output_openmp_160_180_8 -e error_openmp_160_180_8 -m "polus-c3-ib polus-c4-ib" -J 160_180_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_openmp_160_180"

bsub -n 1 -q normal -o output_openmp_160_180_16 -e error_openmp_160_180_16 -m "polus-c3-ib polus-c4-ib" -J 160_180_16 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_openmp_160_180"

bsub -n 1 -q normal -o output_openmp_160_180_32 -e error_openmp_160_180_32 -m "polus-c3-ib polus-c4-ib" -J 160_180_32 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=32 ./main_openmp_160_180"
```

Mpi на 80x90

```
module load SpectrumMPI
mpixlC -o main_mpi_80_90 -O3 -std=gnu++11 main_mpi_80_90.cpp

mpisubmit.pl -p 1 --stdout output_mpi_80_90_1.txt --stderr error_mpi_80_90_1.txt ./main_mpi_80_90

mpisubmit.pl -p 2 --stdout output_mpi_80_90_2.txt --stderr error_mpi_80_90_2.txt ./main_mpi_80_90

mpisubmit.pl -p 4 --stdout output_mpi_80_90_4.txt --stderr error_mpi_80_90_4.txt ./main_mpi_80_90

mpisubmit.pl -p 8 --stdout output_mpi_80_90_8.txt --stderr error_mpi_80_90_8.txt ./main_mpi_80_90
```


Mpi на 160x180

```
module load SpectrumMPI
mpixlC -o main_mpi_160_180 -O3 -std=gnu++11 main_mpi_160_180.cpp

mpisubmit.pl -w 00:30 -p 1 --stdout output_mpi_160_180_1.txt --stderr error_mpi_160_180_1.txt ./main_mpi_160_180

mpisubmit.pl -p 2 --stdout output_mpi_160_180_2.txt --stderr error_mpi_160_180_2.txt ./main_mpi_160_180

mpisubmit.pl -p 4 --stdout output_mpi_160_180_4.txt --stderr error_mpi_160_180_4.txt ./main_mpi_160_180

mpisubmit.pl -p 8 --stdout output_mpi_160_180_8.txt --stderr error_mpi_160_180_8.txt ./main_mpi_160_180

mpisubmit.pl -p 16 --stdout output_mpi_160_180_16.txt --stderr error_mpi_160_180_16.txt ./main_mpi_160_180
```

Mpi+OpenMp на 80x90

```
module load SpectrumMPI
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 main_mpi_openmp_80_90.cpp

bsub -n 1 -q normal -o output_mpi_openmp_80_90_1_1.txt  -e error_mpi_openmp_80_90_1_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_1_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_80_90"

bsub -n 2 -q normal -o output_mpi_openmp_80_90_2_1.txt  -e error_mpi_openmp_80_90_2_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_80_90"

bsub -n 2 -q normal -o output_mpi_openmp_80_90_2_2.txt  -e error_mpi_openmp_80_90_2_2.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_2 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 mpiexec ./main_mpi_openmp_80_90"

bsub -n 2 -q normal -o output_mpi_openmp_80_90_2_4.txt  -e error_mpi_openmp_80_90_2_4.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_4 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 mpiexec ./main_mpi_openmp_80_90"

bsub -n 2 -q normal -o output_mpi_openmp_80_90_2_8.txt  -e error_mpi_openmp_80_90_2_8.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_8 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_80_90"
```


Mpi+OpenMp на 160x180

```
module load SpectrumMPI
mpixlC -o main_mpi_openmp_160_180 -qsmp=omp -O3 main_mpi_openmp_160_180.cpp

bsub -n 1 -q normal -o output_mpi_openmp_160_180_1_1.txt  -e error_mpi_openmp_160_180_1_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_1_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_160_180"

bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_1.txt  -e error_mpi_openmp_160_180_4_1.txt   -J mpi_openmp_160_180_4_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_160_180"

bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_2.txt  -e error_mpi_openmp_160_180_4_2.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_2 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 mpiexec ./main_mpi_openmp_160_180"

bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_4.txt  -e error_mpi_openmp_160_180_4_4.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_4 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 mpiexec ./main_mpi_openmp_160_180"

bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_8.txt  -e error_mpi_openmp_160_180_4_8.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_8 -R  "affinity[core(8,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_160_180"
```

Mpi+Gpu

```
module load openmpi
module load pgi

mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple_160_180 main_mpi_simple_160_180.c
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_160_180_1 -e error_mpi_simple_160_180_1 "mpiexec -n 1 ./main_mpi_simple_160_180"

mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu_160_180 main_mpi_gpu_160_180.c
bsub -n 1 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_1_check -e error_main_mpi_gpu_160_180_1_check "mpiexec -n 1 ./main_mpi_gpu_160_180"
bsub -n 2 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_2_check -e error_main_mpi_gpu_160_180_2_check "mpiexec -n 2 ./main_mpi_gpu_160_180"
```

Mpi+Gpu

```
module load openmpi
module load pgi

# run serial program
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple_5000_5000 main_mpi_simple_5000_5000.c
bsub -n 1 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_simple_5000_5000_1 -e error_main_mpi_simple_5000_5000_1 "mpiexec -n 1 ./main_mpi_simple_5000_5000"

# run mpi program
bsub -n 10 -m "polus-c3-ib polus-c4-ib" -R  "span[hosts=1]" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_simple_5000_5000_10 -e error_main_mpi_simple_5000_5000_10 "mpiexec -n 10 ./main_mpi_simple_5000_5000"
bsub -n 20 -m "polus-c3-ib polus-c4-ib" -R  "span[hosts=1]" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_simple_5000_5000_20 -e error_main_mpi_simple_5000_5000_20 "mpiexec -n 20 ./main_mpi_simple_5000_5000"

# run mpi + gpu program
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu_5000_5000 main_mpi_gpu_5000_5000.c
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_gpu_5000_5000_1 -e error_main_mpi_gpu_5000_5000_1 "mpiexec -n 1 ./main_mpi_gpu_5000_5000"
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_5000_5000_2 -e error_main_mpi_gpu_5000_5000_2 "mpiexec -n 2 ./main_mpi_gpu_5000_5000"

# run mpi + openmp program
mpixlc -o main_mpi_openmp_5000_5000 -qsmp=omp -O3 main_mpi_openmp_5000_5000.c
bsub -n 1 -q short -o output_mpi_openmp_5000_5000_1_160_check  -e error_mpi_openmp_5000_5000_1_160_check -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_5000_5000_1_160_check -R "span[hosts=1] affinity[core(20)]"  "OMP_NUM_THREADS=160 mpiexec -n 1 ./main_mpi_openmp_5000_5000"
bsub -n 2 -q short -o output_mpi_openmp_5000_5000_2_80_check  -e error_mpi_openmp_5000_5000_2_80_check -m "polus-c2-ib polus-c3-ib polus-c4-ib" -J mpi_openmp_5000_5000_2_80_check -R "span[hosts=1] affinity[core(10)]"  "OMP_NUM_THREADS=80 mpiexec -n 2 ./main_mpi_openmp_5000_5000"

```

