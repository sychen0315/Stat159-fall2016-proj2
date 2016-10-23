# Ridge Regression Models
library(Matrix)
library(glmnet)

# Read Data
scaled_credit <- read.csv("../../data/scaled-credit.csv", sep = ",", row.names = 1)
training_set <- read.csv("../../data/training-set.csv", sep = ",", row.names = 1)
testing_set <- read.csv("../../data/testing_set.csv", sep = ",", row.names = 1)

x <- data.matrix(scaled_credit[,-1])
y <- scaled_credit$Balance

x_trainning <- data.matrix(training_set[,-1])
y_trainning <- training_set$Balance

x_testing <- data.matrix(testing_set[,-1])
y_testing <- testing_set$Balance

# Cross validation
set.seed(1)
ridge_cv_out <- cv.glmnet(x_trainning, y_tainning, alpha=0, intercept = FALSE,
                    standardize = FALSE)


# Select the best model
bestlam <- ridge_cv_out$lambda.min

# Plot the cross-validation errors
png(file = "../../images/ridge-images/cv-errors.png")
plot(ridge_cv_out)
dev.off()

# Compute MSE using test set
prediction1 <- predict(ridge_cv_out, s = bestlam, newx = x_testing)
ridge_MSE <- mean((prediction1- y_testing)^2)

# Refit the model
out <- glmnet(x, y, alpha = 0, intercept = FALSE, standardize = FALSE)
ridge_coef <- predict(out, s = bestlam, type="coefficients")[1:11,]

# Save output
save(cv_out, bestlam, ridge_MSE, ridge_coef, file = "../../data/ridge-regression.RData")

sink(file = "../../data/regression-output.txt")
writeLines("Ridge Regression")
writeLines("Best Lambda")
bestlam
writeLines("Official coefficients")
ridge_coef
writeLines("Test MSE")
ridge_MSE
writeLines(" ")
sink()