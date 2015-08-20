#!/bin/bash

cd /scratch/hpc2862/CAMH/jen/NEAM

for i in $(seq 1 22)
do

cat neam_alignment_chr${CHR}.snp.strand | grep "strand" | awk '{ print $2 }' > flip.chr${CHR}.txt

cat neam_alignment_chr${CHR}.snp.strand | grep " missing" | awk '{ print $2 }' > exclude.chr${CHR}.txt

done
