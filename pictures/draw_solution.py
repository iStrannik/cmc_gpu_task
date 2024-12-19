import matplotlib.pyplot as plt

'''data = []

with open('w.txt', 'r') as file:
    for i in file.readlines():
        data.append(list(map(lambda x: float(x), i.split())))

print(data)
'''
# plt.matshow(data)

""" x = [1, 2, 4, 8]
y = [1, 1.84, 2.16, 2.62]
plt.title('Ускорение на сетке 40x40 для openmp программы')
plt.xlabel('Количество openmp-нитей')
plt.ylabel('Ускорение')
plt.plot(x, y)
plt.scatter(x, y, marker='o')
plt.savefig('pictures/openmp_40_40.png') """


""" x = [1, 4, 8, 16]
y = [1, 3.26, 4.23, 3.91]
plt.title('Ускорение на сетке 80x90 для openmp программы')
plt.xlabel('Количество openmp-нитей')
plt.ylabel('Ускорение')
plt.plot(x, y)
plt.scatter(x, y, marker='o')
plt.savefig('pictures/openmp_80_90.png') """

""" x = [1, 4, 8, 16, 32]
y = [1, 3.79, 6.47, 6.42, 5.88]
plt.title('Ускорение на сетке 160x180 для openmp программы')
plt.xlabel('Количество openmp-нитей')
plt.ylabel('Ускорение')
plt.plot(x, y)
plt.scatter(x, y, marker='o')
plt.savefig('pictures/openmp_160x180.png') """

""" x = [1, 2, 4, 8]
y = [1, 1.93, 3.69, 6.35]
plt.title('Ускорение на сетке 80x90 для mpi кода')
plt.xlabel('Количество mpi-процессов')
plt.ylabel('Ускорение')
plt.plot(x, y)
plt.scatter(x, y, marker='o')
plt.savefig('pictures/mpi_80_90.png') """

""" x = [1, 2, 4, 8, 16]
y = [1, 1.96, 3.86, 7.46, 13.72]
plt.title('Ускорение на сетке 160x180 для mpi кода')
plt.xlabel('Количество mpi-процессов')
plt.ylabel('Ускорение')
plt.plot(x, y)
plt.scatter(x, y, marker='o')
plt.savefig('pictures/mpi_160_180.png') """

""" x = [1, 2, 4, 8]
y = [1.20, 2.82, 2.94, 5.09]
plt.title('Ускорение на сетке 80x90 mpi+openMP кода для 2-х mpi процессов')
plt.xlabel('Количество openmp-нитей')
plt.ylabel('Ускорение')
plt.plot(x, y)
plt.scatter(x, y, marker='o')
plt.savefig('pictures/mpi_openmp_80_90.png') """

''' x = [1, 2, 4]
y = [3.53, 6.3, 12.09]
plt.title('Ускорение на сетке 160x180 mpi+openMP кода для 4-х mpi процессов')
plt.xlabel('Количество openmp-нитей')
plt.ylabel('Ускорение')
plt.plot(x, y)
plt.scatter(x, y, marker='o')
plt.savefig('pictures/mpi_openmp_160_180.png') '''

x = [0, 1, 2]
y = [1.0, 4.42, 7.7]
plt.title('Ускорение mpi+Openacc кода для 1,2-х mpi процессах и GPU')
plt.xlabel('Количество mpi-процессов и gpu')
plt.ylabel('Ускорение')
plt.plot(x, y)
plt.scatter(x, y, marker='o')
plt.savefig('pictures/mpi_gpu_160_180.png')

