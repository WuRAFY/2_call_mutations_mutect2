#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4g
#PBS -q large
#PBS -V
#PBS -o out.log
#PBS -e error.log

ulimit -n 4000
workdir=./mutect2
cd $workdir
module load gatk/4.1.3.0
gatk Mutect2 -R ../ref/reference.fasta \
-I ../data/${1}_tumor.bam \
-I ../data/${1}_normal.bam \
-L ../resources/truseq.bed \
-normal ${1}_N \
--germline-resource ../resources/germline_resouce.vcf.gz \
--panel-of-normals pon.vcf.gz \
--f1r2-tar-gz ${1}_f1r2.tar.gz \
-O ${1}_T.vcf.gz

