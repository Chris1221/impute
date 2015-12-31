#!/bin/bash
#$ -S /bin/bash
#$ -q abaqus.q
#$ -l qname=abaqus.q
#$ -cwd
#$ -V
#$ -j y
#$ -o /home/hpc2862/repos/impute/logs/$JOB_NAME.txt

#source the config parms
cd /home/hpc2862/repos/impute

source CONFIG 

cd $DD

# mkdir out
# mkdir process

# rsync -av --progress ${DATA}_chr*.flipped.phased.imputed.* out/

# rsync -av --progress ${DATA}_chr*.flipped.phased.imputed.* process/


cd ${DD}out/

# ls | grep 'info\|summary\|warnings\|diplotype' | xargs -d"\n" rm 

for CHR in `seq 1 22`;
do
cat ${DATA}_chr${CHR}.flipped.phased.imputed.* > ${DATA}_chr${CHR}.imputed.gen
done


	