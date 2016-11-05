# Regression Models

# Read Data
scaled_credit <- read.csv("data/scaled-credit.csv", sep = ",", row.names = 1)
training_set <- read.csv("data/training-set.csv", sep = ",", row.names = 1)
testing_set <- read.csv("data/testing-set.csv", sep = ",", row.names = 1)


# OLS
ols_reg <- lm(Balance ~ . , data = training_set)
ols_reg_sum <- summary(ols_reg)

# Use the fitted model on testset to calculate MSE
ols_pred <- predict(ols_reg, testing_set[1:11])
ols_MSE <- mean((ols_pred - testing_set[12])^2)

# Refit the model
ols_reg_refit <- lm(Balance ~ . , data = scaled_credit)
ols_coef <- coef(ols_reg_refit)
# Save result
save(ols_reg,ols_reg_sum,ols_MSE, ols_reg_refit, ols_coef,
     file = "data/OLS/OLS-regression.RData")

sink(file = "data/OLS/OLS-output.txt")
writeLines("Ordinary Least Squares Summary")
ols_reg_sum
writeLines(" ")
writeLines("Ordinary Least Squares Test MSE")
ols_MSE
sink()

# Plots
png(file = "images/OLS-images/residual-plot.png")
plot(ols_reg, which = 1)
dev.off()

png(file = "images/OLS-images/normal-qq-plot.png")
plot(ols_reg, which = 2)
dev.off()

png(file = "images/OLS-images/scale-location-plot.png")
plot(ols_reg, which = 3)
dev.off()