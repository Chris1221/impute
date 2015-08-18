# impute
Phasing and imputation of multiple data sets

----------------------

Things to do
- Check strand alignment
 - [x] Download 1000G 
  - `/scratch/${USER}/CAMH/jen/ALL.integrated_phase1_SHAPEIT_16-06-14.nomono`
  - Problems with latest release, 2.3M SNPs missing w phase 3, so use [this](https://mathgen.stats.ox.ac.uk/impute/data_download_1000G_phase1_integrated_SHAPEIT2_16-06-14.html) one.
 - [ ] Check alignment in `shapeit`
 - OR
 - [ ] ~Convert to bed form~ 
  - Add `GTOOL` to `bin/`
 - [ ] Use strand flip file to flip 1000G file
 - [ ] Merge with NEAM
  -  [ ] Get `.diff` file
 - [ ] Flip NEAM
- [ ] Run `shapeit` on NEAM
