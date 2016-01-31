#!/bin/bash
#$ -S /bin/bash
#$ -q abaqus.q
#$ -l qname=abaqus.q
#$ -cwd
#$ -V
#$ -j y
#$ -o /home/hpc2862/logs/$JOB_NAME.txt

#    ____             _ _ _             ___            _             _ 
#   /___ \_   _  __ _| (_) |_ _   _    / __\___  _ __ | |_ _ __ ___ | |
#  //  / / | | |/ _` | | | __| | | |  / /  / _ \| '_ \| __| '__/ _ \| |
# / \_/ /| |_| | (_| | | | |_| |_| | / /__| (_) | | | | |_| | | (_) | |
# \___,_\ \__,_|\__,_|_|_|\__|\__, | \____/\___/|_| |_|\__|_|  \___/|_|
#  

chr=$1
R=$2
cd $R
source CONFIG

cd $OD
$qctool -g ${DATA}_chr${chr}.imputed.gen.gz -s ${DATA}_chr${chr}.flipped.phased.sample.gz -maf 0.01 1 -info 0.4 1 -og ${QC}${DATA}_chr${chr}.imputed.QC.gen -os ${QC}${DATA}_chr${chr}.imputed.QC.sample