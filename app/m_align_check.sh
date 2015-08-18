#!/bin/bash

for i in $(seq 1 22)
do
  qsub -N neam_align_check_chr_$i app/split_by_chr.sh $i
done

#note: need X
