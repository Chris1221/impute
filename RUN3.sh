#!/bin/bash

################# !!! #####################
#                                         #
#         THESE ARE LOCALLY RUN           #
#         bash run; cnt+z; disown         #
#                                         #
################  !!! #####################

#source the config parms

source CONFIG 

cd $DD

mkdir out
mkdir process

rsync -av --progress ${DATA}_chr*.flipped.phased.imputed.* out/

rsync -av --progress ${DATA}_chr*.flipped.phased.imputed.* process/


cd out

rsync -a --stat --progress2 * ../process/
ls | grep 'info\|summary\|warnings\|diplotype' | xargs -d"\n" rm 

