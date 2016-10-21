# Training and Testing Sets
# Read Data
scaled_credit <- read.csv("../../data/scaled-credit.csv", sep = ",", row.names = 1)

# Sampling
set.seed(1213)
index <- seq(1,400)
training_index <- sample(index, size =  300, replace = FALSE)

# Generate Sets
training_set <- scaled_credit[training_index,] 
testing_set <- scaled_credit[setdiff(index,training_index),]

# Store sets
write.csv(training_set, file = "../../data/training-set.csv")
write.csv(testing_set, file = "../../data/testing_set.csv")
