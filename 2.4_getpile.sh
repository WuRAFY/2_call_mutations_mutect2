#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l mem=8g
#PBS -q large
#PBS -V
#PBS -o out.log
#PBS -e error.log

workdir=./mutect2
cd $workdir

sed '1d' ../sample_list.txt|awk -vFPAT="([^,]+)|(\"[^\"]+\")" '{print $27}'|while read line
do
gatk GetPileupSummaries \
-I ../data/${line}_tumor.bam \
-V ../resources/germline_resource.vcf.gz \
-L ../resources/test.bed \
-O ${line}_pile.table
done
