#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l mem=8g
#PBS -q medium
#PBS -V
#PBS -o out.log
#PBS -e error.log

workdir=./mutect2
cd $workdir

cat ../pat_list.txt|while read line
do
gatk CalculateContamination \
-I ${line}_T_pile.table \
-matched ${line}_N_pile.table \
-O ${line}_contamination.table \
--tumor-segmentation ${line}_segment.table
done
