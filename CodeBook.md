Getting and Cleaning Data Course Week 4 Project
================


## Codebook Notes - Getting and Cleaning Data

## Outline 

## 1. Files used 

The zip file provided for the project contains the following text files: 
  features.txt 
  activity_labels.txt 
  subjects_train.txt 
  x_train.txt 
  y_train.txt 
  subjects_train.txt 
  x_train.txt 
  y_train.txt 

## 2. Variables used 

fileUrl:          Contains the url of the dataset. 
x_train:          Contains the content of x_train.txt
y_train:          Contains the content of y_train.txt
x_test:           Contains the content of x_test.txt
y_test:           Contains the content of y_test.txt
subject_train:    Contains the content of subject_train.txt
subject_test:     Contains the content of subject_test.txt
features:         Contains the content of features.txt
activity_labels:  Contains the content of activity_labels.txt

x_total:          Stacking of x_train and x_test by binding rows 
y_total:          Stacking of y_train and y_test by binding rows 
subject_total:    Stacking of subject_train and subject_test by binding rows 

MergedData:       Using column binding connecting subject_total, x_total and y_total

dataFilter:       Bolean indicating if a row is included (True) or excluded (False)



