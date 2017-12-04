library(readr)
library(ggplot2)
Housing_Price_Train = read_csv("C:/Users/Dmitr/Desktop/MSDS 6371 - 401/Project/Training Data Set/train (1).csv", stringsAsFactors = FALSE)
Housing_Price_Test = read_csv("C:/Users/Dmitr/Desktop/MSDS 6371 - 401/Project/Test Data Set/testCleaned.csv", stringsAsFactors = FALSE)

# Remove SalePrice variable from Train data set as it is not in the test data set
SalePrice = Housing_Price_Train$SalePrice
Housing_Price_Train$SalePrice = NULL

# Comine train and test data sets
Train_Test_Merged= rbind(Housing_Price_Train, Housing_Price_Test)

# Convert categorical columns to factor, filling NA values with missing label
for (col in colnames(Train_Test_Merged)){
  if (typeof(Train_Test_Merged[,col]) == "character"){
    new_col = full_data[,col]
    newcol[is.na(new_col)] = "missing"
    Train_Test_Merged[col] = as.factor(new_col)
  }
}

# Seperate out the train and test data sets
Housing_Price_Train = Train_Test_Merged[1:nrow(Housing_Price_Train),]
Housing_Price_Train$SalePrice = SalePrice
Housing_Price_Test = Train_Test_Merged[(nrow(Housing_Price_Train)+1):nrow(Train_Test_Merged),]

# Check that categorical variables are the same across train and test data sets
summary(Housing_Price_Train)
