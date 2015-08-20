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

bin/shapeit -B ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR}.flipped -M ${REF_DIR}/genetic_map_chr${CHR}_combined_b37.txt --input-ref ${REF_DIR}/ALL.chr${CHR}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nomono.haplotypes.gz ${REF_DIR}/ALL.chr${CHR}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nomono.legend.gz ${REF_DIR}/ALL.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.sample --exclude-snp ${DATA_DIR}/neam_alignment_chr${CHR}.flipped.snp.strand.exclude -O ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR}.flipped.phased
