#!/bin/bash
#$ -S /bin/bash
#$ -q abaqus.q
#$ -l qname=abaqus.q
#$ -cwd
#$ -V
#$ -j y
#$ -o /home/${USER}/logs/$JOB_NAME.txt

cd /home/${USER}/Scripts/impute

CHR=$1
REPO="/home/${USER}/Scripts/impute"
REF_DIR="/scratch/${USER}/${RD}"
DATA_DIR="/scratch/${USER}/${DD}"

bin/plink --bfile ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR} --flip ${DATA_DIR}/flip.chr${CHR}.txt --make-bed --out ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR}.flipped
