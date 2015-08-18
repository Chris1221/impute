# impute
Phasing and imputation of multiple data sets

----------------------

Things to do
- [x] Download 1000G 
 - Problems with latest release, 2.3M SNPs missing w phase 3, so use [this](https://mathgen.stats.ox.ac.uk/impute/data_download_1000G_phase1_integrated_SHAPEIT2_16-06-14.html) one.
- [ ] Convert to bed form
 - GTOOL (add to `bin/`)
- [ ] Use strand flip file to flip 1000G file
- [ ] Merge with NEAM
 -  [ ]Get `.diff` file
- [ ] Flip NEAM
- [ ] Run `shapeit` on NEAM
