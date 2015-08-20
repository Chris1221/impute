#!/bin/bash
#$ -S /bin/bash
#$ -q abaqus.q
#$ -l qname=abaqus.q
#$ -cwd
#$ -V
#$ -j y
#$ -o /home/hpc2862/logs/$JOB_NAME.txt

cd /home/hpc2862/Scripts/impute

CHR=$1
REPO="/home/hpc2862/Scripts/impute"
REF_DIR="/scratch/hpc2862/CAMH/jen/ALL.integrated_phase1_SHAPEIT_16-06-14.nomono"
DATA_DIR="/scratch/hpc2862/CAMH/jen/NEAM"

bin/plink --bfile ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR} --flip ${DATA_DIR}/flip.chr${CHR}.txt --make-bed --out ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR}.flipped
