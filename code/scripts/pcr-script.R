# Ridge Regression Models
library(pls)

# Read Data
scaled_credit <- read.csv("../../data/scaled-credit.csv", sep = ",", row.names = 1)
training_set <- read.csv("../../data/training-set.csv", sep = ",", row.names = 1)
testing_set <- read.csv("../../data/testing_set.csv", sep = ",", row.names = 1)

# Cross validation
set.seed(1)
pcr_cv_out <- pcr(Balance ~., data = training_set, validation = "CV") 
summary(pcr_cv_out)

# Select the best model
pcr_bestcomps <- which.min(pcr_cv_out$validation$PRESS)

# Plot the cross-validation erros
png(file = "../../images/pcr-images/pcr-cv-errors.png")
validationplot(pcr_cv_out, val.type = "MSEP")
dev.off()

# Compute the test MSE
pcr_pred <- predict(pcr_cv_out, testing_set[1:11], ncomp = 10)
pcr_MSE <- mean((pcr_pred - testing_set$Balance)^2)

# Refit the model
pcr_fit <- pcr(Balance ~ ., data = scaled_credit, ncomp = 10)
summary(pcr_fit)

# Save output
save(pcr_cv_out, pcr_bestcomps, pcr_MSE,
     pcr_fit,
     file = "../../data/pcr/pcr.RData")

sink(file = "../../data/pcr/pcr-output.txt")
writeLines("Principal Components Regression")
writeLines("Best number of components")
pcr_bestcomps
writeLines("Summary of pcr model")
summary(pcr_fit)
writeLines("Test MSE")
pcr_MSE
sink()