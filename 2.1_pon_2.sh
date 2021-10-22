#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l mem=20g
#PBS -q large
#PBS -V
#PBS -o out.log
#PBS -e error.log

workdir=./mutect2
cd $workdir
module load gatk/4.1.3.0

val=""
for n in $(cat ../pat_list.txt)
do
val=${val}-V" "${n}_N.vcf.gz" "
done
gatk GenomicsDBImport --merge-input-intervals true --genomicsdb-workspace-path pon_db --reader-threads 8 -L ../resources/test.bed -R ../ref/reference.fasta $val
gatk CreateSomaticPanelOfNormals -R ../ref/reference.fasta -V gendb://pon_db -O pon.vcf.gz
