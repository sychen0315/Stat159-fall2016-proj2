# Pre-modeling Data Processing

# Read Data
credit_df <- read.csv("../../data/Credit.csv", sep = ",", row.names = 1)

# Dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit_df)

# removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[ ,-1], Balance = credit_df$Balance)

# Mean Centering and Standardizing

# scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

# export scaled data
write.csv(scaled_credit, file = "../../data/scaled-credit.csv")
