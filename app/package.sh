#!/bin/bash
#$ -S /bin/bash
#$ -q abaqus.q
#$ -l qname=abaqus.q
#$ -cwd
#$ -V
#$ -l mf=192G
#$ -j y
#$ -o /home/hpc2862/repos/impute/logs/$JOB_NAME.txt

#!/bin/bash

cd /scratch/hpc2862/CAMH/jen 

mv KIS3_AA/plink/ KIS3_NEAM_PNAT_Imputation/plink/KIS3_AA/
mv NEAM/plink/ KIS3_NEAM_PNAT_Imputation/plink/NEAM/
mv PNAT2_AA/plink/ KIS3_NEAM_PNAT_Imputation/plink/PNAT2_AA/
mv PNAT_EUR/plink/ KIS3_NEAM_PNAT_Imputation/plink/PNAT2_EUR/

mv KIS3_AA/out/ KIS3_NEAM_PNAT_Imputation/snptest/KIS3_AA/
mv PNAT2_AA/out/ KIS3_NEAM_PNAT_Imputation/snptest/PNAT2_AA/
mv PNAT_EUR/out/ KIS3_NEAM_PNAT_Imputation/snptest/PNAT2_EUR/
mv NEAM/info/ KIS3_NEAM_PNAT_Imputation/snptest/NEAM/

mv KIS3_AA/process/ KIS3_NEAM_PNAT_Imputation/info/KIS3_AA/
mv PNAT2_AA/process/ KIS3_NEAM_PNAT_Imputation/info/PNAT2_AA/
mv PNAT_EUR/process/ KIS3_NEAM_PNAT_Imputation/info/PNAT2_EUR/
mv NEAM/*_info KIS3_NEAM_PNAT_Imputation/info/NEAM/
 