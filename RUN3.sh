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
#mkdir ../plink
#cp ../*.sample ../plink/

# ls | grep 'info\|summary\|warnings\|diplotype' | xargs -d"\n" rm 

for CHR in `seq 1 22`;
do
#cat ${DATA}_chr${CHR}.flipped.phased.imputed.* > ../plink/${DATA}_chr${CHR}.imputed.gen
$gtool -G --g ${DATA}_chr${CHR}.imputed.gen --s ../${DATA}_chr${CHR}.flipped.phased.sample --ped ../plink/${DATA}_chr${CHR}.imputed.ped --map ../plink/${DATA}_chr${CHR}.imputed.map --chr ${CHR} --sex sex --threshold 0.9
done



	