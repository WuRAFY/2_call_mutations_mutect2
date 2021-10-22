#!/bin/bash
#PBS -l nodes=1:ppn=2
#PBS -l mem=8g
#PBS -q medium
#PBS -V
#PBS -o /data/liuxd/21summer_training/workdir/wufy/out_pon.log
#PBS -e /data/liuxd/21summer_training/workdir/wufy/error_pon.log

workdir=/data/liuxd/21summer_training/workdir/wufy/mutect2
cd $workdir
module load gatk/4.1.3.0

ulimit -n 4000
gatk Mutect2 -R ../ref/Homo_sapiens_assembly38.fasta -L /data/liuxd/21summer_training/data/input/bedfile/truseq/truseq.bed -I ../data/${1}_N_MD_BQSR.bam -max-mnp-distance 0 -O ${1}_N.vcf.gz
