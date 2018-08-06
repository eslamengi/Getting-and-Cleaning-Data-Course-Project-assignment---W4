#Part 1 Merges the training and the test sets to create one data set#

#set Working directory
setwd("d:/Data Science course/NTL/03 Getting and Cleaning Data/assignment/")

#download the raw data set
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataurl, "./W4-assignment.zip")

#unzip the dataset
dataset <- unzip("./W4-assignment.zip")

#read test data
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read train data
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#read Activity & Feature
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
feature <- read.table("./UCI HAR Dataset/features.txt")

#load dplyr library
library(dplyr)

#merging the test & train data
x <- bind_rows(xtest, xtrain)
y <- bind_rows(ytest, ytrain)
subject <- bind_rows(subtest, subtrain)


#naming columns
colnames(x) <- feature[,2]
colnames(subject) <- "subject_id"
colnames(y) <- "activity_id"
colnames(activity) <- c("activity_id", "activityType")

merged_dataset <- bind_cols(subject, y, x)

# Part 2 Extracts only the measurements on the mean and standard deviation for each measurement#
#creating variable containing all variable value containing mean, std, activity & subject
columns <- colnames(merged_dataset)
selected_measurements <- (grepl("activity_id", columns) | grepl("subject_id", columns) | grepl("mean..", columns) | grepl("std..", columns))

mean_std <- merged_dataset[, selected_measurements == TRUE]


#Part 3 Uses descriptive activity names to name the activities in the data set#
merge_by_activity <- merge(activity, merged_dataset, by = "activity_id", all.x = TRUE)

#Part 4 Appropriately labels the data set with descriptive variable names.#
#already all variables named on part 1

#part 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.#
tidydata <- aggregate(. ~ subject_id + activity_id, mean_std, mean)
tidydata <- tidydata[order(tidydata$subject_id, tidydata$activity_id),]

write.table(tidydata, "./tidydata.txt", row.names = FALSE)


