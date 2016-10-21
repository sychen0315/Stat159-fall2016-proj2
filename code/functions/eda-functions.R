# Description: calculate some quantitative variables
# Input: A vector of values of a variable
# Output: A vector of quantitative variables
eda_summary <- function(col) {
  col_summary <- summary(col)
  col_summary[7] <- max(col) - min(col)
  names(col_summary)[7] <- "Range"
  col_summary[8] <- IQR(col)
  names(col_summary)[8] <- "IQR"
  col_summary[9] <- sd(col)
  names(col_summary)[9] <- "Standard Deviation"
  col_summary
}

# Description: plot a histogram and save it
# Input: 
#       col: vector of values; 
#       title: plot title;
#       filename: the save path
# Output: None
eda_hist <- function(col, title, filename){
  png(filename = filename)
  hist(col, main = title)
  dev.off()
}

# Description: plot a boxplot and save it
# Input: 
#       col: vector of values; 
#       title: plot title;
#       filename: the save path
# Output: None
eda_boxplot <- function(col, title, filename) {
  png(filename = filename)
  boxplot(col, main = title)
  dev.off()
}

# Description: compute a table of frequencies and the relative frequency
# Input: 
#       col: vector of values; 
# Output: table of frequencies 
eda_freq <- function(col){
  freq <- table(col)
  prop_freq <- prop.table(freq)
  c(freq, prop_freq)
}

# Description: plot a barplot and save it
# Input: 
#       col: vector of values; 
#       title: plot title;
#       filename: the save path
# Output: None
eda_barplot <- function(col, title, filename){
  freq <- table(col)
  png(filename = filename)
  barplot(freq, main = title)
  dev.off()
}