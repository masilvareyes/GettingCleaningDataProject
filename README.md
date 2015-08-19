
#README FILE
----------
*Coursera DataScience Specialization, Getting and Cleaning Data.*
 
*Course Project by Marco A. Silva Reyes*

----------
##Description

The purpose of this project is to demonstrate the expertise gained to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The original data set could be find in the URL [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Human Activity Recognition Using Smartphones Data Set") whit a [full description of the original data set.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The tasks to accomplish are the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##The dataset includes the following files:

- README.MD: This file.

- [codebook.md](codebook.md): Shows information about the variables included in the data set.

- [run_analysis.R](run_analysis.R): Script to get the tidy data.

- [tidydata2.txt](tidydata2.txt): Final data set created with tidydata.

##run_analysis Script Description
The script perform the following tasks:

- Read the features.txt that actually are the titles of the datasets
- Read the activity list name from the activity_labels.txt

- for each data set (training and test):
	- Read the data from the "X" file.
	- Set the names form features.
	- Loads the index activity from the "Y" file. 
	- Bind the activities.
	- Load the subject column from the subject file.
	- Bind the subjects.
	

- Bind training and test data frames.
- Identify the columns for the project (mean and std)
- Remove the meanFreq columns that are not needed. 
- Merge activities names.
- Remove the index activity to get tidy data frame of the step 4
- Perform an average over the metrics by activity and subject
- Export to tidydata2.txt file to get the second tidy data for step 5.

##Notes: 

- This script assumes that the original data set has been downloaded and unziped in the run_analysis.R file. 



