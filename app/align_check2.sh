#!/bin/bash
#$ -S /bin/bash
#$ -q abaqus.q
#$ -l qname=abaqus.q
#$ -cwd
#$ -V
#$ -j y
#$ -o /home/${USER}/logs/$JOB_NAME.txt


source CONFIG
cd $R

CHR=$1
REPO=$R
REF_DIR=$RD
DATA_DIR=$DD

bin/shapeit -check -B ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR}.flipped -M ${REF_DIR}/genetic_map_chr${CHR}_combined_b37.txt --exclude-snp ${DATA_DIR}/exclude.chr${CHR}.txt --input-ref ${REF_DIR}/ALL.chr${CHR}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nomono.haplotypes.gz ${REF_DIR}/ALL.chr${CHR}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nomono.legend.gz ${REF_DIR}/ALL.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.sample --output-log ${DATA_DIR}/neam_alignment_chr${CHR}.flipped
