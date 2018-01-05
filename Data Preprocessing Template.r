#Import dataset
dataset = read.csv('Data.csv')

#Taking care of missing data, using the mean to replace missing values
dataset$Age = ifelse(is.na(dataset$age),
                    ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                    dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
dataset$Salary)

#Encoding categorical data
dataset$Country = factor(dataset$Country,
levels = c('France', 'Spain', 'Germany')),
labels = c(1, 2, 3)
dataset$Purchased = factor(dataset$Purchased,
levels = c('No', 'Yes')),
labels = c(0, 1)

#Splitting dataset into training set and test set
#install.packages('catools')
library(catools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
