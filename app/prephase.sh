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

bin/shapeit -B ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR}.flipped -M ${REF_DIR}/genetic_map_chr${CHR}_combined_b37.txt --exclude-snp ${DATA_DIR}/neam_alignment_chr${CHR}.flipped.snp.strand.exclude -O ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR}.flipped.phased
