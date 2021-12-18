#Data Cleaning and Balancing
library(tidyverse)

set.seed(42)
#Split male and female patients
maleSet <- filter(heart,Sex=="M") %>%
  sample_n(size=193)
femaleSet <- filter(heart,Sex=="F")
#Create balanced sets with 193 from each gender
balancedSet <- rbind(maleSet,femaleSet)

#Splitting into train and test sets
split<- sort(sample(nrow(balancedSet), nrow(balancedSet)*.8))
train <- balancedSet[split,]
test <- balancedSet[-split,]

#Checking the imbalanced in test and train heart disease
mean(test$HeartDisease)
mean(test$HeartDisease)


