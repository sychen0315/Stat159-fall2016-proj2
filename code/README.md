# Code
This directory contains all scripts.

* **functions**: contains `eda-functions.R`, which is need by `eda-script.R`.
* **scripts**: 
	* `eda-script.R`: contains exploratory data analysis code.
	* `pmdp-script.R`: contains pre-modeling data processing code.
	* `tts-script.R`: constains generating training and testing sets code.
	* `OLS-regression-script.R`: fit a Ordinary Least Squares multiple linear regression model.
	* `ridge-regression-script.R`: fit a Ridge regression model.
	* `lasso-regression-script.R`: fit a Lasso regression model.
	* `pcr-script.R`: fit a Principal Components regression model.
	* `pls-script.R`: fit a Partial Least Squares regression model.
	* `session-info.R`: contains code for generating information about R packages, operating system and the R's session.
* **tests**: contains `test-eda-function.R` script, which is used to test our functions.
* **test-that.R**: contains code to run `test-eda-function.R` script.