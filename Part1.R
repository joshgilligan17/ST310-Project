#Data Cleaning and Balancing
library(tidyverse)

set.seed(80)
#Split male and female patients

heart <- filter(heart,heart$Cholesterol!=0)
femaleSet <- filter(heart,Sex=="F")
maleSet <- filter(heart,Sex=="M") %>%
  sample_n(size=nrow(femaleSet))

#Create balanced sets with 193 from each gender
balancedSet <- rbind(maleSet,femaleSet)
balancedSet$HeartDisease <- ifelse(balancedSet$HeartDisease == 1,"Yes","No")
balancedSet$HeartDisease <- as.factor(balancedSet$HeartDisease)


#Splitting into train and test sets
split<- sort(sample(nrow(balancedSet), nrow(balancedSet)*.8))
train <- balancedSet[split,]
test <- balancedSet[-split,]

#Checking the imbalanced in test and train heart disease
sum(ifelse(test$HeartDisease=="Yes",1,0))/nrow(test)
sum(ifelse(train$HeartDisease=="Yes",1,0))/nrow(train)


