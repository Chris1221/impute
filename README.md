# impute
### Phasing and imputation of multiple data sets

For detailed information, please see the [wiki](https://github.com/Chris1221/impute/wiki) and select the particular data set you are interested in. 

----------------------

Last remaining things

- [x] NEAM is running to finish
- [x] KIS3 is done
- [x] PNAT_EUR is running to finish
- [x] PNAT_AA is running to finish 
- [ ] Finish and package
	- [ ] Below structure


```{sh}
./plink/
	PNAT2_EUR/
		*.map.gz
		*.ped.gz
	KIS3_AA/
		...
	NEAM/
		...
	PNAT_AA/
		...
./snptest/
	PNAT2_EUR/
		*.gen.gz
		*.sample.gz
	KIS3_AA/
		...
	NEAM/
		...
	PNAT_AA/
		...
./docs/
	Imputation_Procedure.Md
	Computational_Resources.Md
	Affiliations.Md
README.Md

```