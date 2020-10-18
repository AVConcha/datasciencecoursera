# Course 3, week 4, assigment

#TIDY DATASET


############### Getting the data #############################

library(dplyr)
library(downloader)
require(downloader)

#setwd("~/Cursos/R_specialization/c3_w4")

filename <- "./getdata_projectfiles_UCI HAR Dataset.zip"

# Checking if archive already exists.

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("./UCI HAR Dataset")) { 
  unzip(filename) 
}

############### Organizing the data #############################

features      <- read.table("UCI HAR Dataset/features.txt",          col.names = c("code","functions"))
activities    <- read.table("UCI HAR Dataset/activity_labels.txt",   col.names = c("code", "activity"))
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test        <- read.table("UCI HAR Dataset/test/X_test.txt",       col.names = features$functions)
y_test        <- read.table("UCI HAR Dataset/test/y_test.txt",       col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train       <- read.table("UCI HAR Dataset/train/X_train.txt",     col.names = features$functions)
y_train       <- read.table("UCI HAR Dataset/train/y_train.txt",     col.names = "code")

## 1: Merges the training and the test sets to create one data set:

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged  <- cbind(Subject, Y, X)

## 2: Extracts only the measurements on the mean and standard deviation for each measurement.

Extracted <- Merged %>% select(subject, code, contains("mean"), contains("std"))

## 3: Uses descriptive activity names to name the activities in the data set

Extracted$code <- activities[Extracted$code, 2]


## 4: Appropriately labels the data set with descriptive variable names.

names(Extracted)[2] = "activity"
##
names(Extracted)<-gsub("Acc"     , "Accelerometer", names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("Gyro"    , "Gyroscope"    , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("BodyBody", "Body"         , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("Mag"     , "Magnitude"    , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("^t"      , "Time"         , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("^f"      , "Frequency"    , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("tBody"   , "TimeBody"     , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("-mean()" , "Mean"         , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("-std()"  , "STD"          , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("-freq()" , "Frequency"    , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("angle"   , "Angle"        , names(Extracted), ignore.case = TRUE)
names(Extracted)<-gsub("gravity" , "Gravity"      , names(Extracted), ignore.case = TRUE)

##nn<-names(Extracted)
Tidy_1 = Extracted

## 5: From the data set in step 4, creates a second, independent tidy data set with the average 
##of each variable for each activity and each subject.


Tidy_2 <- Extracted %>%
  group_by(subject, activity) %>%
  summarise_all(mean)


write.table(Tidy_2, "Tidy_data.txt", row.name=FALSE)

