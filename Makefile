# Variables
credit = data/Credit.csv
eda_figs = $(wildcard images/eda-images/* .png)
eda_freq = data/eda/eda-qualitative-freq.txt
eda_summary = data/eda/eda-quantitative-summary.txt
cor_data = data/eda/correlation-matrix.RData
cor = data/eda/eda-matrix-cor.txt
aov = data/eda/eda-qualitative-anova.RData




.PHONY: eda data ols session all 

# Default targets
all: eda ols 

# Eda traget
eda: $(eda_figs) $(cor) $(cor_data) $(eda_summary) $(eda_freq) $(aov) 

$(cor): code/scripts/eda-script.R code/functions/eda-functions.R $(credit)
	cd code/scripts && Rscript eda-script.R 
	
$(cor_data): code/scripts/eda-script.R code/functions/eda-functions.R $(credit)
	cd code/scripts && Rscript eda-script.R 

$(eda_summary): code/scripts/eda-script.R code/functions/eda-functions.R $(credit)
	cd code/scripts && Rscript eda-script.R 

$(eda_freq): code/scripts/eda-script.R code/functions/eda-functions.R $(credit)
	cd code/scripts && Rscript eda-script.R 

$(aov): code/scripts/eda-script.R code/functions/eda-functions.R $(credit)
	cd code/scripts && Rscript eda-script.R

$(eda_figs): code/scripts/eda-script.R code/functions/eda-functions.R $(credit)
	cd code/scripts && Rscript -e eda-script.R 

# OLS target
 

# Data target
data: 
	cd data && curl -O http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

# Session target
session:
	cd code/scripts && Rscript session-info-script.R

