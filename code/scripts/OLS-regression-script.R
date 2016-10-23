# Regression Models

# Read Data
training_set <- read.csv("../../data/training-set.csv", sep = ",", row.names = 1)
testing_set <- read.csv("../../data/testing_set.csv", sep = ",", row.names = 1)


# OLS
ols_reg <- lm(Balance ~ . , data = training_set)
ols_reg_sum <- summary(ols_reg)

# Save result
save(ols_reg, file = "../../data/OLS-regression/OLS-regression.RData")

sink(file = "../../data/OLS-regression/OLS-output.txt")
writeLines("Ordinary Least Squares Summary")
ols_reg_sum
sink()

# Plots
png(file = "../../images/OLS-images/residual-plot.png")
plot(ols_reg, which = 1)
dev.off()

png(file = "../../images/OLS-images/normal-qq-plot.png")
plot(ols_reg, which = 2)
dev.off()

png(file = "../../images/OLS-images/scale-location-plot.png")
plot(ols_reg, which = 3)
dev.off()