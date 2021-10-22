cat pat_list.txt|while read line
do
qsub -F "$line" mutect2.sh
done

