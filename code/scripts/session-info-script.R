# Print session information
library(devtools)
library(stats)
library(rstudioapi)
library(Matrix)
library(foreach)
library(glmnet)
library(pls)
library(rmarkdown)
library(xtable)
library(ggplot2)


sink("../../session-info.txt")
cat("Session Information\n\n")
print(sessionInfo())
devtools::session_info()
sink()