#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l mem=8g
#PBS -q small
#PBS -V
#PBS -o out.log
#PBS -e error.log

module load gatk/4.1.3.0
#gatk FuncotatorDataSourceDownloader --somatic --validate-integrity --extract-after-download
workdir=./mutect2
cd $workdir
cat ../pat_list.txt|while read line
do
gatk Funcotator \
--variant ${line}_filter.vcf \
--reference ../ref/reference.fasta \
--ref-version hg38 \
--data-sources-path ../resoureces/funcotator_dataSources \
--output ${line}.maf \
--remove-filtered-variants \
--output-file-format MAF \
--annotation-default Tumor_Sample_Barcode:${line} 
done
