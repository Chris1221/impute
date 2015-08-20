#!/bin/bash

for i in $(seq 1 22)
do
  qsub -N neam_align_check_chr_$i app/align_check.sh $i
done

#note: need X
