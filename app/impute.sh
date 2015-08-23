#!/bin/bash
#$ -S /bin/bash
#$ -q abaqus.q
#$ -l qname=abaqus.q
#$ -cwd
#$ -V
#$ -l mf=192G
#$ -j y
#$ -o /home/hpc2862/logs/$JOB_NAME.txt

#!/bin/bash

bash CONFIG

CHR=$1
START=$2
STOP=$3
OPTION=$4


cd /home/hpc2862/Scripts/impute

bin/impute2 \
-known_haps_g ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR}.flipped.phased.haps \
-h ${REF_DIR}/ALL.chr${CHR}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nomono.haplotypes.gz \
-l ${REF_DIR}/ALL.chr${CHR}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nomono.legend.gz \
-m ${REF_DIR}/genetic_map_chr12_combined_b37.txt \
-int ${START} ${STOP} \
-Ne 15000 \
-buffer 250 \
-o ${DATA_DIR}/NEAM_QC_complete_150623_chr${CHR}.flipped.phased.imputed.${START}.${STOP} ${OPTION}
