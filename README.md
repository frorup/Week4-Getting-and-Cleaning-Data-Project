Getting and Cleaning Data Course Week 4 Project
================


## Summary 

This project found in this repository is the Week 4 project of the Getting and Cleaning Data course. The objective of the project is to prepare a tidy data set based on the information provided through a web page. The project is worked in R Studio and requires the use of the library, dplyr. 

## Data Provided 

The dataset used for the project consists of smartwatch data

The data used is downloaded from the following link:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
The information is provided in a zip file. This contains a number of files with test and training sets as well as dataframe label information. 

A description of the information provided can be find in the following link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Code Outline as described in project [documentation](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)
The project objectives are:

  1: You should create one R script called run_analysis.R that does the following.

  2: Merges the training and the test sets to create one data set.

  3: Extracts only the measurements on the mean and standard deviation for each measurement.

  4: Uses descriptive activity names to name the activities in the data set.

  5: Appropriately labels the data set with descriptive variable names.

  6: From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
     for each activity and each subject.

## Process 

The script follows the 6 points outlined. It downloads the zip file from the url. The files withing the zip are then extracted into a directory. 

The zip file contains two subdirectories, one containing the test data and another containing the training data. Both directories contain 3 files containing observations and heading information. Each file is read into a separate dataframe. The test and training data are stacked (one above the other) and the files are then combined by columns.  

## Files

'run_analysis.R' contains the R script used to complete the objective. 

'tidy_data.txt' contains the output from the script. 
