

cd /scratch/${USER}/${DD}

/home/${USER}/Programs/binary_executables/plink --bfile NEAM_QC_complete_150623 --exclude exclude_snp_list.txt --chr $1 --make-bed --out NEAM_QC_complete_150623_chr${1}
