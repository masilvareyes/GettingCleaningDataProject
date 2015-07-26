## Coursera DataScience Specialization
## Course: Getting and Cleaning Data
## Project: Course Project 
## Student: Marco A. Silva Reyes

## In this script we will have Script to create the Tiddy data of the project  


## Read the features that actually are the titles of the datasets
features<-read.table("./UCIHARDataset/features.txt")
## Read the activity list name
act<-read.table("./UCIHARDataset/activity_labels.txt")

## for training data

##Read the data 
train<-read.table("./UCIHARDataset/train/X_train.txt")
##setting the names to the DF
colnames(train) <-features[,2]
## loading the index activity 
trainAct<-read.table("./UCIHARDataset/train/y_train.txt")
##binding the activities  
train2<-cbind(train,trainAct)
##Rename the activitiyindex
colnames(train2)[562]<-c("actitivyindex")
## loading the subject 
trainSub<-read.table("./UCIHARDataset/train/subject_train.txt")


##For test data

##Read the data
test<-read.table("./UCIHARDataset/test/X_test.txt")
##setting the names to the DF
colnames(test) <-features[,2] 
## loading the index activity 
testAct<-read.table("./UCIHARDataset/test/y_test.txt")
##binding the activities  
test2<-cbind(test,testAct)
##Rename the activitiyindex 
colnames(tes2)[562]<-c("actitivyindex")
## loading the subject
testSub<-read.table("./UCIHARDataset/test/subject_test.txt")

