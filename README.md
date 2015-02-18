---
title: "README"
date: "February 2015"
---

This README.md file describes the overall process followed in order to complete the analysis assignment for the Coursera course "Getting and Cleaning Data".

Assignment instructions include:<p>
_You should create one R script called run_analysis.R that does the following._

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The high level approach:

* install and load the packages used
* load the raw data into data.tables
* combine the test and train sets together using rbind to append (test+train)
* add the activity labels to the activity data (in y sets)
* filter out the features that contain the phrases "mean" and "std"
* subset the data (in x sets) keeping the filtered features only
* apply the feature labels to the column names
* combine all the data.tables together using cbind (subject+activity+feature data)
* summarise all the measure data by averaging (mean) grouping by subject and activity
* output the tidy summary data to a txt file


