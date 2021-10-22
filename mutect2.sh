#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4g
#PBS -q large
#PBS -V
#PBS -o /data/liuxd/21summer_training/workdir/wufy/out.log
#PBS -e /data/liuxd/21summer_training/workdir/wufy/error.log

ulimit -n 4000
workdir=/data/liuxd/21summer_training/workdir/wufy/mutect2
cd $workdir
module load gatk/4.1.3.0
gatk Mutect2 -R ../ref/Homo_sapiens_assembly38.fasta \
-I ../data/${1}_T_sort_MD_BQSR.bam \
-I ../data/${1}_N_sort_MD_BQSR.bam \
-L /data/liuxd/21summer_training/data/input/bedfile/truseq/truseq.bed \
-normal ${1}_N \
--germline-resource /data/liuxd/21summer_training/data/input/af-only-gnomad.hg38.vcf.gz \
--panel-of-normals /data/liuxd/21summer_training/data/input/1000g_pon.hg38.vcf.gz \
--f1r2-tar-gz ${1}_f1r2.tar.gz \
-O ${1}_T.vcf.gz

