#Importing the dataset
dataset = read_csv('Salary_Data.csv')
#dataset = dataset, [, 2:3]

#Splitting data into training set and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])

#Fitting simple linear regression to the training set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

#Predicting the test set results
y_pred = predict(regressor, newdata = test_set)

#Visualizing the training set results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
  colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
  colour = 'blue') +
  ggtitle('Salary vs. Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

#Visualizing the test set results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
  colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), #don't change training_set.
  colour = 'blue') +
  ggtitle('Salary vs. Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')
