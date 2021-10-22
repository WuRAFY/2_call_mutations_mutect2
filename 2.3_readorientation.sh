#!/bin/bash
#PBS -l nodes=1:ppn=2
#PBS -l mem=8g
#PBS -q medium
#PBS -V
#PBS -o /data/liuxd/21summer_training/workdir/wufy/out.log
#PBS -e /data/liuxd/21summer_training/workdir/wufy/error.log

workdir=/data/liuxd/21summer_training/workdir/wufy/mutect2
cd $workdir
cat ../pat_list.txt|while read line
do
gatk LearnReadOrientationModel -I ${line}_f1r2.tar.gz -O ${line}_orimodel.tar.gz
done
