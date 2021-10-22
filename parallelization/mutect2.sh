#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=2g
#PBS -q large
#PBS -V
#PBS -o out.log
#PBS -e error.log

workdir=./mutect2
cd $workdir

cat ../pat_list.txt|while read line
do
gatk Mutect2 -R ../ref/reference.fasta \
-L ${1} \
-I ../data/${line}_tumor.bam \
-I ../data/${line}_normal.bam \
-normal ${line}_N \
--germline-resource ../resources/germline_resouce.vcf.gz \
--panel-of-normals pon.vcf.gz \
--f1r2-tar-gz ./${line}/${line}_f1r2_${1}.tar.gz \
-O ./${line}/${line}_T_${1}.vcf.gz
done
