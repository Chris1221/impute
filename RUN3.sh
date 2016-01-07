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

#mkdir snptest
#mkdir process

#rsync -av --progress ${DATA}_chr*.flipped.phased.imputed.* out/

#rsync -av --progress ${DATA}_chr*.flipped.phased.imputed.* process/


cd ${DD}out/

# rm -rf ../plink
# mkdir ../plink
# cp ../*.sample ../snptest/

# fix the problem
gunzip *

# ls | grep 'info\|summary\|warnings\|diplotype' | xargs -d"\n" rm 

for CHR in `seq 1 22`;
do
## Already done
# cat ${DATA}_chr${CHR}.flipped.phased.imputed.* > ${DATA}_chr${CHR}.imputed.gen

$gtool -G --g ${DATA}_chr${CHR}.imputed.gen --s ../${DATA}_chr${CHR}.flipped.phased.sample --ped ../plink/${DATA}_chr${CHR}.imputed.ped --map ../plink/${DATA}_chr${CHR}.imputed.map --chr ${CHR} --sex sex --threshold 0.9

#remove safeties on pipe
# THIS ISNT WORKING
$rename ../plink/${DATA}_chr${CHR}.imputed.map ${CHR} > ../plink/${DATA}_chr${CHR}.renamed.imputed.map

# pipe into 
mv ../plink/${DATA}_chr${CHR}.renamed.imputed.map ../plink/${DATA}_chr${CHR}.imputed.map
done

cd ../plink/

gzip *

cd ../out

cp ../*.sample ./
rm -f ${DATA}_chr*.flipped.phased.imputed.*.*
gzip *


	