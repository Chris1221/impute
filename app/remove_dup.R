#!/usr/bin/Rscript

require(data.table)
require(dplyr)
require(tidyr)

setwd("/scratch/hpc2862/CAMH/jen/NEAM")

neam <- fread("NEAM_QC_complete_150623.bim")

#look forward
dup <- neam[base::duplicated(neam$V4),]
exm_dup <- dup[grep("exm", dup$V2),]

#look backwards
dup <- neam[base::duplicated(neam$V4, fromLast=TRUE),]
exm_dup2 <- dup[grep("exm", dup$V2),]

exclude_exm <- c(exm_dup$V2, exm_dup2$V2)

neam_no_exm <- neam[!(neam$V2 %in% exclude_exm),]

dup3 <- neam_no_exm[base::duplicated(neam_no_exm$V4),]

snp_list <- dup3$V2

write.table("exclude_snp_list.txt", colnames = F, rownames= F, quote = F, sep = " ")
