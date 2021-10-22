#!/bin/bash
#PBS -l nodes=1:ppn=2
#PBS -l mem=8g
#PBS -q medium
#PBS -V
#PBS -o pon.log
#PBS -e pon.log

workdir=./mutect2
cd $workdir
module load gatk/4.1.3.0

ulimit -n 4000
gatk Mutect2 -R ../ref/reference.fasta -L ../resources/test.bed -I ../data/${1}_normal.bam -max-mnp-distance 0 -O ${1}_N.vcf.gz
