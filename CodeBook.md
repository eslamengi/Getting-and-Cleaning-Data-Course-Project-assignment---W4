---
title: "CodeBook.md"
output: html_document
---
#this codebook described the Raw and tidy data set
##Part 1 Describes the Raw data source
1. Here is the Raw data URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Below is URL for Raw Dataset description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Part 2 Described the Tidy data
Tidy data can be read directly using below R script

*tidydata <- read.table("./tidydata.txt")*  

- the resulting tidy data consists of 180 observations and 81 variables.
- the resulting tidy data is ordered based on subject_id & activity_id.
- the resulting Tidy data is the average of each variable for each activity and each subject.


Column 1 "subject_id": is a numeric identifier of the subject who performed the activity

Column 2 "activity_id": identifies the id of activity performed by the subjects. It's a factor variable 

Columns 3 to 81: these are all numeric variables and represent measurements taken using the accelerometer and gyroscope 3-axial when the subject moved. Only the measurements on the mean and standard deviation have been included.

##part 3 defines the data main files
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
