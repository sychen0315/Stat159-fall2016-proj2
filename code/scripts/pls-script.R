# Ridge Regression Models
library(pls)

# Read Data
scaled_credit <- read.csv("data/scaled-credit.csv", sep = ",", row.names = 1)
training_set <- read.csv("data/training-set.csv", sep = ",", row.names = 1)
testing_set <- read.csv("data/testing-set.csv", sep = ",", row.names = 1)

# Cross validation
set.seed(1)
pls_cv_out <- plsr(Balance ~., data = training_set, validation = "CV") 
summary(pls_cv_out)

# Select the best model
pls_bestcomps <- which.min(pls_cv_out$validation$PRESS)

# Plot the cross-validation erros
png(file = "images/pls-images/pls-cv-errors.png")
validationplot(pls_cv_out, val.type = "MSEP")
dev.off()

# Compute the test MSE
pls_pred <- predict(pls_cv_out, testing_set[1:11], ncomp = pls_bestcomps)
pls_MSE <- mean((pls_pred - testing_set$Balance)^2)

# Refit the model
pls_fit <- plsr(Balance ~ ., data = scaled_credit, ncomp = pls_bestcomps)
summary(pls_fit)

# Save output
save(pls_cv_out, pls_bestcomps, pls_MSE,
     pls_fit,
     file = "data/pls/pls.RData")

sink(file = "data/pls/pls-output.txt")
writeLines("Partial Least Squares")
writeLines("Best number of components")
pls_bestcomps
writeLines("Summary of pls model")
summary(pls_fit)
writeLines("Test MSE")
pls_MSE
sink()
