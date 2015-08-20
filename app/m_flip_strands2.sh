#!/bin/bash

for i in $(seq 1 22)
do
  qsub -N flip_chr_$i app/flip_strands.sh $i
done

#note: need X
