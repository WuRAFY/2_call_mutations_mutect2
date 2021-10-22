#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l mem=8g
#PBS -q small
#PBS -V
#PBS -o /data/liuxd/21summer_training/workdir/wufy/out.log
#PBS -e /data/liuxd/21summer_training/workdir/wufy/error.log

module load gatk/4.1.3.0
#gatk FuncotatorDataSourceDownloader --somatic --validate-integrity --extract-after-download
workdir=/data/liuxd/21summer_training/workdir/wufy/mutect2
cd $workdir
cat ../pat_list.txt|while read line
do
gatk Funcotator \
--variant ${line}_filter.vcf \
--reference ../ref/Homo_sapiens_assembly38.fasta \
--ref-version hg38 \
--data-sources-path /home/wufy/software/funcotator_dataSources.v1.6.20190124s \
--output ${line}.maf \
--remove-filtered-variants \
--output-file-format MAF \
--annotation-default Tumor_Sample_Barcode:${line} 
done
