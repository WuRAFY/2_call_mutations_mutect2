cat pat_list.txt|while read line
do 
qsub -F "$line" pon.sh
done
