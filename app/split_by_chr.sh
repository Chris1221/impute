

cd /scratch/hpc2862/CAMH/jen/NEAM

/home/hpc2862/Programs/binary_executables/plink --bfile NEAM_QC_complete_150623 --exclude exclude_snp_list.txt --chr $1 --make-bed --out NEAM_QC_complete_150623_chr${1}