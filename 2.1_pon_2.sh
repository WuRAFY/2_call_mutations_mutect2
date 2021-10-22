#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l mem=20g
#PBS -q large
#PBS -V
#PBS -o /data/liuxd/21summer_training/workdir/wufy/out.log
#PBS -e /data/liuxd/21summer_training/workdir/wufy/error.log

workdir=/data/liuxd/21summer_training/workdir/wufy/mutect2
cd $workdir
module load gatk/4.1.3.0

val=""
for n in $(cat ../pat_list.txt)
do
val=${val}-V" "${n}_N.vcf.gz" "
done
echo $val
gatk GenomicsDBImport --merge-input-intervals true --genomicsdb-workspace-path pon_db --reader-threads 8 -L /data/liuxd/21summer_training/data/input/bedfile/truseq/truseq.bed -R ../ref/Homo_sapiens_assembly38.fasta $val
gatk CreateSomaticPanelOfNormals -R ../ref/Homo_sapiens_assembly38.fasta -V gendb://pon_db -O pon.vcf.gz

