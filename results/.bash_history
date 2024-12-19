#1730056323
ls
#1730056327
whoami
#1730056329
cd ..
#1730056331
ls -al
#1730056336
cd
#1730056338
who
#1730056527
exit
#1730411925
who
#1730412232
псс
#1730412234
gcc
#1730412238
g++ --help
#1730412247
vim main.cpp
#1730412295
exit
#1730412347
ls
#1730412355
g++ -o main -fopenmp main.cpp
#1730412382
g++ --version
#1730412473
g++ -std=gnu++11 -o main -fopenmp main.cpp
#1730412476
ls
#1730412479
./main
#1730412508
vim main.cpp 
#1730412528
g++ -std=gnu++11 -o main -fopenmp main.cpp
#1730412532
./main
#1730412715
bsub -n 1 -q normal -o first_try -e first_err -m "polus-c3-ib polus-c4-ib" -J check_speed -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main"
#1730412729
ls
#1730412880
bjobs
#1730412901
ls
#1730412908
ls /gpfs/
#1730412912
ls /gpfs/automountdir/
#1730412938
 bjobs -u all 
#1730413015
bjobs
#1730413076
ls
#1730413081
cat first_
#1730413084
cat first_err 
#1730413086
cat first_try 
#1730413190
bsub -n 1 -q normal -o output_2 -e error_2 -m "polus-c3-ib polus-c4-ib" -J check_speed -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 ./main"
#1730413197
bsub -n 1 -q normal -o output_4 -e error_4 -m "polus-c3-ib polus-c4-ib" -J check_speed -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main"
#1730413202
bsub -n 2 -q normal -o output_8 -e error_8 -m "polus-c3-ib polus-c4-ib" -J check_speed -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main"
#1730413357
bjobs
#1730413576
ls
#1730413580
bjobs
#1730413587
cat output_2
#1730413595
cat first_try 
#1730413599
cat output_8
#1730413603
cat output_4
#1730413605
cat output_2
#1730413624
bjobs
#1730415399
 bjobs -u all 
#1730415672
bjobs
#1730416494
exit
#1730422784
bjobs
#1730422796
ls
#1730422807
cat output_10_10_1 
#1730422818
cat output_20_20_1 
#1730422831
ls
#1730422861
rm main_20_20
#1730422866
rm main_20_20.cpp 
#1730422872
rm output_20_20_1 
#1730422877
rm error_20_20_1 
#1730422889
ls
#1730422985
g++ -std=gnu++11 -o main_20_20 -fopenmp main_20_20.cpp
#1730423031
bsub -n 1 -q normal -o output_20_20_1 -e error_20_20_1 -m "polus-c3-ib polus-c4-ib" -J 20_20_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_20_20"
#1730423037
bjobs
#1730423041
ls
#1730423055
cat output_10_10_1 
#1730423260
bjobs
#1730423621
g++ -std=gnu++11 -o main_80_90 -fopenmp main_80_90.cpp
#1730423664
bsub -n 1 -q normal -o output_80_90_2 -e error_80_90_2 -m "polus-c3-ib polus-c4-ib" -J 80_90_2 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 ./main_80_90"
#1730423668
bjobs
#1730424570
ls
#1730424697
bjobs
#1730424703
bsub -n 1 -q normal -o output_80_90_4 -e error_80_90_4 -m "polus-c3-ib polus-c4-ib" -J 80_90_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_80_90"
#1730424865
bjobs
#1730424881
bkill 1189906
#1730424892
bkill 1190176
#1730424895
bjobs
#1730425000
g++ -std=gnu++11 -o main_40_40 -fopenmp main_40_40.cpp
#1730425029
bsub -n 1 -q normal -o output_40_40_2 -e error_40_40_2 -m "polus-c3-ib polus-c4-ib" -J 40_40_2 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 ./main_40_40"
#1730425045
bsub -n 3 -q normal -o output_40_40_16 -e error_40_40_16 -m "polus-c3-ib polus-c4-ib" -J 40_40_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_40_40"
#1730425050
ls
#1730425058
bjobs
#1730425087
bsub -n 1 -q normal -o output_80_90_4 -e error_80_90_4 -m "polus-c3-ib polus-c4-ib" -J 80_90_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_80_90"
#1730425096
ls
#1730425107
bjobs
#1730425692
who
#1730426009
bjobs
#1730428566
сдуфк
#1730428568
clear
#1730428569
сдуфк
#1730428571
clear
#1730428573
bjobs
#1730428616
ls
#1730428639
bjobs
#1730428645
bkill 1190845
#1730428670
bsub -n 2 -q normal -o output_80_90_8 -e error_80_90_8 -m "polus-c3-ib polus-c4-ib" -J 80_90_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_80_90"
#1730428674
bjobs
#1730429172
exit
#1730416769
ls
#1730416773
rm error_2
#1730416791
rm error_4 rm first_err 
#1730416801
rm first_try 
#1730416811
ls
#1730416816
rm output_2
#1730416831
rm output_4 
#1730416833
ls
#1730416897
bsub -n 1 -q normal -o output_40_40_1 -e error_40_40_1 -m "polus-c3-ib polus-c4-ib" -J check_speed -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main"
#1730416995
bsub -n 1 -q normal -o output_40_40_4 -e error_40_40_4 -m "polus-c3-ib polus-c4-ib" -J task_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main"
#1730417000
bsub -n 3 -q normal -o output_40_40_16 -e error_40_40_16 -m "polus-c3-ib polus-c4-ib" -J task_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main"
#1730417009
bjubs
#1730417013
bjobs
#1730419006
htop
#1730419028

#1730419281
bjobs
#1730419506
ls
#1730419519
cat output_40_40_1
#1730419553
cat output_40_40_4
#1730419599
bjobs
#1730420296
ды
#1730420297
ls
#1730420487
bjobs
#1730420658
ls
#1730420689
g++ -std=gnu++11 -o main_10_10 -fopenmp main_10_10.cpp 
#1730420698
bsub -n 1 -q normal -o output_10_10_1 -e error_10_10_1 -m "polus-c3-ib polus-c4-ib" -J 10_10_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_10_10"
#1730420746
g++ -std=gnu++11 -o main_20_20 -fopenmp main_20_20.cpp 
#1730420835
bsub -n 1 -q normal -o output_20_20_1 -e error_20_20_1 -m "polus-c3-ib polus-c4-ib" -J 20_20_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main"
#1730420838
bjobs
#1730420860
htop
#1730420883
who
#1730420915
bjobs
#1730421696
who
#1730421708
bjobs
#1730421722
ls
#1730421735
cat output_40_40_4
#1730421741
cat output_40_40_1
#1730444757
bjobs
#1730444765
ls
#1730444777
cat output_80_90_2
#1730444785
cat output_80_90_4
#1730444812
cat output_40_40_1 
#1730444815
cat output_40_40_2
#1730444820
cat output_40_40_4
#1730444835
ls
#1730444852
rm error_40_40_1
#1730444858
rm output_40_40_1
#1730444866
rm output_40_40_4
#1730444873
cat output_40_40_2 
#1730444892
ls
#1730444913
rm error_40_40_4
#1730444935
bsub -n 1 -q normal -o output_40_40_2 -e error_40_40_2 -m "polus-c3-ib polus-c4-ib" -J 40_40_2 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 ./main_40_40"
#1730444945
bsub -n 3 -q normal -o output_40_40_16 -e error_40_40_16 -m "polus-c3-ib polus-c4-ib" -J 40_40_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_40_40"
#1730444951
bjobs
#1730448803
bjibs
#1730448806
bjobs
#1730448816
ls
#1730448821
bjobs
#1730448858
ls
#1730448877
cat output_40_40_2 
#1730448882
cat output_40_40_4
#1730448890
ls
#1730448911
bjobs
#1730448922
bkill 1191251
#1730448924
bjobs
#1730448935
ls
#1730448959
bsub -n 1 -q normal -o output_40_40_4 -e error_40_40_4 -m "polus-c3-ib polus-c4-ib" -J 40_40_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_40_40"
#1730448972
bsub -n 1 -q normal -o output_40_40_1 -e error_40_40_1 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_40_40"
#1730448978
bjobs
#1730449009
ls
#1730449050
bjobs
#1730454112
who
#1730455294
bjobs
#1730455298
ды
#1730455299
ls
#1730455306
cat output_40_40_1
#1730455316
cat output_40_40_4
#1730455322
cat output_40_40_2
#1730455327
cat output_40_40_1
#1730455330
cat output_40_40_4
#1730455360
bjobs
#1730455465
bsub -n 3 -q normal -o output_80_90_16 -e error_80_90_16 -m "polus-c3-ib polus-c4-ib" -J 80_90_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_80_90"
#1730455472
bjobs
#1730455770
ды
#1730455771
ls
#1730455783
cat output_80_90_8
#1730455787
cat output_80_90_4
#1730455791
cat output_80_90_2
#1730455794
cat output_80_90_4
#1730455795
cat output_80_90_8
#1730455850
bjobs
#1730456210
g++ -std=gnu++11 -o main_160_180 -fopenmp main_160_180.cpp 
#1730456224
bjobs
#1730456257
bsub -n 1 -q normal -o output_160_180_4 -e error_160_180_4 -m "polus-c3-ib polus-c4-ib" -J 160_180_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main"
#1730456259
bjobs
#1730456286
bsub -n 2 -q normal -o output_160_180_8 -e error_160_180_8 -m "polus-c3-ib polus-c4-ib" -J 160_180_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main"
#1730456289
bjobs
#1730456308
ls
#1730456337
cat output_160_180_4
#1730456387
rm output_160_180_4
#1730456389
rm output_160_180_8
#1730456400
rm error_160_180_4 
#1730456402
rm error_160_180_8 
#1730456403
ls
#1730456421
bsub -n 1 -q normal -o output_160_180_4 -e error_160_180_4 -m "polus-c3-ib polus-c4-ib" -J 160_180_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_160_180"
#1730456432
bsub -n 2 -q normal -o output_160_180_8 -e error_160_180_8 -m "polus-c3-ib polus-c4-ib" -J 160_180_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_160_180"
#1730456435
bjobs
#1730456496
ls
#1730456507
vim main_160_180.cpp 
#1730459123
bjobs
#1730459132
ls
#1730459141
cat output_160_180_8
#1730459146
cat output_160_180_4
#1730459159
ls
#1730459472
bjobs
#1730459483
ls
#1730459518
bsub -n 3 -q normal -o output_160_180_16 -e error_160_180_16 -m "polus-c3-ib polus-c4-ib" -J 160_180_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_160_180"
#1730459526
bsub -n 4 -q normal -o output_160_180_32 -e error_160_180_32 -m "polus-c3-ib polus-c4-ib" -J 160_180_32 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=32 ./main_160_180"
#1730459529
bjobs
#1730463764
who
#1730464648
bjobs
#1730465012
bkill 1191835
#1730465038
bsub -n 2 -q normal -o output_160_180_16 -e error_160_180_16 -m "polus-c3-ib polus-c4-ib" -J 160_180_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_160_180"
#1730465041
bjobs
#1730465636
cat output_160_180_8
#1730465640
cat output_160_180_16
#1730465767
ls
#1730465779
rm error_160_180_16 
#1730465794
rm output_160_180_16
#1730465797
bjobs
#1730465826
bsub -n 3 -q normal -o output_160_180_16 -e error_160_180_16 -m "polus-c3-ib polus-c4-ib" -J 160_180_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_160_180"
#1730465828
bjobs
#1730477073
host api.diehard.yandex.net
#1730477638
bjobs
#1730485912
ls
#1730485921
cat output_160_180_16 
#1730485925
cat output_160_180_4
#1730485927
cat output_160_180_2
#1730485930
cat output_160_180_8
#1730485933
cat output_160_180_16
#1730485950
ls
#1730485963
rm output_160_180_16
#1730485970
rm error_160_180_16
#1730485972
ls
#1730486193
g++ -std=gnu++11 -O2 -o main_160_180 -fopenmp main_160_180.cpp 
#1730486216
bjobs
#1730486219
bsub -n 1 -q normal -o output_160_180_16 -e error_160_180_16 -m "polus-c3-ib polus-c4-ib" -J 160_180_16 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_160_180"
#1730486223
bjobs
#1730486234
bkill 1190844
#1730486241
bkill 1191391
#1730486246
bkill 1191836
#1730486250
bjobs
#1730486284
ls
#1730486320
bsub -n 1 -q normal -o output_40_40_16 -e error_40_40_16 -m "polus-c3-ib polus-c4-ib" -J 40_40_16 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_40_40"
#1730486326
ls
#1730486329
bjobs
#1730486384
g++ -std=gnu++11 -O2 -o main_80_90 -fopenmp main_80_90.cpp 
#1730486392
bsub -n 3 -q normal -o output_80_90_16 -e error_80_90_16 -m "polus-c3-ib polus-c4-ib" -J 80_90_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_80_90"
#1730486399
bjobs
#1730486406
bkill 1193053
#1730486419
bsub -n 2 -q normal -o output_80_90_16 -e error_80_90_16 -m "polus-c3-ib polus-c4-ib" -J 80_90_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_80_90"
#1730486498
bjobs
#1730486502
ls
#1730486508
cat output_160_180_16
#1730486515
cat output_160_180_8
#1730486586
bsub -n 1 -q normal -o output_160_180_32 -e error_160_180_32 -m "polus-c3-ib polus-c4-ib" -J 160_180_32 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=32 ./main_160_180"
#1730486589
bjobs
#1730486605
ls
#1730486615
cat output_40_40_16
#1730486619
cat output_40_40_4
#1730486668
g++ -std=gnu++11 -O2 -o main_40_40 -fopenmp main_40_40.cpp 
#1730486675
bsub -n 1 -q normal -o output_40_40_16 -e error_40_40_16 -m "polus-c3-ib polus-c4-ib" -J 40_40_16 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_40_40"
#1730486684
rm output_40_40_16 
#1730486689
rm error_40_40_16
#1730486694
bjobs
#1730486696
ls
#1730486705
cat output_160_180_32
#1730486709
cat output_160_180_16
#1730486713
cat output_160_180_8
#1730486718
cat output_160_180_16
#1730486721
cat output_160_180_32
#1730487556
bjobs
#1730487560
ls
#1730487567
cat output_160_180_32
#1730487587
cat output_160_180_16
#1730487605
cat output_160_180_32
#1730487609
cat output_160_180_16
#1730487614
ls
#1730487630
cat output_40_40_16
#1730487633
cat output_40_40_4
#1730487639
cat output_40_40_16
#1730487683
bsub -n 2 -q normal -o output_40_40_16 -e error_40_40_16 -m "polus-c3-ib polus-c4-ib" -J 40_40_16 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_40_40"
#1730487695
rm output_40_40_16
#1730487696
ls
#1730487711
cat output_80_90_2
#1730487714
cat output_80_90_4
#1730487717
cat output_80_90_8
#1730487720
cat output_80_90_16
#1730487726
bjobs
#1730487763
bsub -n 1 -q normal -o output_80_90_16_1 -e error_80_90_16_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_16_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_80_90"
#1730487765
bjobs
#1730487927
ls
#1730487930
bjobs
#1730487933
ls
#1730488058
bjobs
#1730488234
who
#1730488238
bjobs
#1730488658
bsub -n 1 -q normal -o output_160_180_1 -e error_160_180_1 -m "polus-c3-ib polus-c4-ib" -J 160_180_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_160_180"
#1730488662
bjobs
#1730489006
cat output_40_40_1
#1730489028
cat output_40_40_2
#1730489030
cat output_40_40_3
#1730489031
cat output_40_40_4
#1730489039
bjobs
#1730489453
cat output_40_40_4
#1730489454
bjobs
#1730489647
cat output_40_40_4
#1730489649
bjobs
#1730489750
cat output_40_40_4
#1730489752
bjobs
#1730489999
ls
#1730490015
cat output_160_180_16
#1730490019
cat output_160_180_8
#1730490022
cat output_160_180_16
#1730490025
cat output_160_180_32
#1730490038
cat output_80_90_16
#1730490041
cat output_80_90_8
#1730490044
cat output_80_90_16
#1730490159
bsub -n 1 -q normal -o output_80_90_1 -e error_80_90_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_80_90"
#1730490161
ls
#1730490171
cat output_80_90_16
#1730490175
cat output_80_90_16_1 
#1730490179
clea
#1730490181
ls
#1730490197
cat output_160_180_1
#1730482331
bkill 1192030
#1730482370
g++ -std=gnu++11 -o main_160_180 -O0 -fopenmp main_160_180.cpp 
#1730482398
bsub -n 1 -q normal -o output_160_180_16 -e error_160_180_16 -m "polus-c3-ib polus-c4-ib" -J 160_180_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_160_180"
#1730482402
bjobs
#1730490299
bjobs
#1730490378
g++ -std=gnu++11 -o main_80_90 -fopenmp main_80_90.cpp 
#1730490392
bsub -n 1 -q normal -o output_80_90_1 -e error_80_90_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_80_90"
#1730490397
rm output_80_90_1
#1730490404
rm error_80_90_1
#1730490405
ls
#1730490467
g++ -std=gnu++11 -o main_160_180 -fopenmp main_160_180.cpp 
#1730490482
bsub -n 1 -q normal -o output_160_180_1 -e error_160_180_1 -m "polus-c3-ib polus-c4-ib" -J 160_180_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_160_180"
#1730490489
bjobs
#1730490505
bkill 1193273
#1730491151
bjobs
#1730491227
bsub -n 1 -q normal -o output_40_40_16 -e error_40_40_16 -m "polus-c3-ib polus-c4-ib" -J 40_40_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_40_40"
#1730491230
bjobs
#1730498484
ls
#1730498500
cat output_40_40_16
#1730498504
cat output_40_40_8
#1730498507
cat output_40_40_4
#1730498513
cat output_40_40_16
#1730498527
cat output_80_90_1
#1730498531
cat output_80_90_2
#1730498541
cat output_160_180_1
#1730498543
cat output_160_180_2
#1730498545
cat output_160_180_4
#1730930342
bjobs
#1730930353
who
#1730931568
ls
#1730931575
rm error_*
#1730931581
rm main*
#1730931582
ls
#1730931586
rm output_*
#1730931587
ls
#1730931636
g++ -std=gnu++11 -o main_10_10 -fopenmp main_10_10.cpp 
#1730931645
bsub -n 1 -q normal -o output_10_10_1 -e error_10_10_1 -m "polus-c3-ib polus-c4-ib" -J 10_10_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_10_10"
#1730931650
bsub -n 1 -q normal -o output_20_20_1 -e error_20_20_1 -m "polus-c3-ib polus-c4-ib" -J 20_20_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_20_20"
#1730931656
bsub -n 1 -q normal -o output_40_40_1 -e error_40_40_1 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_40_40"
#1730931659
bjobs
#1730931662
ls
#1730931681
cat error_20_20_1 
#1730931687
rm error_20_20_1 
#1730931690
rm error_40_40_1 
#1730931691
ls
#1730931702
rm output_20_20_1 output_40_40_1 
#1730931703
ls
#1730931708
rm w.txt
#1730931710
ls
#1730931713
cat output_10_10_1 
#1730931761
g++ -std=gnu++11 -o main_20_20 -fopenmp main_20_20.cpp 
#1730931768
ls
#1730931779
bsub -n 1 -q normal -o output_20_20_1 -e error_20_20_1 -m "polus-c3-ib polus-c4-ib" -J 20_20_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_20_20"
#1730931820
g++ -std=gnu++11 -o main_40_40 -fopenmp main_40_40.cpp 
#1730931832
bsub -n 1 -q normal -o output_40_40_1 -e error_40_40_1 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_40_40"
#1730931834
ls
#1730931836
bjobs
#1730931839
ls
#1730931844
cat output_20_20_1 
#1730931866
ls
#1730931871
cat output_40_40_1 
#1730931886
bsub -n 1 -q normal -o output_40_40_2 -e error_40_40_2 -m "polus-c3-ib polus-c4-ib" -J 40_40_2 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 ./main_40_40"
#1730931892
bsub -n 1 -q normal -o output_40_40_4 -e error_40_40_4 -m "polus-c3-ib polus-c4-ib" -J 40_40_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_40_40"
#1730931910
bsub -n 1 -q normal -o output_40_40_16 -e error_40_40_16 -m "polus-c3-ib polus-c4-ib" -J 40_40_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_40_40"
#1730931913
ls
#1730931918
cat output_40_40_2
#1730931921
cat output_40_40_1
#1730931923
cat output_40_40_4
#1730931929
ls
#1730931933
cat output_40_40_16
#1730931987
bsub -n 1 -q normal -o output_40_40_8 -e error_40_40_8 -m "polus-c3-ib polus-c4-ib" -J 40_40_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_40_40"
#1730932044
g++ -std=gnu++11 -o main_80_90 -fopenmp main_80_90.cpp 
#1730932046
ls
#1730932053
cat output_40_40_8
#1730932075
rm output_40_40_16
#1730932077
ls
#1730932091
rm error_40_40_16
#1730932099
ls
#1730932131
bsub -n 1 -q normal -o output_80_90_1 -e error_80_90_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_80_90"
#1730932137
bsub -n 1 -q normal -o output_80_90_4 -e error_80_90_4 -m "polus-c3-ib polus-c4-ib" -J 80_90_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_80_90"
#1730932149
bsub -n 1 -q normal -o output_80_90_8 -e error_80_90_8 -m "polus-c3-ib polus-c4-ib" -J 80_90_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_80_90"
#1730932156
bsub -n 1 -q normal -o output_80_90_16_1 -e error_80_90_16_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_16_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_80_90"
#1730932172
ls
#1730932180
bjobs
#1730932197
ls
#1730932205
cat output_80_90_4
#1730932211
cat output_80_90_8
#1730932215
cat output_80_90_16
#1730932218
cat output_80_90_1
#1730932222
bjob
#1730932227
cat output_80_90_16
#1730932229
ls
#1730932239
cat output_80_90_16_1 
#1730932243
cat output_80_90_8
#1730932250
cat output_80_90_4
#1730932253
cat output_80_90_1
#1730932257
bjobs
#1730932906
g++ -std=gnu++11 -o main_160_180 -fopenmp main_160_180.cpp 
#1730932938
bjobs
#1730932942
bsub -n 1 -q normal -o output_160_180_1 -e error_160_180_1 -m "polus-c3-ib polus-c4-ib" -J 160_180_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_160_180"
#1730932950
bsub -n 1 -q normal -o output_160_180_4 -e error_160_180_4 -m "polus-c3-ib polus-c4-ib" -J 160_180_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_160_180"
#1730932968
bsub -n 1 -q normal -o output_160_180_8 -e error_160_180_8 -m "polus-c3-ib polus-c4-ib" -J 160_180_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_160_180"
#1730932984
bjobs
#1730932987
bsub -n 1 -q normal -o output_160_180_32 -e error_160_180_32 -m "polus-c3-ib polus-c4-ib" -J 160_180_32 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=32 ./main_160_180"
#1730932989
ls
#1730933009
cat ls
#1730933011
ls
#1730933025
bjobs
#1730933161
bsub -n 1 -q normal -o output_160_180_16 -e error_160_180_16 -m "polus-c3-ib polus-c4-ib" -J 160_180_16 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_160_180"
#1730933291
bjobs
#1730933602
ls
#1730933758
bjobs
#1730933949
ls
#1730933960
cat output_160_180_1
#1730933968
cat output_160_180_2
#1730933971
cat output_160_180_4
#1730933977
cat output_160_180_8
#1730933981
cat output_160_180_16
#1730933983
cat output_160_180_32
#1730934690
exit
#1732964991
ls
#1732964999
vim main_mpi.cpp
#1732965039
exit
#1732965088
ls
#1732965141
mpixlc -o main_mpi main_mpi.cpp 
#1732965292
ls
#1732965312
vim main_40_40.cpp 
#1732965328
ls
#1732965369
module load SpectrumMPI
#1732965378
mpixlc -o main_mpi main_mpi.cpp 
#1732965401
mpixlc -o main_mpi -std=c++11 main_mpi.cpp 
#1732965464
mpixlc -o main_mpi -std=g++11 main_mpi.cpp 
#1732965486
mpixlc -o main_mpi -std=gnu++11 main_mpi.cpp 
#1732965591
mpixlC -o main_mpi -std=gnu++11 main_mpi.cpp 
#1732965730
mpisubmit.pl -n 1 --stdout output_mpi_40_40_1.txt --stderr error_mpi_40_40_1.txt ./main_mpi
#1732965736
bjobs
#1732965900
ls
#1732965912
cat output_mpi_40_40_1.txt 
#1732965974
mpisubmit.pl -n 2 --stdout output_mpi_40_40_2.txt --stderr error_mpi_40_40_2.txt ./main_mpi
#1732966003
mpisubmit.pl -p 4 --stdout output_mpi_40_40_4.txt --stderr error_mpi_40_40_4.txt ./main_mpi
#1732966064
bjobs
#1732966066
ls
#1732966073
cat output_mpi_40_40_2.txt 
#1732966078
cat output_mpi_40_40_4.txt 
#1732966101
mpisubmit.pl -p 2 --stdout output_mpi_40_40_2.txt --stderr error_mpi_40_40_2.txt ./main_mpi
#1732966112
rm output_mpi_40_40_2.txt 
#1732966117
rm error_mpi_40_40_2.txt 
#1732966118
ls
#1732966122
bjobs
#1732966177
exit
#1732966203
ls
#1732966236
mv -o main_serial_40_40 main_serial_40_40.cpp 
#1732966256
mv main_serial.cpp main_serial_40_40.cpp 
#1732966266
g++ -o main_serial_40_40 main_serial_40_40.cpp 
#1732966280
g++ -o main_serial_40_40 -std=gnu++11 main_serial_40_40.cpp 
#1732966282
ls
#1732966310
bsub -n 1 -q normal -o output_10_10_1 -e error_10_10_1 -m "polus-c3-ib polus-c4-ib" -J 10_10_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_10_10"
#1732966318
bjobs
#1732966323
ls
#1732966331
cat output_mpi_40_40_1.txt 
#1732966334
cat output_mpi_40_40_2.txt 
#1732966337
cat output_mpi_40_40_4.txt 
#1732966395
ls
#1732966441
bsub -n 1 -q normal -o output_serial_40_40 -e error_serial_40_40 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_serial_40_40"
#1732966446
bjobs
#1732966563
ls
#1732966570
cat output_serial_40_40 
#1732966612
cat output_mpi_40_40_1.txt 
#1732966616
cat output_mpi_40_40_2.txt 
#1732966619
cat output_mpi_40_40_4.txt 
#1732966845
exit
#1732966884
mpixlC -o main_mpi -O3 -std=gnu++11 main_mpi.cpp 
#1732966910
module load SpectrumMPI
#1732966912
mpixlC -o main_mpi -O3 -std=gnu++11 main_mpi.cpp 
#1732966944
rm output_mpi_40_40_1.txt 
#1732966950
rm error_mpi_40_40_1.txt 
#1732966976
mpisubmit.pl -p 1 --stdout output_mpi_40_40_1.txt --stderr error_mpi_40_40_1.txt ./main_mpi
#1732966983
bjobs
#1732967056
ls
#1732967060
bjobs
#1732967070
cat output_mpi_40_40_1.txt 
#1732967091
rm output_mpi_40_40_2.txt 
#1732967100
rm error_mpi_40_40_2.txt 
#1732967111
rm output_mpi_40_40_4.txt 
#1732967114
rm error_mpi_40_40_4.txt 
#1732967176
mpisubmit.pl -p 2 --stdout output_mpi_40_40_2.txt --stderr error_mpi_40_40_2.txt ./main_mpi
#1732967183
mpisubmit.pl -p 4 --stdout output_mpi_40_40_4.txt --stderr error_mpi_40_40_4.txt ./main_mpi
#1732967258
cat output_sls
#1732967259
ls
#1732967263
bjobs
#1732967272
cat output_mpi_40_40_2.txt 
#1732967275
cat output_mpi_40_40_1.txt 
#1732967283
cat output_mpi_40_40_4.txt 
#1732967298
cat output_serial_40_40 
#1732967337
g++ -o main_serial_40_40 -O3 main_serial_40_40.cpp 
#1732967357
g++ -o main_serial_40_40 -O3 -std=gnu++11 main_serial_40_40.cpp 
#1732967408
bsub -n 1 -q normal -o output_serial_40_40 -e error_serial_40_40 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_serial_40_40"
#1732967414
rm output_serial_40_40 
#1732967420
rm error_serial_40_40 
#1732967421
ls
#1732967423
bjobs
#1732967433
cat output_serial_40_40 
#1732967450
g++ -o main_serial_40_40 -O2 -std=gnu++11 main_serial_40_40.cpp 
#1732967465
cat output_serial_40_40 
#1732967478
cat output_mpi_40_40_1.txt 
#1732967482
cat output_mpi_40_40_2.txt 
#1732967545
g++ -o main_serial_40_40 -O2 -std=gnu++11 main_serial_40_40.cpp 
#1732967731
bsub -n 1 -q normal -o output_serial_40_40 -e error_serial_40_40 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_serial_40_40"
#1732967732
ls
#1732967754
bjobs
#1732967759
cat output_serial_40_40 
#1732967776
bjobsrm output_serial_40_40 
#1732967789
rm output_serial_40_40 
#1732967797
rm error_serial_40_40 
#1732967799
ls
#1732967819
g++ -o main_serial_40_40 -O1 -std=gnu++11 main_serial_40_40.cpp 
#1732967832
bsub -n 1 -q normal -o output_serial_40_40 -e error_serial_40_40 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_serial_40_40"
#1732967836
bjobs
#1732967869
cat output_serial_40_40 
#1732967876
rm output_serial_40_40 
#1732967880
rm error_serial_40_40 
#1732967886
g++ -o main_serial_40_40 -O0 -std=gnu++11 main_serial_40_40.cpp 
#1732967891
bsub -n 1 -q normal -o output_serial_40_40 -e error_serial_40_40 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_serial_40_40"
#1732967923
bjobs
#1732967927
cat output_serial_40_40 
#1732967949
rm error_serial_40_40 
#1732967953
rm output_serial_40_40 
#1732967985
bsub -n 1 -q normal -o output_serial_40_40 -e error_serial_40_40 -m "polus-c3-ib polus-c4-ib" -J 40_40_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_serial_40_40"
#1732968668
exit
#1732968699
ls
#1732968752
mv main_90_80.cpp main_80_90.cpp
#1732968757
ls
#1732968770
mv main_mpi_90_80.cpp main_mpi_80_90.cpp
#1732968770
ls
#1732968815
exit
#1732968833
ls
#1732968905
ls main_mpi_80_90.cpp 
#1732968996
vim main_mpi_80_90.cpp 
#1732969003
mpixlC -o main_mpi_80_90 -O3 -std=gnu++11 main_mpi_80_90.cpp
#1732969016
module load SpectrumMPI
#1732969022
mpixlC -o main_mpi_80_90 -O3 -std=gnu++11 main_mpi_80_90.cpp
#1732969030
mpisubmit.pl -p 1 --stdout output_mpi_80_90_1.txt --stderr error_mpi_80_90_1.txt ./main_mpi_80_90
#1732969036
mpisubmit.pl -p 2 --stdout output_mpi_80_90_2.txt --stderr error_mpi_80_90_2.txt ./main_mpi_80_90
#1732969041
mpisubmit.pl -p 4 --stdout output_mpi_80_90_4.txt --stderr error_mpi_80_90_4.txt ./main_mpi_80_90
#1732969047
mpisubmit.pl -p 8 --stdout output_mpi_80_90_8.txt --stderr error_mpi_80_90_8.txt ./main_mpi_80_90
#1732969119
bjobs
#1732969157
exit
#1732969178
bjobs
#1732969185
mpixlC -o main_mpi_160_180 -O3 -std=gnu++11 main_mpi_160_180.cpp
#1732969192
module load SpectrumMPI
#1732969197
mpixlC -o main_mpi_160_180 -O3 -std=gnu++11 main_mpi_160_180.cpp
#1732969204
mpisubmit.pl -p 1 --stdout output_mpi_160_180_1.txt --stderr error_mpi_160_180_1.txt ./main_mpi_160_180
#1732969210
mpisubmit.pl -p 2 --stdout output_mpi_160_180_2.txt --stderr error_mpi_160_180_2.txt ./main_mpi_160_180
#1732969215
mpisubmit.pl -p 4 --stdout output_mpi_160_180_4.txt --stderr error_mpi_160_180_4.txt ./main_mpi_160_180
#1732969220
mpisubmit.pl -p 8 --stdout output_mpi_160_180_8.txt --stderr error_mpi_160_180_8.txt ./main_mpi_160_180
#1732969252
bjobs
#1732969254
ls
#1732969262
cat output_mpi_160_180_1.txt 
#1732969287
cat output_mpi_80_90_1.txt 
#1732969290
cat output_mpi_80_90_2.txt 
#1732969292
cat output_mpi_80_90_4.txt 
#1732969296
cat output_mpi_80_90_8.txt 
#1732969731
rm output_mpi_160_180_*
#1732969739
rm error_mpi_160_180_*
#1732969740
ls
#1732969745
exit
#1732969771
module load SpectrumMPI
#1732969778
mpixlC -o main_mpi_160_180 -O3 -std=gnu++11 main_mpi_160_180.cpp
#1732969785
mpisubmit.pl -p 1 --stdout output_mpi_160_180_1.txt --stderr error_mpi_160_180_1.txt ./main_mpi_160_180
#1732969790
mpisubmit.pl -p 2 --stdout output_mpi_160_180_2.txt --stderr error_mpi_160_180_2.txt ./main_mpi_160_180
#1732969796
mpisubmit.pl -p 4 --stdout output_mpi_160_180_4.txt --stderr error_mpi_160_180_4.txt ./main_mpi_160_180
#1732969802
mpisubmit.pl -p 8 --stdout output_mpi_160_180_8.txt --stderr error_mpi_160_180_8.txt ./main_mpi_160_180
#1732969804
bjobs
#1732969828
cat output_mpi_80_90_1.txt 
#1732969881
bjobs
#1732969894
cat output_mpi_80_90_2.txt 
#1732969911
cat output_mpi_80_90_4.txt 
#1732969920
cat output_mpi_80_90_8.txt 
#1732970057
bjobs
#1732970091
mpisubmit.pl -p 16 --stdout output_mpi_160_180_16.txt --stderr error_mpi_160_180_16.txt ./main_mpi_160_180
#1732970093
bjobs
#1732970116
ls
#1732970127
cat output_mpi_160_180_4.txt
#1732970133
cat output_mpi_160_180_8.txt
#1732970183
bjobs
#1732970186
ls
#1732970192
cat output_mpi_160_180_16.txt
#1732970219
bjobs
#1732970433
ls
#1732970454
cat output_mpi_160_180_2.txt 
#1732970484
bjobs
#1732970627
mpisubmit.pl -w 00:30 -p 1 --stdout output_mpi_160_180_1.txt --stderr error_mpi_160_180_1.txt ./main_mpi_160_180
#1732970725
bjobs
#1732970728
ls
#1732970735
cat output_160_180_1
#1732970748
cat output_mpi_160_180_1.txt 
#1732970769
rm output_mpi_160_180_1.txt 
#1732970776
rm error_mpi_160_180_1.txt 
#1732970778
ls
#1732970950
bjobs
#1732971638
cat output_mpi_160_180_1.txt 
#1732971874
exit
#1732971964
rm output_serial_40_40 
#1732971967
exit
#1733044883
ls
#1733044893
rm output_mpi_80_90_*
#1733044900
rm error_mpi_80_90_*
#1733044907
rm output_mpi_160_180_*
#1733044917
rm error_mpi_160_180_*
#1733044918
ls
#1733044935
module load SpectrumMPI
#1733044941
mpixlC -o main_mpi_80_90 -O3 -std=gnu++11 main_mpi_80_90.cpp
#1733044955
mpisubmit.pl -p 1 --stdout output_mpi_80_90_1.txt --stderr error_mpi_80_90_1.txt ./main_mpi_80_90
#1733044959
mpisubmit.pl -p 2 --stdout output_mpi_80_90_2.txt --stderr error_mpi_80_90_2.txt ./main_mpi_80_90
#1733044965
mpisubmit.pl -p 4 --stdout output_mpi_80_90_4.txt --stderr error_mpi_80_90_4.txt ./main_mpi_80_90
#1733044970
mpisubmit.pl -p 8 --stdout output_mpi_80_90_8.txt --stderr error_mpi_80_90_8.txt ./main_mpi_80_90
#1733044976
bjobs
#1733044998
exit
#1733045273
bjobs
#1733045282
mpisubmit.pl -p 16 --stdout output_mpi_160_180_16.txt --stderr error_mpi_160_180_16.txt ./main_mpi_160_180
#1733045287
bjobs
#1733045493
ls
#1733045498
bjobs
#1733045500
exit
#1733045625
ls
#1733045632
bjobs
#1733045662
rm output_160_180_*
#1733045668
rm output_80_90_*
#1733045673
rm error_160_180_*
#1733045678
rm error_80_90_*
#1733045686
ls
#1733045698
rm w.txt 
#1733045702
rm x_*
#1733045703
ls
#1733045711
g++ -std=gnu++11 -O3 -o main_openmp_80_90 -fopenmp main_openmp_80_90.cpp
#1733045715
bjobs
#1733045720
bsub -n 1 -q normal -o output_80_90_1 -e error_80_90_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_openmp_80_90"
#1733045724
bsub -n 1 -q normal -o output_80_90_4 -e error_80_90_4 -m "polus-c3-ib polus-c4-ib" -J 80_90_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_openmp_80_90"
#1733045731
bsub -n 1 -q normal -o output_80_90_8 -e error_80_90_8 -m "polus-c3-ib polus-c4-ib" -J 80_90_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_openmp_80_90"
#1733045735
bjobs
#1733045859
bsub -n 1 -q normal -o output_80_90_16_1 -e error_80_90_16_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_16_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_openmp_80_90"
#1733045866
g++ -std=gnu++11 -O3 -o main_openmp_160_180 -fopenmp main_openmp_160_180.cpp
#1733045871
bsub -n 1 -q normal -o output_160_180_1 -e error_160_180_1 -m "polus-c3-ib polus-c4-ib" -J 160_180_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_openmp_160_180"
#1733045962
mv output_80_90_1 output_openmp_80_90_1
#1733045974
mv output_80_90_2 output_openmp_80_90_4
#1733045979
ls
#1733045982
bjobs
#1733046007
rm output_80_90_*
#1733046023
rm error_80_90_*
#1733046028
rm output_openmp_80_90_1 
#1733046031
bjobs
#1733046045
bkill 1245790
#1733046048
ls
#1733046065
rm output_160_180_1 
#1733046072
rm error_160_180_1 
#1733046077
rm error_serial_40_40 
#1733046083
bjobs
#1733046086
ls
#1733046098
cat output_mpi_80_90_1.txt 
#1733046118
cat output_mpi_80_90_2.txt 
#1733046132
cat output_mpi_80_90_4.txt 
#1733046147
cat output_mpi_80_90_8.txt 
#1733046172
bsub -n 1 -q normal -o output_openmp_80_90_1 -e error_openmp_80_90_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_openmp_80_90"
#1733046178
bsub -n 1 -q normal -o output_openmp_80_90_4 -e error_openmp_80_90_4 -m "polus-c3-ib polus-c4-ib" -J 80_90_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_openmp_80_90"
#1733046183
bsub -n 1 -q normal -o output_openmp_80_90_8 -e error_openmp_80_90_8 -m "polus-c3-ib polus-c4-ib" -J 80_90_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_openmp_80_90"
#1733046188
bsub -n 1 -q normal -o output_openmp_80_90_16_1 -e error_openmp_80_90_16_1 -m "polus-c3-ib polus-c4-ib" -J 80_90_16_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_openmp_80_90"
#1733046209
cat output_mpi_160_180_1.txt 
#1733046229
cat output_mpi_160_180_2.txt 
#1733046241
cat output_mpi_160_180_4.txt 
#1733046258
cat output_mpi_160_180_8.txt 
#1733046269
cat output_mpi_160_180_16.txt 
#1733046284
bjobs
#1733046290
cat output_openmp_80_90_1
#1733046314
cat output_openmp_80_90_2
#1733046328
bsub -n 1 -q normal -o output_openmp_160_180_1 -e error_openmp_160_180_1 -m "polus-c3-ib polus-c4-ib" -J 160_180_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 ./main_openmp_160_180"
#1733046332
bsub -n 1 -q normal -o output_openmp_160_180_4 -e error_openmp_160_180_4 -m "polus-c3-ib polus-c4-ib" -J 160_180_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 ./main_openmp_160_180"
#1733046337
bsub -n 1 -q normal -o output_openmp_160_180_8 -e error_openmp_160_180_8 -m "polus-c3-ib polus-c4-ib" -J 160_180_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 ./main_openmp_160_180"
#1733046344
bsub -n 1 -q normal -o output_openmp_160_180_16 -e error_openmp_160_180_16 -m "polus-c3-ib polus-c4-ib" -J 160_180_16 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=16 ./main_openmp_160_180"
#1733046464
bjobs
#1733046471
bsub -n 1 -q normal -o output_openmp_160_180_32 -e error_openmp_160_180_32 -m "polus-c3-ib polus-c4-ib" -J 160_180_32 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=32 ./main_openmp_160_180

Э
#1733046768
bsub -n 1 -q normal -o output_openmp_160_180_32 -e error_openmp_160_180_32 -m "polus-c3-ib polus-c4-ib" -J 160_180_32 -R "span[hosts=1]" -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=32 ./main_openmp_160_180"
#1733046774
bjobs
#1733046813
cat output_openmp_80_90_1
#1733046838
cat output_openmp_80_90_4
#1733046897
cat output_openmp_80_90_8
#1733046914
cat output_openmp_80_90_16
#1733046936
cat output_openmp_80_90_16_1 
#1733046963
cat output_mpi_80_90_1
#1733046965
cat output_mpi_80_90_1.txt 
#1733046968
cat output_mpi_80_90_2.txt 
#1733046980
cat output_mpi_80_90_4.txt 
#1733046990
cat output_mpi_80_90_8.txt 
#1733047008
bjobs
#1733047019
cat output_openmp_160_180_1
#1733047041
cat output_openmp_160_180_2
#1733047043
cat output_openmp_160_180_4
#1733047072
cat output_openmp_160_180_8
#1733047082
cat output_openmp_160_180_16
#1733047093
cat output_openmp_160_180_32
#1733045030
module load SpectrumMPI
#1733045036
mpixlC -o main_mpi_160_180 -O3 -std=gnu++11 main_mpi_160_180.cpp
#1733045043
bjobs
#1733045051
mpisubmit.pl -w 00:30 -p 1 --stdout output_mpi_160_180_1.txt --stderr error_mpi_160_180_1.txt ./main_mpi_160_180
#1733045056
mpisubmit.pl -p 2 --stdout output_mpi_160_180_2.txt --stderr error_mpi_160_180_2.txt ./main_mpi_160_180
#1733045061
mpisubmit.pl -p 4 --stdout output_mpi_160_180_4.txt --stderr error_mpi_160_180_4.txt ./main_mpi_160_180
#1733045063
bjobs
#1733045099
mpisubmit.pl -p 8 --stdout output_mpi_160_180_8.txt --stderr error_mpi_160_180_8.txt ./main_mpi_160_180
#1733045102
bjobs
#1733609270
ls
#1733609293
180_1    main_openmp_160_180        output_openmp_160_180_32
#1733609300
error_openmp_160_
#1733609301
module load SpectrumMPI
#1733609334
mpixlC -o main_mpi_openmp_80_90 -O3 -std=gnu++11 main_mpi_openmp_80_90.cpp
#1733609722
mpisubmit.pl -p 2 -t 1 --stdout output_mpi_openmp_80_90_2_1.txt --stderr error_mpi_openmp_80_90_2_1.txt ./main_mpi_openmp_80_90
#1733609748
mpisubmit.pl -p 2 -t 2 --stdout output_mpi_openmp_80_90_2_2.txt --stderr error_mpi_openmp_80_90_2_2.txt ./main_mpi_openmp_80_90
#1733609750
bjobs
#1733609761
bjobs -all
#1733609776
clear
#1733609778
bjobs
#1733609857
]mpisubmit.pl -p 2 -t 4 --stdout output_mpi_openmp_80_90_2_4.txt --stderr error_mpi_openmp_80_90_2_4.txt ./main_mpi_openmp_80_90
#1733609864
mpisubmit.pl -p 2 -t 4 --stdout output_mpi_openmp_80_90_2_4.txt --stderr error_mpi_openmp_80_90_2_4.txt ./main_mpi_openmp_80_90
#1733609873
mpisubmit.pl -p 2 -t 8 --stdout output_mpi_openmp_80_90_2_8.txt --stderr error_mpi_openmp_80_90_2_8.txt ./main_mpi_openmp_80_90
#1733609875
bjobs
#1733609878
ls
#1733609888
cat output_mpi_openmp_80_90_2_1.txt 
#1733609891
cat output_mpi_openmp_80_90_2_2.txt 
#1733609914
bjobs
#1733610034
mpisubmit.pl -p 4 -t 1 --stdout output_mpi_openmp_160_180_4_1.txt --stderr error_mpi_openmp_160_180_4_1.txt ./main_mpi_openmp_160_180
#1733610041
bkill 1256171
#1733610054
rm output_mpi_openmp_160_180_4_1.txt 
#1733610061
rm error_mpi_openmp_160_180_4_1.txt 
#1733610064
bjosn
#1733610066
bjobs
#1733610075
cat output_mpi_openmp_80_90_2_4.txt 
#1733610079
cat output_mpi_openmp_80_90_2_2.txt 
#1733610083
cat output_mpi_openmp_80_90_2_8.txt 
#1733610368
exit
#1733610387
module load SpectrumMPI
#1733610402
mpixlC -o main_mpi_openmp_160_180 -fopenmp -qsmp=omp -O3 -std=gnu++11 main_mpi_openmp_160_180.cpp
#1733610419
mpisubmit.pl -p 4 -t 1 --stdout output_mpi_openmp_160_180_4_1.txt --stderr error_mpi_openmp_160_180_4_1.txt ./main_mpi_openmp_160_180
#1733610424
mpisubmit.pl -p 4 -t 2 --stdout output_mpi_openmp_160_180_4_2.txt --stderr error_mpi_openmp_160_180_4_2.txt ./main_mpi_openmp_160_180
#1733610430
mpisubmit.pl -p 4 -t 4 --stdout output_mpi_openmp_160_180_4_4.txt --stderr error_mpi_openmp_160_180_4_4.txt ./main_mpi_openmp_160_180
#1733610434
mpisubmit.pl -p 4 -t 8 --stdout output_mpi_openmp_160_180_4_8.txt --stderr error_mpi_openmp_160_180_4_8.txt ./main_mpi_openmp_160_180
#1733610437
bjobs
#1733671018
ls
#1733671030
vim main_mpi_openmp_80_90.cpp 
#1733678674
ls
#1733678704
module load SpectrumMPI
#1733678724
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 main_mpi_openmp_80_90.cpp
#1733678740
rm output_mpi_openmp_*
#1733678747
rm error_mpi_openmp_*
#1733678757
mpisubmit.pl -p 2 -t 1 --stdout output_mpi_openmp_80_90_2_1.txt --stderr error_mpi_openmp_80_90_2_1.txt ./main_mpi_openmp_80_90
#1733678762
mpisubmit.pl -p 2 -t 2 --stdout output_mpi_openmp_80_90_2_2.txt --stderr error_mpi_openmp_80_90_2_2.txt ./main_mpi_openmp_80_90
#1733678766
mpisubmit.pl -p 2 -t 4 --stdout output_mpi_openmp_80_90_2_4.txt --stderr error_mpi_openmp_80_90_2_4.txt ./main_mpi_openmp_80_90
#1733678772
mpisubmit.pl -p 2 -t 8 --stdout output_mpi_openmp_80_90_2_8.txt --stderr error_mpi_openmp_80_90_2_8.txt ./main_mpi_openmp_80_90
#1733678807
bjobs
#1733679045
bjob
#1733679046
bjobs
#1733679094
OMP_NUM_THREADS=1 mpirun -np 2 ./main_mpi_openmp_80_90
#1733679172
vim main_mpi_openmp_80_90.cpp 
#1733679295
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 main_mpi_openmp_80_90.cpp
#1733679300
OMP_NUM_THREADS=1 mpirun -np 2 ./main_mpi_openmp_80_90
#1733679562
bjons
#1733679564
bjobs
#1733679593
OMP_NUM_THREADS=1 mpirun -np 2 ./main_mpi_openmp_80_90
#1733679609
OMP_NUM_THREADS=2 mpirun -np 2 ./main_mpi_openmp_80_90
#1733679616
OMP_NUM_THREADS=2 mpirun -np 4 ./main_mpi_openmp_80_90
#1733679625
OMP_NUM_THREADS=4 mpirun -np 4 ./main_mpi_openmp_80_90
#1733679660
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -fopenmp -O0 main_mpi_openmp_80_90.cpp
#1733679667
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -fopenmp -O1 main_mpi_openmp_80_90.cpp
#1733679672
OMP_NUM_THREADS=2 mpirun -np 2 ./main_mpi_openmp_80_90
#1733679686
OMP_NUM_THREADS=4 mpirun -np 1 ./main_mpi_openmp_80_90
#1733680034
exit
#1733680055
module load SpectrumMPI
#1733680073
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 main_mpi_openmp_80_90.cpp
#1733680089
bjobs
#1733680102
cat output_mpi_openmp_80_90_2_1.txt 
#1733680139
cat error_mpi_openmp_80_90_2_1.txt
#1733680197
rm error_mpi_openmp_80_90_2_*
#1733680204
rm output_mpi_openmp_80_90_2_*
#1733680668
exit
#1733672209
module load SpectrumMPI
#1733672271
mpic++ --help
#1733672421
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 -std=gnu++11 main_mpi_openmp_80_90.cpp
#1733672467
OMP_NUM_THREADS=2 mpirun -np 2 ./main_mpi_openmp_80_90
#1733672658
mpirun -np 8 ./main_mpi_openmp_80_90
#1733672721
vim main_mpi_openmp_80_90.cpp 
#1733672740
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 -std=gnu++11 main_mpi_openmp_80_90.cpp
#1733672745
mpirun -np 8 ./main_mpi_openmp_80_90
#1733672758
OMP_NUM_THREADS=1 mpirun -np 2 ./main_mpi_openmp_80_90
#1733672769
OMP_NUM_THREADS=1 mpirun -np 8 ./main_mpi_openmp_80_90
#1733672796
mpixlC -o main_mpi_openmp_80_90 -O3 -std=gnu++11 main_mpi_openmp_80_90.cpp
#1733672800
OMP_NUM_THREADS=1 mpirun -np 8 ./main_mpi_openmp_80_90
#1733672807
OMP_NUM_THREADS=1 mpirun -np § ./main_mpi_openmp_80_90
#1733672811
OMP_NUM_THREADS=1 mpirun -np 1 ./main_mpi_openmp_80_90
#1733672843
vim main_mpi_openmp_80_90.cpp 
#1733672876
mpixlC -o main_mpi_openmp_80_90 -O3 -std=gnu++11 main_mpi_openmp_80_90.cpp -qsmp=omp
#1733672882
OMP_NUM_THREADS=1 mpirun -np 1 ./main_mpi_openmp_80_90
#1733672889
OMP_NUM_THREADS=2 mpirun -np 1 ./main_mpi_openmp_80_90
#1733672896
OMP_NUM_THREADS=2 mpirun -np 2 ./main_mpi_openmp_80_90
#1733672906
OMP_NUM_THREADS=1 mpirun -np 2 ./main_mpi_openmp_80_90
#1733673048
vim main_mpi_openmp_80_90.cpp 
#1733673059
mpixlC -o main_mpi_openmp_80_90 -O3 -std=gnu++11 main_mpi_openmp_80_90.cpp -qsmp=omp
#1733673066
OMP_NUM_THREADS=1 mpirun -np 2 ./main_mpi_openmp_80_90
#1733673101
mpixlC -o main_mpi_openmp_80_90 -O0 -std=gnu++11 main_mpi_openmp_80_90.cpp -qsmp=omp
#1733673113
mpixlC -o main_mpi_openmp_80_90 -O0 main_mpi_openmp_80_90.cpp -qsmp=omp
#1733673157
vim main_mpi_openmp_80_90.cpp 
#1733673182
mpixlC -o main_mpi_openmp_80_90 -O0 main_mpi_openmp_80_90.cpp -qsmp=omp
#1733673189
OMP_NUM_THREADS=1 mpirun -np 2 ./main_mpi_openmp_80_90
#1733673200
OMP_NUM_THREADS=1 mpirun -np 1 ./main_mpi_openmp_80_90
#1733673207
OMP_NUM_THREADS=8 mpirun -np 1 ./main_mpi_openmp_80_90
#1733673415
vim main_mpi_openmp_80_90.cpp 
#1733673541
mpixlC -o main_mpi_openmp_80_90 -O3 main_mpi_openmp_80_90.cpp -qsmp=omp
#1733673547
OMP_NUM_THREADS=8 mpirun -np 1 ./main_mpi_openmp_80_90
#1733673556
OMP_NUM_THREADS=8 mpirun -np 2 ./main_mpi_openmp_80_90
#1733673744
OMP_NUM_THREADS=8 I_MPI_PIN_DOMAIN=omp mpirun -np 2 ./main_mpi_openmp_80_90
#1733673826
OMP_NUM_THREADS=8 I_MPI_PIN_DOMAIN=omp OMP_PROC_BIND=true mpirun -np 2 ./main_mpi_openmp_80_90
#1733683198
bjobs
#1733683208
cat output_mpi_openmp_80_90_2_1.txt 
#1733683228
cat error_mpi_openmp_80_90_2_1.txt
#1733683231
htop
#1733683451
exit
#1733680681
module load SpectrumMPI
#1733680699
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 main_mpi_openmp_80_90.cpp
#1733680712
mpisubmit.pl -p 2 -t 1 --stdout output_mpi_openmp_80_90_2_1.txt --stderr error_mpi_openmp_80_90_2_1.txt ./main_mpi_openmp_80_90
#1733680717
mpisubmit.pl -p 2 -t 2 --stdout output_mpi_openmp_80_90_2_2.txt --stderr error_mpi_openmp_80_90_2_2.txt ./main_mpi_openmp_80_90
#1733680721
mpisubmit.pl -p 2 -t 4 --stdout output_mpi_openmp_80_90_2_4.txt --stderr error_mpi_openmp_80_90_2_4.txt ./main_mpi_openmp_80_90
#1733680725
mpisubmit.pl -p 2 -t 8 --stdout output_mpi_openmp_80_90_2_8.txt --stderr error_mpi_openmp_80_90_2_8.txt ./main_mpi_openmp_80_90
#1733680872
bjobs
#1733680889
bjobs -U all
#1733680897
bjobs --help
#1733680904
bjobs -u all
#1733686913
module load SpectrumMPI
#1733686919
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 main_mpi_openmp_80_90.cpp
#1733686931
rm output_mpi_openmp_80_90_2_*
#1733686955
l
#1733686962
rm output_mpi_openmp_80_90_2_*
#1733686971
rm error_mpi_openmp_80_90_2_*
#1733687043
ды
#1733687048
rm error_mpi_openmp_80_90_2_*
#1733687290
ls
#1733687302
rm error_mpi_openmp_80_90_2_4.txt 
#1733687352
vim error_mpi_openmp_80_90_2_8.txt
#1733687390
rm error_mpi_openmp_80_90_2_8.txt 
#1733687584
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_1.txt  -e error_mpi_openmp_80_90_2_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_1 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_80_90"
#1733687600
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_2.txt  -e error_mpi_openmp_80_90_2_2.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_2 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 mpiexec ./main_mpi_openmp_80_90"
#1733687666
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_4.txt  -e error_mpi_openmp_80_90_2_4.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_4 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 mpiexec ./main_mpi_openmp_80_90"
#1733687687
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_8.txt  -e error_mpi_openmp_80_90_2_8.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_8 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_80_90"
#1733687692
bjobs
#1733689596
bjobs
#1733690258
bkill 1257531
#1733690862
bkill 1257530
#1733690867
bjobs
#1733690898
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_4.txt  -e error_mpi_openmp_80_90_2_4.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_4 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 mpiexec ./main_mpi_openmp_80_90"
#1733690904
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_8.txt  -e error_mpi_openmp_80_90_2_8.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_8 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_80_90"
#1733691081
bjobs
#1733731557
ls
#1733731569
cat output_mpi_openmp_80_90_2_4.txt 
#1733731575
cat error_mpi_openmp_80_90_2_4.txt
#1733731611
module load SpectrumMPI
#1733731615
mpiexec 
#1733731640
rm output_mpi_openmp_80_90_2_4.txt 
#1733731644
rm output_mpi_openmp_80_90_2_8.txt 
#1733731654
rm error_mpi_openmp_80_90_2_4.txt 
#1733731659
rm error_mpi_openmp_80_90_2_8.txt 
#1733731660
ls
#1733731671
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_4.txt  -e error_mpi_openmp_80_90_2_4.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_4 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 mpiexec ./main_mpi_openmp_80_90"
#1733731680
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_8.txt  -e error_mpi_openmp_80_90_2_8.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_8 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_80_90"
#1733731682
bjobs
#1733731716
cat error_mpi_openmp_80_90_2_4.txt 
#1733731769
cat output_mpi_openmp_80_90_2_4.txt 
#1733731773
cat output_mpi_openmp_80_90_2_8.txt 
#1733731779
bjobs
#1733731807
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_2.txt  -e error_mpi_openmp_80_90_2_2.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_2 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 mpiexec ./main_mpi_openmp_80_90"
#1733731815
-R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_80_90"
#1733731824
bsub -n 4 -q normal -o output_mpi_openmp_80_90_2_1.txt  -e error_mpi_openmp_80_90_2_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_80_90"
#1733731830
bjobs
#1733731891
cat output_mpi_openmp_80_90_2_1.txt 
#1733731896
ls
#1733731924
bjobs
#1733731930
bkill 1257528
#1733731936
bkill 1257529
#1733731941
cat output_mpi_openmp_80_90_2_1.txt 
#1733731944
cat output_mpi_openmp_80_90_2_2.txt 
#1733731950
cat output_mpi_openmp_80_90_2_4.txt 
#1733731952
cat output_mpi_openmp_80_90_2_8.txt 
#1733732043
rm output_mpi_openmp_80_90_2_*
#1733732053
rm error_mpi_openmp_80_90_2_*
#1733732054
ls
#1733732057
exit
#1733732085
module load SpectrumMPI
#1733732091
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 main_mpi_openmp_80_90.cpp
#1733732106
bsub -n 2 -q normal -o output_mpi_openmp_80_90_2_1.txt  -e error_mpi_openmp_80_90_2_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_80_90"
#1733732111
bsub -n 2 -q normal -o output_mpi_openmp_80_90_2_2.txt  -e error_mpi_openmp_80_90_2_2.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_2 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 mpiexec ./main_mpi_openmp_80_90"
#1733732116
bsub -n 2 -q normal -o output_mpi_openmp_80_90_2_4.txt  -e error_mpi_openmp_80_90_2_4.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_4 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 mpiexec ./main_mpi_openmp_80_90"
#1733732123
bsub -n 2 -q normal -o output_mpi_openmp_80_90_2_8.txt  -e error_mpi_openmp_80_90_2_8.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_2_8 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_80_90"
#1733732257
bjobs
#1733732360
cat output_mpi_openmp_80_90_2_1.txt 
#1733732364
cat output_mpi_openmp_80_90_2_2.txt 
#1733732367
cat output_mpi_openmp_80_90_2_4.txt 
#1733732374
cat output_mpi_openmp_80_90_2_8.txt 
#1733732392
exit
#1733732482
module load SpectrumMPI
#1733732488
bsub -n 2 -q normal -o output_mpi_openmp_80_90_1_1.txt  -e error_mpi_openmp_80_90_1_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_1_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_80_90"
#1733732523
mpixlC -o main_mpi_openmp_160_180 -qsmp=omp -O3 main_mpi_openmp_160_180.cpp
#1733732540
bsub -n 1 -q normal -o output_mpi_openmp_160_180_1_1.txt  -e error_mpi_openmp_160_180_1_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_1_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_160_180"
#1733732562
bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_1.txt  -e error_mpi_openmp_160_180_4_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_160_180"
#1733732579
bjobs
#1733732585
bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_2.txt  -e error_mpi_openmp_160_180_4_2.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_2 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=2 mpiexec ./main_mpi_openmp_160_180"
#1733732603
bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_4.txt  -e error_mpi_openmp_160_180_4_4.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_4 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=4 mpiexec ./main_mpi_openmp_160_180"
#1733732606
bjobs
#1733732621
cat output_mpi_openmp_80_90_1_1.txt 
#1733732626
cat output_mpi_openmp_80_90_2_1.txt 
#1733732647
cat output_mpi_openmp_80_90_2_2.txt 
#1733732651
cat output_mpi_openmp_80_90_2_1.txt 
#1733732654
cat output_mpi_openmp_80_90_2_4.txt 
#1733732656
cat output_mpi_openmp_80_90_2_8.txt 
#1733732661
cat output_mpi_openmp_80_90_1_1.txt 
#1733732701
rm output_mpi_openmp_80_90_1_1.txt 
#1733732709
rm error_mpi_openmp_80_90_1_1.txt 
#1733732717
ls output_mpi_openmp_80_90_2_
#1733732721
ls output_mpi_openmp_80_90_2_*
#1733732727
ls -l output_mpi_openmp_80_90_2_*
#1733732729
bjobs
#1733733787
bsub -n 4 -q normal -o output_mpi_openmp_160_180_2_8.txt  -e error_mpi_openmp_160_180_2_8.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_2_8 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_160_180"
#1733733812
bsub -n 1 -q normal -o output_mpi_openmp_80_90_1_1.txt  -e error_mpi_openmp_80_90_1_1.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_80_90_1_1 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=1 mpiexec ./main_mpi_openmp_80_90"
#1733733842
bjobs
#1733733945
cat output_mpi_openmp_160_180_1_1.txt 
#1733733951
cat output_mpi_openmp_160_180_4_1.txt 
#1733733954
cat output_mpi_openmp_160_180_4_2.txt 
#1733733957
cat output_mpi_openmp_160_180_4_4.txt 
#1733733969
bjobs 
#1733734090
cat output_mpi_openmp_80_90_1_1.txt 
#1733734096
cat output_mpi_openmp_80_90_2_1.txt 
#1733734098
cat output_mpi_openmp_80_90_2_2.txt 
#1733734101
cat output_mpi_openmp_80_90_2_4.txt 
#1733734104
cat output_mpi_openmp_80_90_2_8.txt 
#1733734125
bjobs 
#1733734385
bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_8.txt  -e error_mpi_openmp_160_180_4_8.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_8 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_160_180"
#1733734394
bjobs
#1733735105
cat output_mpi_openmp_160_180_1_1.txt 
#1733735109
cat output_mpi_openmp_160_180_4_1.txt 
#1733735111
cat output_mpi_openmp_160_180_4_2.txt 
#1733735114
cat output_mpi_openmp_160_180_4_.txt 
#1733735742
bjobs
#1733738245
bkill 1258356
#1733738259
bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_8.txt  -e error_mpi_openmp_160_180_4_8.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_8 -R  "affinity[core(8,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_160_180"
#1733738320
bjobs
#1733738345
cat output_mpi_openmp_160_180_4_8.txt
#1733738358
rm output_mpi_openmp_160_180_4_8.txt 
#1733738372
rm error_mpi_openmp_160_180_4_8.txt 
#1733738450
bjobs
#1733751932
bsub -n 4 -q short -o output_mpi_openmp_160_180_4_8_af_6.txt  -e error_mpi_openmp_160_180_4_8_af_6.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_8_af_6 -R  "affinity[core(6,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_160_180
"
#1733752126
bjobs
#1733752212
bsub -n 4 -q short -o output_mpi_openmp_160_180_4_8_af_4.txt  -e error_mpi_openmp_160_180_4_8_af_4.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_8_af_4 -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_160_180"
#1733752217
bjobs
#1733770117
ls
#1733770143
cat output_mpi_openmp_160_180_4_8_af_4.txt 
#1733770152
cat error_mpi_openmp_160_180_4_8_af_4.txt
#1733770248
exit
#1733763639
ls
#1733763670
bjobs
#1733763697
cat output_mpi_openmp_160_180_1_1.txt 
#1733763701
cat output_mpi_openmp_160_180_2_8.txt 
#1733763709
rm error_mpi_openmp_160_180_2_8.txt
#1733763721
rm output_mpi_openmp_160_180_2_8.txt 
#1733763723
bjobs
#1733763727
ls -l
#1733772345
bjobs
#1733775242
bjobs
#1733778656
bjobs
#1733809511
module load SpectrumMPI
#1733809513
bjobs
#1733809568
bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_8_qq.txt  -e error_mpi_openmp_160_180_4_8_qq.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_8_qq -R  "affinity[core(8,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_160_180"
#1733809574
bjibs
#1733809578
bjobs
#1733810122
bkill 1258401
#1733810132
bkill 1258602
#1733810134
bjobs
#1733810166
module load SpectrumMPI
#1733810173
bsub -n 4 -q short -o output_mpi_openmp_160_180_4_8_af_6.txt  -e error_mpi_openmp_160_180_4_8_af_6.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_8_af_6 -R  "affinity[core(6,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_160_180

"
#1733810262
bsub -n 4 -q normal -o output_mpi_openmp_160_180_4_8_af_10.txt  -e error_mpi_openmp_160_180_4_8_af_10.txt -m "polus-c3-ib polus-c4-ib" -J mpi_openmp_160_180_4_8_af_10 -R  "affinity[core(10,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]"  "OMP_NUM_THREADS=8 mpiexec ./main_mpi_openmp_160_180"
#1733810264
bjobs
#1733816654
ls
#1733816656
bjob
#1733816658
bjobs
#1733816667
ls
#1733816678
cat output_mpi_openmp_80_90_1_1.txt 
#1733816697
cat output_mpi_openmp_80_90_2_1.txt 
#1733816716
cat output_mpi_openmp_80_90_2_2.txt 
#1733816728
cat output_mpi_openmp_80_90_2_4.txt 
#1733816739
cat output_mpi_openmp_80_90_2_8.txt 
#1733816755
cat output_mpi_openmp_160_180_1_1.txt 
#1733816773
cat output_mpi_openmp_160_180_4_1.txt 
#1733816782
cat output_mpi_openmp_160_180_4_2.txt 
#1733816794
cat output_mpi_openmp_160_180_4_4.txt 
#1733816806
cat output_mpi_openmp_160_180_4_8.txt 
#1733816808
bjobs
#1733900995
exit
#1733902669
bjobs
#1734306101
ls
#1734306618
mpixlC -o main_mpi_gpu -acc -Minfo=accel -O3 main_mpi_openmp_160_180.cpp
#1734306624
module load SpectrumMPI
#1734306630
mpixlC -o main_mpi_gpu -acc -Minfo=accel -O3 main_mpi_openmp_160_180.cpp
#1734306652
mpixlC -o main_mpi_gpu -acc -Minfo=accel -O3 main_mpi_gpu.cpp
#1734306746
module load SpectrumMPI
#1734306771
mpiCC -o main_mpi_gpu -acc -Minfo=accel -O3 main_mpi_gpu.cpp
#1734306782
mpicc --help
#1734307402
ls
#1734307447
bsub -gpu -q short "mpiexec ./main_mpi_gpu"
#1734307512
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short "mpiexec ./main_mpi_gpu"
#1734307528
bjobs
#1734307555
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_gpu -e error_main_gpu "mpiexec ./main_mpi_gpu"
#1734307558
bjobs
#1734307570
bkill1280820
#1734307574
bkill 1280820
#1734307579
bkill 1280821
#1734307581
bjobs
#1734307640
pgaccelinfo
#1734307683
bjobs
#1734307992
exit
#1734308098
module load SpectrumMPI
#1734308122
mpiCC -o gpu_example -acc -Minfo=accel -O3 gpu_example.cpp
#1734308156
exit
#1734308208
module load SpectrumMPI
#1734308211
mpiCC -o gpu_example -acc -Minfo=accel -O3 gpu_example.cpp
#1734308221
vim gpu_example.cpp :
#1734308292
ls
#1734308295
mpiCC -o gpu_example -acc -Minfo=accel -O3 gpu_example.cpp
#1734308317
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_gpu -e error_main_gpu "mpiexec ./main_mpi_gpu"
#1734308330
bjobs
#1734308382
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec ./gpu_example"
#1734308500
bjobs
#1734308515
ls
#1734308553
bkill 1280830
#1734308584
ls
#1734308601
cat error_gpu_example
#1734308611
cat output_gpu_example 
#1734308834
exit
#1734308846
module load SpectrumMPI
#1734308852
mpiCC -o main_mpi_gpu -acc -Minfo=accel -O3 main_mpi_gpu.cpp
#1734308870
rm output_gpu_example 
#1734308885
rm error_gpu_example 
#1734308887
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec ./gpu_example"
#1734308892
bjobs
#1734308976
cat output_main_mpi_gpu
#1734309015
ls -l output
#1734309020
ls -l output_*
#1734309063
cat output_main_gpu
#1734309087
bjobs
#1734309094
cat output_gpu_example 
#1734309103
cat error_gpu_example 
#1734309176
mpiCC -o gpu_example -acc -Minfo=accel -O3 gpu_example.cpp
#1734309213
exit
#1734309222
module load SpectrumMPI
#1734309227
mpiCC -o gpu_example -acc -Minfo=accel -O3 gpu_example.cpp
#1734309249
rm output_gpu_example 
#1734309254
rm error_gpu_example 
#1734309264
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec ./gpu_example"
#1734309370
bjobs
#1734309433
cat output_gpu_example 
#1734309469
rm output_gpu_example 
#1734309474
rm error_gpu_example 
#1734309491
exit
#1734309503
module load SpectrumMPI
#1734309509
mpiCC -o gpu_example -acc -Minfo=accel -O3 gpu_example.cpp
#1734309514
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec ./gpu_example"
#1734309517
bjobs
#1734309788
cat output_gpu_example 
#1734337740
cat output_main_gpu 
#1734337781
cat output_mpi_openmp_160_180_1_1.txt 
#1734338134
module load SpectrumMPI
#1734338202
mpiCC -o main_mpi_gpu -O3 main_mpi_gpu.cpp
#1734338212
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu -e error_main_mpi_gpu "mpiexec ./main_mpi_gpu"
#1734338216
bjobs
#1734338236
rm output_main_gpu 
#1734338242
rm error_main_gpu 
#1734338244
bjobs
#1734338364
cat output_mpi_openmp_80_90_1_1.txt 
#1734338368
bjobs
#1734338421
cat output_main_mpi_gpu 
#1734338559
rm output_main_gpu 
#1734338569
rm output_main_mpi_gpu 
#1734338573
rm error_main_mpi_gpu 
#1734338579
module load SpectrumMPI
#1734338584
mpiCC -o main_mpi_gpu -O3 main_mpi_gpu.cpp
#1734338597
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu -e error_main_mpi_gpu "mpiexec ./main_mpi_gpu"
#1734338599
bjobs
#1734338798
cat output_main
#1734338799
cat output_main_mpi_gpu 
#1734341555
module load SpectrumMPI
#1734341561
mpiCC -o main_mpi_gpu -O3 main_mpi_gpu.cpp
#1734341577
rm output_main_mpi_gpu 
#1734341582
rm error_main_mpi_gpu 
#1734341584
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu -e error_main_mpi_gpu "mpiexec ./main_mpi_gpu"
#1734341587
bjobs
#1734341941
cat output_main_mpi_gpu 
#1734343826
rm output_main_mpi_gpu 
#1734343828
rm error_main_mpi_gpu 
#1734343832
module load SpectrumMPI
#1734343835
mpiCC -o main_mpi_gpu -O3 main_mpi_gpu.cpp
#1734343842
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu -e error_main_mpi_gpu "mpiexec ./main_mpi_gpu"
#1734343870
bsub -m "polus-c3-ib polus-c4-ib" -n 2 -gpu "num=1" -q short -o output_main_mpi_gpu_2 -e error_main_mpi_gpu_2 "mpiexec ./main_mpi_gpu"
#1734343872
bjobs
#1734344038
cat output_main_mpi_gpu 
#1734344158
bjobs
#1734344167
cat output_main_mpi_gpu_2 
#1734344441
cat error_main_mpi_gpu_2
#1734344499
module load SpectrumMPI
#1734344509
rm error_main_mpi_gp*
#1734385619
module load SpectrumMPI
#1734385626
mpiCC -o main_mpi_simple -O3 main_mpi_simple.cpp
#1734385633
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_1 -e error_mpi_simple_1 "mpiexec ./main_mpi_simple"
#1734385642
rm output_mpi_simple_1 
#1734385644
rm output_mpi_simple_2
#1734385652
rm error_mpi_simple_1
#1734385653
rm error_mpi_simple_2
#1734385663
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_2 -e error_mpi_simple_2 "mpiexec ./main_mpi_simple"
#1734385665
bjons
#1734385667
bjobs
#1734386585
module load SpectrumMPI
#1734386595
mpiCC -o main_mpi_gpu -O3 main_mpi_gpu.cpp
#1734386614
rm output_main_mpi_gpu_1
#1734386654
rm output_main_mpi_gpu_2
#1734386673
rm error_main_mpi_gpu_1
#1734386674
rm error_main_mpi_gpu_2
#1734386688
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_1 -e error_main_mpi_gpu_1 "mpiexec ./main_mpi_gpu"
#1734386697
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_2 -e error_main_mpi_gpu_2 "mpiexec ./main_mpi_gpu"
#1734386776
bjobs
#1734386789
cat output_mpi_simple_
#1734386790
cat output_mpi_simple_1 
#1734386792
cat output_mpi_simple_2
#1734386839
bjobs
#1734387397
pgcc -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.cpp
#1734387415
module load SpectrumMPI
#1734387426
pgcc -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.cpp
#1734387551
mpiCC -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.cpp
#1734387587
bjobs
#1734387754
cat output_main_mpi_gpu_
#1734387755
cat output_main_mpi_gpu_1
#1734387759
cat output_main_mpi_gpu_2
#1734388436
nvcc --help
#1734388634
mpixlC -acc -o main_mpi_gpu -O3 main_mpi_gpu.cpp
#1734388990
mpicc -acc
#1734389010
mpicc -acc main_mpi_gpu.cpp 
#1734389217
load pgi
#1734389260
module load pgi
#1734389277
module load openmpi
#1734389283
exit
#1734381063
module load SpectrumMPI
#1734381125
mpiCC -o main_mpi_simple -O3 main_mpi_simple.cpp
#1734381148
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_1 -e error_mpi_simple_1 "mpiexec ./main_mpi_simple"
#1734381164
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_2 -e error_mpi_simple_2 "mpiexec ./main_mpi_simple"
#1734381167
bjobs
#1734381433
cat output_mpi_simple_2 
#1734381438
bjobs
#1734381766
cat output_mpi_simple_1
#1734381903
module load SpectrumMPI
#1734381909
mpiCC -o main_mpi_gpu -O3 main_mpi_gpu.cpp
#1734381939
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_1 -e error_main_mpi_gpu_1 "mpiexec ./main_mpi_gpu"
#1734381948
rm output_main_mpi_gpu
#1734381950
rm output_main_mpi_gpu_2 
#1734382004
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_2 -e error_main_mpi_gpu_2 "mpiexec ./main_mpi_gpu"
#1734382007
bjobs
#1734384355
bjobs
#1734384366
cat output_main_mpi_gpu_1 
#1734384370
cat output_main_mpi_gpu_2
#1734389291
module load openmpi
#1734389298
module load pgi
#1734389334
pgc++ -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.cpp
#1734389905
clear
#1734389906
pgc++ -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.cpp
#1734389990
pgc++ -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.cpp
#1734390005
ls -al main_mpi_simple
#1734390018
rm output_mpi_simple_1
#1734390020
rm output_mpi_simple_2
#1734390029
rm error_mpi_simple_1 
#1734390030
rm error_mpi_simple_2
#1734390047
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_1 -e error_mpi_simple_1 "mpiexec ./main_mpi_simple"
#1734390053
bjobs
#1734390071
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_2 -e error_mpi_simple_2 "mpiexec ./main_mpi_simple"
#1734390104
bjobs
#1734390114
cat output_mpi_simple_1 
#1734390120
cat output_mpi_simple_2
#1734390157
bsub -n 4 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_4 -e error_mpi_simple_4 "mpiexec ./main_mpi_simple"
#1734390184
bjobs
#1734390187
cat output_mpi_simple_4
#1734394058
module load OpenMPI
#1734394068
module load pgi
#1734394082
module load openmpi
#1734394374
exit
#1734392153
module load openmpi
#1734392160
module load pgi
#1734392204
pgcc -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.cpp
#1734392227
pgcc -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.c
#1734392258
ls
#1734392465
pgcc -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.c
#1734392690
clear
#1734392734
rm output_mpi_simple_1
#1734392735
rm output_mpi_simple_2
#1734392740
rm error_mpi_simple_2
#1734392744
rm error_mpi_simple_1
#1734392745
rm error_mpi_simple_4
#1734392748
rm output_mpi_simple_4
#1734392780
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_1 -e error_mpi_simple_1 "mpiexec ./main_mpi_simple"
#1734392784
bjobs
#1734392802
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_2 -e error_mpi_simple_2 "mpiexec ./main_mpi_simple"
#1734392811
bsub -n 4 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_4 -e error_mpi_simple_4 "mpiexec ./main_mpi_simple"
#1734392815
bjobs
#1734392864
clear
#1734392870
bjobs
#1734392974
clear
#1734392990
pgcc -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_gpu.c
#1734393122
bjobs
#1734393130
clear
#1734393195
bjobs
#1734393219
pgcc -O3 -lm -L/opt/open_mpi/lib -lmpi -I/opt/open_mpi/include -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_gpu.c
#1734393600
bjobs
#1734393620
cat output_mpi_simple_1 
#1734393623
cat output_mpi_simple_2
#1734393628
cat output_mpi_simple_4
#1734440903
module load SpectrumMPI
#1734440906
bjobs
#1734440921
mpicxx 
#1734440925
which mpicxx 
#1734440937
ls -al /opt/ibm/spectrum_mpi/bin/mpicxx
#1734440952
cat /opt/ibm/spectrum_mpi/bin/mpicxx
#1734441094
module load pgi
#1734441243
cat /opt/ibm/spectrum_mpi/bin/mpicxx | grep pick_default_compiler
#1734442161
echo $OMPI_CC
#1734442215
exit
#1734477104
module load openmpi
#1734477118
cat mpicxx 
#1734477126
which mpicxx
#1734477134
cat /polusfs/soft/PGI/linuxpower/2018/mpi/openmpi-2.1.2/bin/mpicxx
#1734477169
module load pgi
#1734477179
mpicxx 
#1734477196
which mpicxx
#1734477211
cat /polusfs/soft/PGI/linuxpower/2018/mpi/openmpi-2.1.2/bin/mpicxx
#1734477286
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.c
#1734477481
rm output_mpi_simple_1 
#1734477483
rm output_mpi_simple_2
#1734477484
rm output_mpi_simple_4
#1734477492
rm error_mpi_simple_4
#1734477494
rm error_mpi_simple_2
#1734477494
rm error_mpi_simple_1
#1734477581
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.c
#1734477605
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_1 -e error_mpi_simple_1 "mpiexec ./main_mpi_simple"
#1734477611
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_2 -e error_mpi_simple_2 "mpiexec ./main_mpi_simple"
#1734477629
mpiexec -n 2 ./main_mpi_simple
#1734477652
clear
#1734477654
bjobs
#1734477663
cat output_mpi_simple_1 
#1734477676
cat output_mpi_simple_2
#1734477750
cat error_mpi_simple_2
#1734478013
clear
#1734478014
cat error_mpi_simple_2
#1734478147
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.c
#1734478159
mpiexec -n 1 ./main_mpi_simple
#1734478166
clear
#1734478169
mpiexec -n 1 ./main_mpi_simple
#1734478178
mpiexec -n 2 ./main_mpi_simple
#1734478193
mpiexec -np 2 ./main_mpi_simple
#1734478243
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.c
#1734478248
mpiexec -np 2 ./main_mpi_simple
#1734475376
module load SpectrumMPI
#1734475382
mpixlC -o main_mpi_openmp_80_90 -qsmp=omp -O3 main_mpi_openmp_80_90.cpp
#1734475422
mpixlC main_mpi_openmp_80_90.cpp -o main_mpi_openmp_80_90 -qsmp=omp -O3
#1734475446
mpixlC main_mpi_openmp_80_90.cpp -o main_mpi_openmp_80_90 -qsmp=omp -O3 -std=c++11
#1734478707
module load openmpi
#1734478711
module load pgi
#1734478725
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.c
#1734478756
mpiexec -n 2 ./main_mpi_simple
#1734478763
mpiexec -n 1 ./main_mpi_simple
#1734478768
mpiexec -n 2 ./main_mpi_simple
#1734478846
rm output_mpi_simple_1
#1734478847
rm output_mpi_simple_2
#1734478861
rm error_mpi_simple_1
#1734478862
rm error_mpi_simple_2
#1734478869
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_1 -e error_mpi_simple_1 "mpiexec ./main_mpi_simple"
#1734478876
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_2 -e error_mpi_simple_2 "mpiexec ./main_mpi_simple"
#1734478887
bjobs
#1734479521
bkill 1283600
#1734479523
bkill 1283601
#1734479526
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_1 -e error_mpi_simple_1 "mpiexec ./main_mpi_simple"
#1734479529
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_2 -e error_mpi_simple_2 "mpiexec ./main_mpi_simple"
#1734479532
bjobs
#1734479674
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.c
#1734479686
rm output_main_mpi_gpu_1
#1734479687
rm output_main_mpi_gpu_2
#1734479689
rm output_main_mpi_gpu_4
#1734479697
rm error_main_mpi_gpu_1
#1734479698
rm error_main_mpi_gpu_2
#1734479709
bjobs
#1734479710
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_1 -e error_main_mpi_gpu_1 "mpiexec ./main_mpi_gpu"
#1734479720
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_2 -e error_main_mpi_gpu_2 "mpiexec ./main_mpi_gpu"
#1734479722
bjobs
#1734479737
clear
#1734479867
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o gpu_example gpu_example.c
#1734479881
bjobs
#1734479889
bkill 1283621
#1734479902
bsub -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec ./gpu_example"
#1734479905
bjobs
#1734480058
bjobs -u all
#1734480300
bjobs
#1734480302
bjobs -u all
#1734480490
bjobs
#1734480495
bjobs -u all
#1734480501
clear
#1734480502
bjobs -u all
#1734480559
clear
#1734480560
bjobs -u all
#1734480676
clear
#1734480677
bjobs -u all
#1734480701
bjobs
#1734480710
bkill 1283622
#1734480731
bsub -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec ./gpu_example"
#1734480734
bjobs
#1734480751
cat output_gpu_example
#1734480781
rm output_gpu_example
#1734480785
cat error_gpu_example 
#1734480792
rm error_gpu_example 
#1734480816
bsub -n 1 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec ./gpu_example"
#1734480822
bjobs
#1734480835
cat output_gpu_example
#1734480842
rm error_gpu_example 
#1734480847
rm output_gpu_example
#1734480861
bsub -n 1 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec -n 1 ./gpu_example"
#1734480870
bjobs
#1734480877
cat output_gpu_example
#1734480887
rm output_gpu_example
#1734480889
rm error_gpu_example 
#1734480895
bsub -n 1 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec -n 1 ./gpu_example"
#1734480964
rm e
#1734480969
rm output_gpu_example
#1734480986
bsub -n 2 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_gpu_example -e error_gpu_example "mpiexec -n 2 ./gpu_example"
#1734480991
bjobs
#1734481004
cat output_gpu_example
#1734481262
bjobs
#1734481529
bkill 1283617
#1734481532
bkill 1283618
#1734481535
bkill 1283620
#1734481562
bsub -n 1 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_1 -e error_mpi_simple_1 "mpiexec -n 1 ./main_mpi_simple"
#1734481573
bsub -n 2 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_2 -e error_mpi_simple_2 "mpiexec -n 2 ./main_mpi_simple"
#1734481591
bjobs
#1734481607
bjobs -U all
#1734481612
bjobs -u all
#1734481646
bjobs
#1734481657
cat output_mpi_simple_2
#1734481666
bjobs
#1734481698
cat output_mpi_simple_1
#1734481788
module load openmpi
#1734481793
module load pgi
#1734481807
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.c
#1734481861
bsub -n 1 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_1 -e error_main_mpi_gpu_1 "mpiexec -n 1 ./main_mpi_gpu"
#1734481863
bjobs
#1734481879
bsub -n 2 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_2 -e error_main_mpi_gpu_2 "mpiexec -n 2 ./main_mpi_gpu"
#1734481880
bjobs
#1734482263
bjobs -u all
#1734482366
bjobs
#1734482887
bkill 1283633
#1734482889
bkill 1283634
#1734482993
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.c
#1734484073
module load openmpi
#1734484079
module load pgi
#1734484087
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.c
#1734484466
ls
#1734484481
rm main_mpi_gpu
#1734484485
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.c
#1734513636
module load openmpi
#1734513641
module load pgi
#1734513647
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu main_mpi_gpu.c
#1734513774
bsub -n 1 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_1 -e error_main_mpi_gpu_1 "mpiexec -n 1 ./main_mpi_gpu"
#1734513782
bsub -n 2 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_2 -e error_main_mpi_gpu_2 "mpiexec -n 2 ./main_mpi_gpu"
#1734513787
ls error_main_mpi_gpu_2
#1734513792
car error_main_mpi_gpu_2
#1734513798
cat error_main_mpi_gpu_2
#1734513806
rm error_main_mpi_gpu_1
#1734513807
rm error_main_mpi_gpu_2
#1734513809
bjobs
#1734513819
clear
#1734513838
bjobs
#1734513844
clear
#1734513886
bjobs
#1734513911
cat output_main_mpi_gpu_1
#1734513917
cat output_main_mpi_gpu_2 
#1734513929
bjobs
#1734513961
cat error_main_mpi_gpu_1
#1734514023
bjobs
#1734514042
rm output_main_mpi_gpu_1
#1734514048
rm error_main_mpi_gpu_1
#1734514069
ls -al main_mpi_gpu
#1734514087
bjobs
#1734514108
bsub -n 1 -m "polus-c2-ib polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_1 -e error_main_mpi_gpu_1 "mpiexec -n 1 ./main_mpi_gpu"
#1734514111
bjobs
#1734514121
bjobs -u all
#1734514146
bjobs
#1734514240
cat output_main_mpi_gpu_1
#1734514256
cat error_main_mpi_gpu_1
#1734514283
rm output_main_mpi_gpu_1
#1734514289
rm error_main_mpi_gpu_1
#1734514297
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_1 -e error_main_mpi_gpu_1 "mpiexec -n 1 ./main_mpi_gpu"
#1734514316
bjobs
#1734514327
bkill 1284132
#1734514342
rm output_main_mpi_gpu_2
#1734514350
rm error_main_mpi_gpu_2
#1734514354
bjobs
#1734514425
cat output_main_mpi_gpu_1
#1734514433
cat bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_1 -e error_main_mpi_gpu_1 "mpiexec -n 1 ./main_mpi_gpu
#1734514442
cat error_main_mpi_gpu_1
#1734514451
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_main_mpi_gpu_2 -e error_main_mpi_gpu_2 "mpiexec -n 2 ./main_mpi_gpu"
#1734514506
bjobs
#1734514730
bkill 1284137
#1734514754
cat output_main_mpi_gpu_2
#1734514764
cat error_main_mpi_gpu_2
#1734514773
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=2" -q short -o output_main_mpi_gpu_2 -e c "mpiexec -n 2 ./main_mpi_gpu"
#1734514781
rm output_main_mpi_gpu_2
#1734514801
rm error_main_mpi_gpu_2
#1734514803
bjobs
#1734514852
ls
#1734514860
bjobs
#1734515382
cat output_main_mpi_gpu_2
#1734517053
module load openmpi
#1734517058
module load pgi
#1734517081
rm output_mpi_simple_1
#1734517082
rm output_mpi_simple_2
#1734517083
rm output_mpi_simple_4
#1734517089
rm error_mpi_simple_1
#1734517090
rm error_mpi_simple_2
#1734517091
rm error_mpi_simple_4
#1734517098
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple.c
#1734517114
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_1 -e error_mpi_simple_1 "mpiexec -n 1 ./main_mpi_simple"
#1734517118
bjobs
#1734517173
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_2 -e error_mpi_simple_2 "mpiexec -n 2 ./main_mpi_simple"
#1734517187
bsub -n 4 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_4 -e error_mpi_simple_4 "mpiexec -n 4 ./main_mpi_simple"
#1734517190
bjobs
#1734517221
clear
#1734517288
bjobs
#1734517295
cat output_mpi_simple_1
#1734517298
cat output_mpi_simple_2
#1734517303
cat output_mpi_simple_4
#1734517583
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu_160_180 main_mpi_gpu_160_180.c
#1734517603
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_1 -e error_main_mpi_gpu_160_180_1 "mpiexec -n 1 ./main_mpi_gpu_160_180"
#1734517626
bjobs
#1734517653
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_2 -e error_main_mpi_gpu_160_180_2 "mpiexec -n 2 ./main_mpi_gpu_160_180"
#1734517656
bjobs
#1734517807
cat output_main_mpi_gpu_160_180_1
#1734520837
bjobs
#1734520847
cat output_main_mpi_gpu_160_180_2
#1734520852
cat output_main_mpi_gpu_160_180_1
#1734520855
cat output_main_mpi_gpu_160_180_2
#1734520867
cat error_main_mpi_gpu_160_180_2
#1734526983
exit
#1734543793
module load openmpi
#1734543798
module load pgi
#1734543804
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu_160_180 main_mpi_gpu_160_180.c
#1734543826
rm output_main_mpi_gpu_160_180_1
#1734543832
rm error_main_mpi_gpu_160_180_1
#1734543840
rm output_main_mpi_gpu_160_180_2
#1734543845
rm error_main_mpi_gpu_160_180_2
#1734543915
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_1 -e error_main_mpi_gpu_160_180_1 "mpiexec -n 1 ./main_mpi_gpu_160_180"
#1734543917
bjons
#1734543919
bjobs
#1734543927
bjobs -u all
#1734543970
bjobs
#1734544115
cat output_main_mpi_gpu_160_180_1
#1734544124
cat error_main_mpi_gpu_160_180_1
#1734544133
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_2 -e error_main_mpi_gpu_160_180_2 "mpiexec -n 2 ./main_mpi_gpu_160_180"
#1734544200
bjobs
#1734544225
clear
#1734544317
bjobs
#1734544327
clear
#1734544561
bjobs
#1734545325
cat output_main_mpi_gpu_160_180_2
#1734545651
rm output_main_mpi_gpu_160_180_1
#1734545652
rm output_main_mpi_gpu_160_180_2
#1734545660
rm error_main_mpi_gpu_160_180_1
#1734545660
rm error_main_mpi_gpu_160_180_2
#1734545683
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_2 -e error_main_mpi_gpu_160_180_2 "mpiexec -n 2 ./main_mpi_gpu_160_180"
#1734545697
bkill 1285282
#1734545708
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu_160_180 main_mpi_gpu_160_180.c
#1734545721
rm error_main_mpi_gpu_160_180_1
#1734545726
rm output_main_mpi_gpu_160_180_1
#1734545728
rm output_main_mpi_gpu_160_180_2
#1734545732
rm error_main_mpi_gpu_160_180_2
#1734545739
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_2 -e error_main_mpi_gpu_160_180_2 "mpiexec -n 2 ./main_mpi_gpu_160_180"
#1734545806
bjobs
#1734549121
bjobs
#1734549129
cat output_main_mpi_gpu_160_180_2
#1734549148
rm output_main_mpi_gpu_160_180_2
#1734549155
rm error_main_mpi_gpu_160_180_2
#1734549165
module load openmpi
#1734549171
module load pgi
#1734549177
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu_160_180 main_mpi_gpu_160_180.c
#1734549232
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_2 -e error_main_mpi_gpu_160_180_2 "mpiexec -n 2 ./main_mpi_gpu_160_180"
#1734549808
bjobs
#1734549825
cat output_main_mpi_gpu_160_180_2
#1734549842
cat output_main_mpi_gpu_160_180_1
#1734554130
rm output_main_mpi_gpu_160_180_1
#1734554131
rm output_main_mpi_gpu_160_180_2
#1734554138
error_main_mpi_gpu_160_180_2
#1734554139
rm error_main_mpi_gpu_160_180_2
#1734554141
rm error_main_mpi_gpu_160_180_1
#1734554146
module load openmpi
#1734554150
module load pgi
#1734554156
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu_160_180 main_mpi_gpu_160_180.c
#1734554168
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_1 -e error_main_mpi_gpu_160_180_1 "mpiexec -n 1 ./main_mpi_gpu_160_180"
#1734554171
bjobs
#1734554307
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_1 -e error_main_mpi_gpu_160_180_1 "mpiexec -n 1 ./main_mpi_gpu_160_180"
#1734554313
bkill 1285715
#1734554315
bjobs
#1734555009
cat output_main_mpi_gpu_160_180_1
#1734555033
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_2 -e error_main_mpi_gpu_160_180_2 "mpiexec -n 2 ./main_mpi_gpu_160_180"
#1734555045
bjobs
#1734555083
bjobs -u all
#1734555123
bjobs
#1734555186
bjobs -u all
#1734555226
bjobs
#1734555229
bjobs -u all
#1734555235
clear
#1734555236
bjobs -u all
#1734555354
clear
#1734555356
bjobs
#1734555359
bjobs -u all
#1734555414
bjobs
#1734555416
bjobs -u all
#1734555431
bjobs
#1734555439
bjobs -u all
#1734555527
bjobs
#1734555542
cat output_main_mpi_gpu_160_180_1
#1734555643
bjobs
#1734555751
cat output_main_mpi_gpu_160_180_2
#1734555755
cat output_main_mpi_gpu_160_180_1
#1734555759
cat output_main_mpi_gpu_160_180_2
#1734556166
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple main_mpi_simple_160_180.c
#1734556176
rm output_mpi_simple_160_180_1
#1734556178
rm output_mpi_simple_160_180_2
#1734556185
rm error_mpi_simple_160_180_1
#1734556186
rm error_mpi_simple_160_180_2
#1734556286
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_160_180_1 -e error_mpi_simple_160_180_1 "mpiexec -n 1 ./main_mpi_simple_160_180"
#1734556304
bjobs
#1734556379
cat output_mpi_simple_160_180_1
#1734556407
rm output_mpi_simple_160_180_1
#1734556412
rm error_mpi_simple_160_180_1
#1734556418
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple_160_180 main_mpi_simple_160_180.c
#1734556426
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_160_180_1 -e error_mpi_simple_160_180_1 "mpiexec -n 1 ./main_mpi_simple_160_180"
#1734556550
bjobs
#1734557775
cat output_mpi_simple_160_180_1
#1734557789
cat output_main_mpi_gpu_160_180_1
#1734558720
echo $ARCH
#1734558724
echo $HOST_COMP
#1734558732
module load openmpi
#1734558734
echo $ARCH
#1734558735
echo $HOST_COMP
#1734558742
module load pgi
#1734558744
echo $ARCH
#1734558745
echo $HOST_COMP
#1734558860
vim Makefile
#1734558869
make
#1734558872
vim Makefile
#1734558930
make build
#1734558939
which module
#1734558967
module load openmpi
#1734558970
make build
#1734558973
vim Makefile
#1734558984
make build
#1734559029
vim build.sh
#1734559037
chmod +x build.sh 
#1734559039
./build.sh 
#1734565061
bjobs
#1734565079
module load openmpi
#1734565084
module load pgi
#1734565093
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_simple_160_180 main_mpi_simple_160_180.c
#1734565104
rm output_mpi_simple_160_180_1
#1734565110
rm error_mpi_simple_160_180_1
#1734565116
rm output_mpi_simple_160_180_2
#1734565129
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1" -q short -o output_mpi_simple_160_180_1 -e error_mpi_simple_160_180_1 "mpiexec -n 1 ./main_mpi_simple_160_180"
#1734565275
bjobs
#1734565285
bjobs -u all
#1734565667
bjobs
#1734565672
clear
#1734565674
bjobs -u all
#1734565936
clear
#1734565938
bjobs
#1734565949
bjobs -u all
#1734566299
bjobs
#1734566302
bjobs -u all
#1734566688
bjobs
#1734566690
bjobs -u all
#1734566796
bjobs
#1734566798
bjobs -u all
#1734566879
bjobs
#1734566881
bjobs -u all
#1734567143
bjobs
#1734567462
bjobs -u all
#1734567797
bjobs
#1734567798
bjobs -u all
#1734568067
bjobs
#1734568072
bjobs -u all
#1734568085
bjobs
#1734568092
clear
#1734568093
exit
#1734561355
cat output_main_mpi_gpu_160_180_12
#1734561358
cat output_main_mpi_gpu_160_180_2
#1734561378
cat output_mpi_simple_1
#1734561390
cat output_mpi_simple_160_180_1
#1734561843
cat error_main_mpi_gpu_160_180_1 
#1734564544
module load openmpi
#1734564549
module load pgi
#1734564555
mpicxx -O3 -lm -acc -ta=tesla:cc60,time -Minfo=accel -o main_mpi_gpu_160_180 main_mpi_gpu_160_180.c
#1734564565
rm output_main_mpi_gpu_160_180_1
#1734564567
rm output_main_mpi_gpu_160_180_2
#1734564577
rm error_main_mpi_gpu_160_180_1
#1734564577
rm error_main_mpi_gpu_160_180_2
#1734564583
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_1 -e error_main_mpi_gpu_160_180_1 "mpiexec -n 1 ./main_mpi_gpu_160_180"
#1734564594
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_2 -e error_main_mpi_gpu_160_180_2 "mpiexec -n 2 ./main_mpi_gpu_160_180"
#1734564599
bjobs
#1734564612
bjobs -u all
#1734564632
bjobs
#1734564641
bkill 1285958
#1734564653
bkill 1285959
#1734564657
bjobs
#1734564664
rm output_main_mpi_gpu_160_180_1
#1734564666
rm output_main_mpi_gpu_160_180_2
#1734564674
rm error_main_mpi_gpu_160_180_1
#1734564675
rm error_main_mpi_gpu_160_180_2
#1734564682
bsub -n 1 -m "polus-c3-ib polus-c4-ib" -gpu "num=1:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_1 -e error_main_mpi_gpu_160_180_1 "mpiexec -n 1 ./main_mpi_gpu_160_180"
#1734564689
bsub -n 2 -m "polus-c3-ib polus-c4-ib" -R  "affinity[core(4,same=socket,exclusive=(socket,alljobs)):membind=localonly:distribute=pack(socket=1)]" -gpu "num=2:mode=exclusive_process" -q short -o output_main_mpi_gpu_160_180_2 -e error_main_mpi_gpu_160_180_2 "mpiexec -n 2 ./main_mpi_gpu_160_180"
#1734568098
bjobs
#1734568101
bjobs -u all
#1734568388
bjobs
#1734568391
bjobs -u all
#1734568545
bjobs
#1734568546
bjobs -u all
#1734568753
bjobs
#1734568755
bjobs -u all
#1734569120
bjobs
#1734569122
bjobs -u all
