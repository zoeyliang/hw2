#!/bin/bash
#SBATCH -p debug
#SBATCH --job-name=quake1
#SBATCH --mail-type=ALL            
#SBATCH --mail-user=jliang18@math.umd.edu

#SBATCH --nodes=1
##SBATCH --ntasks=1
#SBATCH --ntasks-per-node=16
##SBATCH --cpus-per-task=16
##SBATCH --threads-per-core=16


#SBATCH -t 00:10:00


. ~/.profile

gcc -fopenmp -O3 -o quake1 quake1.c -lm
./quake1 < quake.in

gprof quake1 gmon.out > analysis_16.txt


