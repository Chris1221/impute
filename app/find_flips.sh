#!/bin/bash

cd /scratch/${USER}/${DD}

for CHR in $(seq 1 22)
do

cat neam_alignment_chr${CHR}.snp.strand | grep "Strand" | awk '{ print $3 }' > flip.chr${CHR}.txt

cat neam_alignment_chr${CHR}.snp.strand | grep "Missing" | awk '{ print $3 }' > exclude.chr${CHR}.txt

done
