# Load functions
source("../functions/eda-functions.R")

# Read data
credit_df <- read.csv("../../data/Credit.csv", sep = ",", row.names = 1)

# Exploratory data analysis for quantitative variables
sum <- matrix(ncol = 9, nrow = 7)
for (i in c(seq(1,6), 11)) {
  if (i!=11){
    i_summary <- eda_summary(credit_df[[i]])
    sum[i,] <- i_summary
  } 
  else {
    i_summary <- eda_summary(credit_df[[11]])
    sum[7,] <- i_summary
    colnames(sum) <- names(i_summary)
  }
  hist_title <- paste("Histogram of",colnames(credit_df)[i]) 
  hist_path <- "../../images/histogram-"
  hist_filename <- paste(hist_path, tolower(colnames(credit_df)[i]), 
                         ".png", sep = "")
  eda_hist(credit_df[[i]], hist_title, hist_filename)
  
  box_title <- paste("Boxplot of",colnames(credit_df)[i]) 
  box_path <- "../../images/boxplot-"
  box_filename <- paste(box_path, tolower(colnames(credit_df)[i]), 
                        ".png", sep = "")
  eda_boxplot(credit_df[[i]], box_title, box_filename)
  
} 
rownames(sum) <- c(colnames(credit_df)[1:6], colnames(credit_df)[11])



