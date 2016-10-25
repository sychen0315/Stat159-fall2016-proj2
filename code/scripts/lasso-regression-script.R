# Lasso Regression Models
library(Matrix)
library(glmnet)

# Read Data
scaled_credit <- read.csv("../../data/scaled-credit.csv", sep = ",", row.names = 1)
training_set <- read.csv("../../data/training-set.csv", sep = ",", row.names = 1)
testing_set <- read.csv("../../data/testing_set.csv", sep = ",", row.names = 1)

x <- data.matrix(scaled_credit[,1:11])
y <- scaled_credit$Balance

x_trainning <- data.matrix(training_set[,1:11])
y_trainning <- training_set$Balance

x_testing <- data.matrix(testing_set[,1:11])
y_testing <- testing_set$Balance

# Cross validation
set.seed(1)
lasso_cv_out <- cv.glmnet(x_trainning, y_trainning, alpha=1, intercept = FALSE,
                          standardize = FALSE)

# Select the best model
lasso_bestlam <- lasso_cv_out$lambda.min

# Plot the cross-validation errors
png(file = "../../images/lasso-images/lasso-cv-errors.png")
plot(lasso_cv_out)
dev.off()

# Compute MSE using test set
lasso_pred <- predict(lasso_cv_out, s = lasso_bestlam, newx = x_testing)
lasso_MSE <- mean((lasso_pred - y_testing)^2)

# Refit the model
out <- glmnet(x, y, alpha = 1, intercept = FALSE, standardize = FALSE)
lasso_coef <- predict(out, s = lasso_bestlam, type="coefficients")[1:12,]

# Save output
save(lasso_cv_out, lasso_bestlam, lasso_MSE, lasso_coef, file = "../../data/lasso-regression.RData")

sink(file = "../../data/lasso-output.txt")
writeLines("Lasso Regression")
writeLines("Best Lambda")
lasso_bestlam
writeLines("Official coefficients")
lasso_coef
writeLines("Test MSE")
lasso_MSE
writeLines(" ")
sink()
