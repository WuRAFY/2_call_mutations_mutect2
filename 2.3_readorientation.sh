#!/bin/bash
#PBS -l nodes=1:ppn=2
#PBS -l mem=8g
#PBS -q medium
#PBS -V
#PBS -o out.log
#PBS -e error.log

workdir=./mutect2
cd $workdir
cat ../pat_list.txt|while read line
do
gatk LearnReadOrientationModel -I ${line}_f1r2.tar.gz -O ${line}_orimodel.tar.gz
done
