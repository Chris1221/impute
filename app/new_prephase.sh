#!/bin/bash
#$ -S /bin/bash
#$ -q abaqus.q
#$ -l qname=abaqus.q
#$ -cwd
#$ -V
#$ -j y
#$ -o /home/${USER}/repos/impute/logs/$JOB_NAME.txt

cd $DD
source CONFIG
CHR=$1

$shapeit -B ${DATA}_chr${CHR}.flipped -M ${RD}genetic_map_chr${CHR}_combined_b37.txt --exclude-snp exclude.chr${CHR}.txt -O ${DATA}_chr${CHR}.flipped.phased
