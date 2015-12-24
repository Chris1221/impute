#!/usr/bin/Rscript
require(data.table)
require(dplyr)
require(tidyr)

args <- commandArgs(trailingOnly = TRUE)
DD <- args[1]
DATA <- args[2]


setwd(as.character(DD))

df <- fread(paste0(DATA, ".bim"))

#look forward, getting all the ones which are first
dup <- df[base::duplicated(df$V4),]
exm_dup <- dup[grep("exm", dup$V2),]

#look backwards, getting all the dups that are second
dup <- df[base::duplicated(df$V4, fromLast=TRUE),]
exm_dup2 <- dup[grep("exm", dup$V2),]

#combine together into one vector
exclude_exm <- c(exm_dup$V2, exm_dup2$V2)

#remove this list form the original data frame
df_no_exm <- df[!(df$V2 %in% exclude_exm),]

#list the rest of the duplicates, these dont matter which order maybe.  check this
dup3 <- df_no_exm[base::duplicated(df_no_exm$V4),]

#print out and write exclude list to be used with plink
snp_list <- c(exclude_exm, dup3$V2)
write.table(snp_list, "exclude_snp_list.txt", col.names = F, row.names= F, quote = F, sep = " ")
