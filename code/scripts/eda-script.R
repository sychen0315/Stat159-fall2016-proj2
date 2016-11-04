# Load functions
source("code/functions/eda-functions.R")
   


# Read data
credit_df <- read.csv("data/Credit.csv", sep = ",", row.names = 1)

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
  # Plot histograms
  hist_title <- paste("Histogram of",colnames(credit_df)[i]) 
  hist_path <- "images/eda-images/histogram-"
  hist_filename <- paste(hist_path, tolower(colnames(credit_df)[i]), 
                         ".png", sep = "")
  eda_hist(credit_df[[i]], hist_title, hist_filename)
  
  # Plot boxplots
  box_title <- paste("Boxplot of",colnames(credit_df)[i]) 
  box_path <- "images/eda-images/boxplot-"
  box_filename <- paste(box_path, tolower(colnames(credit_df)[i]), 
                        ".png", sep = "")
  eda_boxplot(credit_df[[i]], box_title, box_filename)
  
} 
rownames(sum) <- c(colnames(credit_df)[1:6], colnames(credit_df)[11])

# Save summary results
sink(file = "data/eda/eda-quantitative-summary.txt")
writeLines("Summary Statistics")
sum
sink()


# Exploratory data analysis for qualitative variables
gender_freq <- eda_freq(credit_df$Gender)
student_freq <- eda_freq(credit_df$Student)
married_freq <- eda_freq(credit_df$Married)
ethnicity_freq <- eda_freq(credit_df$Ethnicity)

# Make plots for qualitative variables
eda_barplot(credit_df$Gender, "Barplot of Gender", "images/eda-images/barplot-gender.png")
eda_barplot(credit_df$Student, "Barplot of Student", "images/eda-images/barplot-student.png")
eda_barplot(credit_df$Married, "Barplot of Married", "images/eda-images/barplot-married.png")
eda_barplot(credit_df$Ethnicity, "Barplot of Ethnicity", "images/eda-images/barplot-ethnicity.png")

# Save frequency results
sink(file = "data/eda/eda-qualitative-freq.txt")
writeLines("Gender frequency")
gender_freq
writeLines(" ")
writeLines("Student frequency")
student_freq
writeLines(" ")
writeLines("Married frequency")
married_freq
writeLines(" ")
writeLines("Ethnicity frequency")
ethnicity_freq
sink()


# Computes matrix of correlations
quant_df <- credit_df[1:6]
quant_df[7] <- credit_df[11]
matrix_cor <- cor(quant_df)

# Save matrix of correlations
sink(file = "data/eda/eda-matrix-cor.txt")
writeLines("Matrix correlation")
matrix_cor
sink()

save(matrix_cor, file = "data/eda/correlation-matrix.RData")

# Scatterplot matrix
png("images/eda-images/scatterplot-matrix.png")
pairs(~Income+Limit+Rating+Cards+Age+Education+Balance, data = credit_df, 
      main = 'Simple Scatterplot Matrix', cex = 0.8)
dev.off()

# Anova between Balance and all qualiative variables
op <- options(contrasts = c("contr.helmert", "contr.poly"))
aov_qualitative <- aov(Balance~Gender+Student+Married+Ethnicity, data = credit_df) 
summary(aov_qualitative)
options(op)  # reset to previous

# Save anova object
save(aov_qualitative, file = "data/eda/eda-qualitative-anova.RData")


# conditional boxplots between Balance and the qualitative variables
# On gender
balance_male = credit_df$Balance[credit_df$Gender == ' Male']
balance_female = credit_df$Balance[credit_df$Gender == 'Female']
png('images/eda-images/boxplot-Balance-conditional-Gender.png')
boxplot(balance_male, balance_female, names = c('Male', 'Female'), 
        main = 'Boxplot of Balance Conditioned on Gender')
dev.off()

# On student
balance_student = credit_df$Balance[credit_df$Student == 'Yes']
balance_nonstudent = credit_df$Balance[credit_df$Student == 'No']
png('images/eda-images/boxplot-Balance-conditional-Student.png')
boxplot(balance_student, balance_nonstudent, names = c('Student', 'Non-Student'), 
        main = 'Boxplot of Balance Conditioned on Student')
dev.off()

# On marital status
balance_married = credit_df$Balance[credit_df$Married == 'Yes']
balance_single = credit_df$Balance[credit_df$Married == 'No']
png('images/eda-images/boxplot-Balance-conditional-Married.png')
boxplot(balance_married, balance_single, names = c('Married', 'Single'),
        main = 'Boxplot of Balance Conditioned on Marital Status')
dev.off()

# On ethnicity
balance_Caucasian = credit_df$Balance[credit_df$Ethnicity == 'Caucasian']
balance_AA = credit_df$Balance[credit_df$Ethnicity == 'African American']
balance_Asian = credit_df$Balance[credit_df$Ethnicity == 'Asian']
png('images/eda-images/boxplot-Balance-conditional-Ethnicity.png')
boxplot(balance_Caucasian, balance_AA, balance_Asian, 
        names = c('Caucasian', 'African American', 'Asian'), 
        main = 'Boxplot of Balance Conditioned on Ethnicity')
dev.off()