# ------------------------------------------------------------------
# run_analysis.R
# ------------------------------------------------------------------
#   Pre-requisites:
#     - set your working directory (setwd)
#     - place the following source files in the working directory
#         - activity_labels.txt
#         - features.txt
#         - subject_test.txt
#         - subject_train.txt
#         - X_test.txt
#         - X_train.txt
#         - y_test.txt
#         - y_train.txt
# ------------------------------------------------------------------

# install and load packages
install.packages("data.table")
install.packages("dplyr")
library(data.table)
library(plyr)
library(dplyr)

# read in the activity labels and rename columns
activityLabels <- read.table('activity_labels.txt')
colnames(activityLabels) <- c("activity", "activityDesc")

# read in the features and rename columns
features <- read.table('features.txt')
colnames(features) <- c("id", "feature")

# read in the subject_test data
subjectTest <- read.table('subject_test.txt')

# read in the subject_train data
subjectTrain <- read.table('subject_train.txt')

# read in the X_test data
xTest <- read.table('X_test.txt')

# read in the X_train data
xTrain <- read.table('X_train.txt')

# read in the y_test data
yTest <- read.table('y_test.txt')

# read in the y_train data
yTrain <- read.table('y_train.txt')

# combine the subject data sets and name the column
subject <- rbind(subjectTest, subjectTrain)
colnames(subject) <- c("subject")

# combine the y data sets
y <- rbind(yTest, yTrain)
colnames(y) <- c("activity")

# combine the x data sets
x <- rbind(xTest, xTrain)

# add activity labels
activity <- join(y,activityLabels)

# filter the features containing "mean(" and "std("
reqFeatures <- grep("std[(]|mean[(]",features$feature)
reqFeaturesDesc <- features[grep("std[(]|mean[(]",features$feature), ]

# obtain the data for the required features
reqFeaturesData <- x[,reqFeatures]
colnames(reqFeaturesData) <- reqFeaturesDesc$feature

# combine all necessary columns together
subjectActivityData <- cbind(subject, activity=activity$activityDesc, reqFeaturesData)

# using the combined data set, find the mean of all the measurements grouped by subject and activity
summaryData <- subjectActivityData %>%
  arrange(subject,activity) %>%
  group_by(subject,activity) %>%
  summarise_each(funs(mean))
  
# produce a txt file of summarised, tidied data
write.table(summaryData, file="tidy_summary_data.txt", sep=",", row.names=FALSE)
