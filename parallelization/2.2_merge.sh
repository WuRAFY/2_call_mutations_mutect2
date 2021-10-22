workdir=/data/liuxd/21summer_training/workdir/wufy/batch_test
cd $workdir
chr=(chr1 chr2 chr3)
cat ../pat_list.txt|while read line
do
cd $workdir/${line}
vcf=`for chr in ${chr[*]};do printf -- "I=${line}_T_${chr}.vcf.gz ";done`
stats=`for chr in ${chr[*]};do printf -- "-stats ${line}_T_${chr}.vcf.gz.stats ";done`
echo $stats
gatk MergeVcfs $vcf O=${line}_T.vcf.gz
gatk MergeMutectStats $stats -O ${line}_T.vcf.gz.stats
rm *chr*.vcf.gz*
done
