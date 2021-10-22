#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l mem=8g
#PBS -q medium
#PBS -V
#PBS -o /data/liuxd/21summer_training/workdir/wufy/out.log
#PBS -e /data/liuxd/21summer_training/workdir/wufy/error.log

workdir=/data/liuxd/21summer_training/workdir/wufy/mutect2
cd $workdir

cat ../pat_list.txt|while read line
do
gatk CalculateContamination \
-I ${line}_T_pile.table \
-matched ${line}_N_pile.table \
-O ${line}_contamination.table \
--tumor-segmentation ${line}_segment.table
done
