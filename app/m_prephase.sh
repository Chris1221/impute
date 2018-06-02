#!/bin/bash

for i in $(seq 1 22)
do
  qsub -N neam_phase_chr_$i app/prephase.sh $i
done

#note: need X
