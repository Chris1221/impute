#!/bin/bash
#$ -S /bin/bash
#$ -q abaqus.q
#$ -l qname=abaqus.q
#$ -cwd
#$ -V
#$ -j y
#$ -o /home/hpc2862/logs/$JOB_NAME.txt

chr=$1
R=$2
cd $R
source CONFIG

cd $OD
$qctool -g ${DATA}_chr${i}.imputed.gen.gz -s ${DATA}_chr${i}.flipped.phased.sample.gz -maf 0.01 1 -info 0.4 1 -og ${QC}${DATA}_chr${i}.imputed.QC.gen.gz -os ${DATA}_chr${i}.imputed.QC.sample.gz