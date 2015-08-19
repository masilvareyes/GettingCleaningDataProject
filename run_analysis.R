## Coursera DataScience Specialization
## Course: Getting and Cleaning Data
## Project: Course Project 
## Student: Marco A. Silva Reyes

## In this script we will have the instructions to create the Tiddy data of the project 

##set the working area
rm(list=ls())
cat("\014")
##setwd("C:/Data/git/GettingCleaningDataProject")

library("dplyr")

## 1. Merges the training and the test sets to create one data set.

## Read the features that actually are the titles of the datasets
features<-read.table("./UCI HAR Dataset/features.txt")
## Read the activity list name
act<-read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(act)<-c("actitivyindex","activity")

## for training data

##Read the data 
train<-read.table("./UCI HAR Dataset/train/X_train.txt")
##setting the names to the DF
colnames(train) <-features[,2]
## loading the index activity 
trainAct<-read.table("./UCI HAR Dataset/train/y_train.txt")
##binding the activities  
train2<-cbind(train,trainAct)
##Rename the activitiyindex
colnames(train2)[562]<-c("actitivyindex")
## loading the subject 
trainSub<-read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(trainSub)<-c("subject")
##binding the subjects  
##train3<-cbind(trainMerge,trainSub)
train3<-cbind(train2,trainSub)

##For test data

##Read the data
test<-read.table("./UCI HAR Dataset/test/X_test.txt")
##setting the names to the DF
colnames(test) <-features[,2] 
## loading the index activity 
testAct<-read.table("./UCI HAR Dataset/test/y_test.txt")
##binding the activities  
test2<-cbind(test,testAct)
##Rename the activitiyindex 
colnames(test2)[562]<-c("actitivyindex")
## loading the subject 
testSub<-read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(testSub)<-c("subject")
##binding the subjects  
test3<-cbind(test2,testSub)

##binding training and test
data<-rbind(train3,test3)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

##identifying columns for the project
mean<-grep("mean",colnames(data))
std<-grep("std()",colnames(data))
index<-c(562,563,mean,std)
dataT<-data[,c(index)]

##removing columns that are not needed
meanF<-grep("meanF",colnames(dataT))
data2<-dataT[,-c(meanF)]

## 3. Uses descriptive activity names to name the activities in the data set


## Merge Activities names without sort
data3<-merge(data2,act,by="actitivyindex", sort=FALSE)
##Removing index activity to get Tidy Data
tidydata1<-data3[,-1]

## 4. Appropriately labels the data set with descriptive variable names. 
## This step is implicit in the first step.


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Create average tidy data 
tidydata2<-tidydata1 %>% group_by(activity) %>%group_by(subject,add=TRUE) %>% summarise_each(funs(mean))

##export to txt file
write.table(tidydata2, "tidydata2.txt", quote = FALSE, row.names = FALSE)
