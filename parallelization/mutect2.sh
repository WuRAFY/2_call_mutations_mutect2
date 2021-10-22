#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=2g
#PBS -q large
#PBS -V
#PBS -o /data/liuxd/21summer_training/workdir/wufy/batch_test/out.log
#PBS -e /data/liuxd/21summer_training/workdir/wufy/batch_test/error.log

workdir=/data/liuxd/21summer_training/workdir/wufy/batch_test
cd $workdir

cat ../pat_list.txt|while read line
do
gatk Mutect2 -R ../ref/Homo_sapiens_assembly38.fasta \
-L ${1} \
-I ../data/${line}_T_MD_BQSR.bam \
-I ../data/${line}_N_MD_BQSR.bam \
-normal ${line}_N \
--germline-resource /data/liuxd/21summer_training/data/input/af-only-gnomad.hg38.vcf.gz \
--panel-of-normals ../mutect2/pon.vcf.gz \
--f1r2-tar-gz ./${line}/${line}_f1r2_${1}.tar.gz \
-O ./${line}/${line}_T_${1}.vcf.gz
done
