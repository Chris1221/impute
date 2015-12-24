#!/usr/bin/Rscript
#read in vars

args <- commandArgs(TRUE)
range <- args[1]

bound <- read.table(range, h = F)

for(i in 1:22){

  chr <- i

  n_int <- round(bound[i,3]/5000000)

  for(j in 1:(n_int-1)){

    l_range <- j*5000000
    u_range <- (j+1)*5000000

    option <- ""

    if(j == 1){

      l_range <- 1
      u_range <- (j+1)*5000000

      option <- "-allow_large_regions"

    }

    if(j == (n_int-1)){
      l_range <- j*5000000
      u_range <- bound[i,3]

      option <- "-allow_large_regions"
    }

    command <- paste0("qsub -N NEAM_", chr, "_impute_", l_range, "_", u_range, " app/impute.sh ", chr, " ", l_range, " ", u_range, " ", option)
    system(command)

  }

}
