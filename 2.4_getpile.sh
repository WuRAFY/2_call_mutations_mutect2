#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l mem=8g
#PBS -q large
#PBS -V
#PBS -o /data/liuxd/21summer_training/workdir/wufy/out.log
#PBS -e /data/liuxd/21summer_training/workdir/wufy/error.log

workdir=/data/liuxd/21summer_training/workdir/wufy/mutect2
cd $workdir

sed '1d' ../sample_list.txt|awk -vFPAT="([^,]+)|(\"[^\"]+\")" '{print $27}'|while read line
do
gatk GetPileupSummaries \
-I ../data/${line}_sort_MD_BQSR.bam \
-V /data/liuxd/21summer_training/data/input/af-only-gnomad.hg38.vcf.gz \
-L /project/liuxd/npc/hg38/input/bedfile/truseq/truseq.bed \
-O ${line}_pile.table
done

