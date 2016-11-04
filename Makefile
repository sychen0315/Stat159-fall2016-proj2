# Variables
credit = data/Credit.csv
training = data/training-set.csv
testing = data/testing-set.csv
scaled_credit = data/scaled-credit.csv

eda_script = code/scripts/eda-script.R 
eda_function = code/functions/eda-functions.R
pdmp_script = code/scripts/pmdp-script.R
tts_script = code/scripts/tts-script.R
ols_script = code/scripts/OLS-regression-script.R
ridge_script = code/scripts/ridge-regression-script.R 
lasso_script = code/scripts/lasso-regression-script.R
pcr_script = code/scripts/pcr-script.R
pls_script = code/scripts/pls-script.R

.PHONY: eda data pmdp tts ols ridge lasso pls pcr session regressions all tests clean

# Default targets
all: eda pmdp tts regressions tests

# Eda traget: Run eda script to calculate summary statistics
eda: $(eda_script) $(eda_function) $(credit)
	Rscript $<

# Pmdp target: Run pmdp scripts to get scaled credit data
pdmp: $(pdmp_script) $(credit)
	Rscript $<

# tts target: Run tts scripts to get training and testing sets
tts: $(tts_script) $(scaled_credit)
	Rscript $<

# Ols target: Fit ols regression 
ols: $(ols_script) $(training) $(testing)
	Rscript $<


# ridge target: Fit ridge regression 
ridge: $(ridge_script) $(training) $(testing) $(scaled_credit)
	Rscript $<
	#cd code/scripts && Rscript ridge-regression-script.R 

# lasso target: Fit lasso regression 
lasso: $(lasso_script) $(training) $(testing) $(scaled_credit)
	Rscript $<

# pcr target: Fit pcr regression 
pcr: $(pcr_script) $(training) $(testing) $(scaled_credit)
	Rscript $<

# pls target: Fit pls regression
pls: $(pls_script) $(scaled_credit) $(training) $(testing)
	Rscript $<


# regressions target: Run all 5 regressions
regressions: 
	make ols
	make ridge
	make lasso
	make pcr
	make pls

# Tests target: Run unit test for eda-functions.R
tests: code/test-that.R code/tests/test-eda-function.R
	Rscript $<

# Data target
data: 
	cd data && curl -O http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

# Session target
session:
	bash session.sh

# Clean target: Delete report.pdf
clean:
	rm -f report/report.pdf
