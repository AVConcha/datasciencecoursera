---
title: "CodeBook.md"
output: html_document
---

```{r}
```

## Course 3, week4, assignment: Getting and Cleaning data

The run_analysis.R script is used for getting and cleaning the data in this assignment, using the 5 steps required, which I describe below:

## 0.	Download and organize the dataset
The data is downloaded from the following URL, getting a zipped folder:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
And the files from that zipped folder, uploaded to RStudio in different variables:

```{r}
```
#### variable: features	
#### description: The features selected for this database come from an accelerometer and gyroscope:  3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. Features are normalized and bounded within [-1,1].	
#### observations: 561	
#### columns: 2
```{r}
```
#### variable: activities	
#### description: Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.	
#### observations: 6	
#### columns: 2
```{r}
```
#### variable: subject_test	
#### description: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
#### observations: 2947	
#### columns: 1
```{r}
```
#### variable: x_test	
#### description: The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.	
#### observations: 2947	
#### columns: 561
```{r}
```
#### variable: y_test		
#### observations: 2947	
#### columns: 1
```{r}
```
#### variable: subject_train		
#### observations: 7352	
#### columns: 1
```{r}
```
#### variable: x_train		
#### observations: 7352	
#### columns: 561
```{r}
```
#### variable: y_train		
#### observations: 7352	
#### columns: 1

```{r}
```


## 1.	Merges the training and the test sets to create one data set
With the rbind (rows merge) function, x_train and x_test are merged, as well as y_train and y_test. The information about the subjects are merged using rbind too.
This merge step ends with the use of cbind (columns merge) for the subjects, x and y data. 

## 2.	Extracts only the measurements on the mean and standard deviation for each measurement
Subsetting the mean and std columns of the Merged_Data, as well as the columns: subject, code.

## 3.	Uses descriptive activity names to name the activities in the data set
The activity codes are replaced by their descriptions, using the activities variable.

## 4.	Appropriately labels the data set with descriptive variable names
The “acronyms” of the different columns are replaced by their full name, for better understanding:

"Acc" -->  "Accelerometer"
"Gyro"-->  "Gyroscope"
"Mag" -->  "Magnitude"
etc.

## 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
The Tidy_2 dataset (180 rows, 88 columns) is created by grouping the  previous dataset by subject & activity, and calculate the mean of all the numeric columns.
This data is finally exported, creating the Tidy_data.txt file.


## License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


