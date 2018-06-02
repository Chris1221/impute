#!/bin/bash

for i in $(seq 1 22)
do
  qsub -N neam_chr_$i app/split_by_chr.sh $i
done

#special case for chr X
qsub -N neam_chr_X app/split_by_chr.sh X
