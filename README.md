# General Imptuation Pipeline
 
The following document details the imputation procedure of four data sets. We will use the ex as an example data set for all of the following examples. Note that this details the logical flow and I've wrapped all of these scripts into several wrappers. If you would like to know an easier way, please contact me. 

This is a *very rough* guide, which will probably require quite a bit of tinkering to get it to work on your personal system. I am in the process of making a better pipeline which is more versatile, however most of the logical steps are here for your reference. 

Ensure that you have copied `CONFIG.template` to `CONFIG` and set your variables accordingly. 

## Reference Panel

We choose an earlier release of 1000G due to known problems with current releases. Note that the reference data is found at `${RD}`

The folder contains 

- `*.legend.gz`
- `*.haplotype.gz`
- `genetic_map_*`

## Quality Control 

#### Chromosome Splitting

To make the imputation more parallel, we will split up the original dataset into individual chromosomes. 

First, navigate to the `impute` directory 

```bash
$ cd /path/to/impute
```

The code required for splitting the chromosomes is found in two files (master / slave)

```bash
app/split_by_chr.sh
app/m_split_by_chr.sh
```

Run the master script to submit all jobs

```bash
$ bash app/m_split_by_chr.sh
```

After splitting by chromosome, we check the alignment of the data against the reference panel:

```bash
app/align_check.sh
app/m_align_check.sh
```

However, we get errors complaining about duplicated SNPs. We want to eliminate duplicated SNPs, preferentially eliminating the `exm` SNPs. We remove all chromosomal files and residual log files with

```bash
rm -f *.log
rm -f chr*.*
```

We now want to remove the duplicated sites, done with

```bash
app/remove_dups.R
```

This creates a file named `exclude_snp_list.txt` with 19538 duplicated SNPs that will be removed from the analysis. We then split the data by chromosome again, and redo the alignment check:

```bash
app/m_split_by_chr2.sh
app/m_align_check.sh
```

which runs through without issue. Now we find any alignment issues and pipe them to two different files, the first will be flipped and the second will be excluded:

```bash
app/find_flips2.sh
```

**Note:** *I messed and and the order is reversed for now, so 2 comes first. I will fix this.*

After finding the flipped sites, we flip them in the original files:

```bash
app/m_flip_strands.sh
```

We now check the alignment again and exclude all issues (flipping again won't do anything). 

```bash
app/find_flips.sh
```

This now creates an exhaustive exclusion list that can be used in the subsequent pre-phasing.

## PrePhasing

The pre-phasing is very simple, involving only one script.  Specify the correct parameters and run

```bash
app/m_prephase.sh
app/prephase.sh
```

This creates two output files for each chromosome:

```bash
*.haps
*.sample
```

which will be used in the subsequent imputation.

## Imputation

Specify chromosomal boundaries in `assets/chromosomal_boundaries.txt` or use the defaults. Run 

```bash
app/m_impute.R
```

Which is an R script which chunks each of the chromosomes into 5MB chunks (as recommended by `Impute2`) and joins together boundary regions, as they are known to have detrimentally low SNP density. The script takes these into account and submits a separate job to the cluster for each chunk. After running, this produces four (plus one) files for each chunk.

```bash
*_region.start.region.end
*_region.start.region.end_info
*_region.start.region.end_info_by_sample
*_region.start.region.end_warnings
(*_region.start.region.end_diplotype_ordering)
```

We save each of the process files in a separate folder, remove them from the original folder, and cat all of the genotypes together into separate chromosome files for easy parallelization. Ensure `grep` ReGeX uses regular ticks, not back ticks, double quotes for variable expansion

```bash
cd ${DD}/ex_folder/ex/out
rsync -a --stat --progress2 * ../process/
ls | grep 'info\|summary\|warnings\|diplotype' | xargs -d"\n" rm 

mkdir ../final
for CHR in $(seq 1 22)
do
    ls | grep "_chr${CHR}.flipped" | xargs -d"\n" cat > ../final/ex.imputed.chr${CHR}.gen
done

cp -R ../final ../ex_AA_imputed
cp #sample files?
gzip ../ex_AA_imputed #check this
```

This produces our final files. 

We move these to an output directory for easier management

## Post-Imputation QC

After imputation has been completed, we want to control the output to have two constraints

- INFO > 0.4
- MAF > 0.01

We use `qctools` for this, released by Oxford. The source may be found [here](http://www.well.ox.ac.uk/~gav/qctool/#overview). We wrap the following command

```
$qctool -g ${DATA}_chr${chr}.imputed.gen.gz -maf 0.01 1 -info 0.4 1 -og ${QC}${DATA}_chr${chr}.imputed.QC.gen
$gtool -G --g ${QC}${DATA}_chr${chr}.imputed.QC.gen.gz --s ${QC}${DATA}_chr${chr}.flipped.phased.sample.gz --ped ../../plink/${pre}/${DATA}_chr${chr}.flipped.phased.ped --map ../../plink/${pre}/${DATA}_chr${chr}.flipped.phased.map --threshold 0.9
```

in a master sub script which submits for all cohorts

```
source CONFIG

for i in $(seq 1 22)
do
	qsub -N ${pre}_chr${i}_qc app/qc.sh ${i} ${R}
done
```

This produces our final products, after a little shuffling around in the file structure. 

## References

Note: These are also contained in the citation.bib file, and I would ask that they are cited in any publication which uses these data.

1. Delaneau, O., Howie, B., Cox, A. J., Zagury, J.-F., & Marchini, J. (2016). Haplotype Estimation Using Sequencing Reads. The American Journal of Human Genetics, 93(4), 687–696. http://doi.org/10.1016/j.ajhg.2013.09.002
2. Howie, B., Marchini, J., & Stephens, M. (2011). Genotype Imputation with Thousands of Genomes. G3: Genes, Genomes, Genetics, 1(6), 457–470. http://doi.org/10.1534/g3.111.001198
3. Howie, B. N., Donnelly, P., & Marchini, J. (2009). A Flexible and Accurate Genotype Imputation Method for the Next Generation of Genome-Wide Association Studies. PLoS Genet, 5(6), e1000529. http://doi.org/10.1371/journal.pgen.1000529
4. O’Connell, J., Gurdasani, D., Delaneau, O., Pirastu, N., Ulivi, S., Cocca, M., … Marchini, J. (2014). A General Approach for Haplotype Phasing across the Full Spectrum of Relatedness. PLoS Genet, 10(4), e1004234. http://doi.org/10.1371/journal.pgen.1004234
5. Purcell, S., Neale, B., Todd-Brown, K., Thomas, L., Ferreira, M. A. R., Bender, D., … Sham, P. C. (2015). PLINK: A Tool Set for Whole-Genome Association and Population-Based Linkage Analyses. The American Journal of Human Genetics, 81(3), 559–575. http://doi.org/10.1086/519795
6. R Core Team. (2015). R: A Language and Environment for Statistical Computing. Vienna, Austria. Retrieved from https://www.r-project.org/
7. Wickham, H., & Francois, R. (2015). dplyr: A Grammar of Data Manipulation. Retrieved from http://cran.r-project.org/package=dplyr
