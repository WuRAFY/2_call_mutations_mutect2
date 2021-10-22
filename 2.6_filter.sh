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
gatk FilterMutectCalls -R ../ref/reference.fasta \
-V ${line}_T.vcf.gz \
--contamination-table ${line}_contamination.table \
--tumor-segmentation ${line}_segment.table \
--ob-priors ${line}_orimodel.tar.gz \
-O ${line}_filter.vcf
done
