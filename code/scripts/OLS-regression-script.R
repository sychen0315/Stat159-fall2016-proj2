# Regression Models

# Read Data
training_set <- read.csv("../../data/training-set.csv", sep = ",", row.names = 1)
testing_set <- read.csv("../../data/testing_set.csv", sep = ",", row.names = 1)


# OLS
ols_reg <- lm(Balance ~ . , data = training_set)

ols_reg_sum <- summary(ols_reg)
