# Stat159 Fall2016 Proj2

## Author
* Siyu Chen
* Shuotong Wu

## Introduction
In this project, we will utilize the model selection method used in Chapter 6, Linear Model Selection and Regularization, from the book "An Introduction to Statistical Learning" by Gareth James, Deniela Witten, Trevor Hastie and Robert Tibshirani.

The following five models will be applied to our dataset: Ordinary Least Squares, Ridge regression, Lasso regression, Principal Components regression and Partial Least Squares regression.

## Structure
The structure of this project is listed as following:

	stat159-fall2016-project2/
    	.gitignore
    	README.md
    	LICENSE
    	Makefile
    	session-info.txt
    	session.sh
    	code/
      		...
    	data/
      		...
      	images/
      		...
      	slides/
      		slides.html
      		slides.Rmd
    	report/
      		report.Rmd
      		report.pdf
      		sections/
        		...
        		
## Reproduce
To reproduce this project:

1. `git clone` this repo
2. `cd` into the folder `Stat159-fall2016-project2`.
3. Run `make` in the terminal to regenerate all output files, graphs and report.
4. We can also reproduce any part as you want by run `make SPECIFIC PART`. More detail about parts you can reproduce are included in `Makefile` as targets.

## Acknowledgement
Thanks for the intructions and examples in <a rel="book" href="http://www-bcf.usc.edu/%7Egareth/ISL/">An Introduction to Statistical Learning</a>.

## License
### Media content
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.       

### Code
All code is licensed under <a rel="license" href="https://opensource.org/licenses/MIT">The MIT License</a>.   