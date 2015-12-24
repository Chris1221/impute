#!/bin/bash

################# !!! #####################
#                                         #
#         THESE ARE LOCALLY RUN           #
#         bash run; cnt+z; disown         #
#                                         #
################  !!! #####################

#source the config parms

source CONFIG 

cd /home/hpc2862/repos/impute

Rscript app/m_impute.R $range