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
gatk FilterMutectCalls -R ../ref/Homo_sapiens_assembly38.fasta \
-V ${line}_T.vcf.gz \
--contamination-table ${line}_contamination.table \
--tumor-segmentation ${line}_segment.table \
--ob-priors ${line}_orimodel.tar.gz \
-O ${line}_filter.vcf
done
