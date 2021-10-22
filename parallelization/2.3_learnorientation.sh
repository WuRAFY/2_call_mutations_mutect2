workdir=./mutect2
cd $workdir
chr=(chr1 chr2 chr3)
cat ../pat_list.txt|while read line
do
cd $workdir/${line}
f1r2=`for chr in ${chr[*]};do printf -- "-stats ${line}_f1r2_${chr}.tar.gz ";done`
echo $f1r2
gatk LearnReadOrientationModel $f1r2 -O ${line}_orimodel.tar.gz
rm *f1r2_chr*.tar.gz
done

