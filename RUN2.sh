#!/bin/bash

################# !!! #####################
#                                         #
#         THESE ARE LOCALLY RUN           #
#         bash run; cnt+z; disown         #
#                                         #
################  !!! #####################

#source the config parms

source CONFIG 

cd $R

Rscript app/m_impute.R $range $DATA
