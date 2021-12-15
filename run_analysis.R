##==============================================================================
##  Package to be used
##==============================================================================

library(dplyr) 

##==============================================================================
##   General information to run script
##==============================================================================
# Provided url to data source
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##==============================================================================
##
##   Downloading the data and unzipping the file
##
##==============================================================================
##   Create a directory for the data to be downloaded
if (!file.exists("data")) { dir.create("data")}
## Download zip file
if (!file.exists("./Dataset.zip")) { download.file(fileUrl, destfile = "./data/Dataset.Zip") }
## Open Zip file
unzip("./data/Dataset.zip", files = NULL, list = FALSE, overwrite = TRUE, exdir = ".")

##==============================================================================
##
##   Reading the data
##
##==============================================================================
setwd("UCI HAR Dataset")
# Reading training data 
x_train   <- read.table("./train/X_train.txt")
y_train   <- read.table("./train/Y_train.txt") 
subject_train <- read.table("./train/subject_train.txt")
# Reading test data 
x_test   <- read.table("./test/X_test.txt")
y_test   <- read.table("./test/Y_test.txt") 
subject_test <- read.table("./test/subject_test.txt")

# read features description 
features <- read.table("./features.txt", as.is = TRUE) 

# read activity labels 
activity_labels <- read.table("./activity_labels.txt") 
colnames(activity_labels) <- c("Id", "activityLabel")

################################################################################
##
##    1 Merge the training and test sets into one 
## 
################################################################################

# merge of training and test sets
x_total   <- rbind(x_train, x_test)
y_total   <- rbind(y_train, y_test) 
subject_total <- rbind(subject_train, subject_test) 

# combining into 1 frame
MergedData <- cbind( subject_total, x_total, y_total)
colnames(MergedData) <- c("subject", features[,2],"activity")

# Clean up workspace
rm(x_test, x_train, x_total, y_test, y_train, y_total)
rm(subject_test, subject_train, subject_total)

################################################################################
##
##    2 Extracts only the measurements on the mean and standard deviation for 
##      each measurement
## 
################################################################################

# grep logical to identify entries with 
dataFilter <- grepl("subject|activity|mean|std", features[,2])

MergedData <- MergedData[,dataFilter]


################################################################################
##
##    3 Use descriptive activity names to name activities in the data set
## 
################################################################################

MergedData$activity <- factor(MergedData$activity, levels = activity_labels[,1], 
                              labels = activity_labels[,2])


################################################################################
##
##    4 Appropriately label data set with descriptive variable names 
## 
################################################################################

#Import
# get column names
MergedDataCols <- colnames(MergedData)

# remove special characters
MergedDataCols <- gsub("[\\(\\)-]", "", MergedDataCols)

# expand abbreviations and clean up names
MergedDataCols <- gsub("^f", "frequencyDomain", MergedDataCols)
MergedDataCols <- gsub("^t", "timeDomain", MergedDataCols)
MergedDataCols <- gsub("Acc", "Accelerometer", MergedDataCols)
MergedDataCols <- gsub("Gyro", "Gyroscope", MergedDataCols)
MergedDataCols <- gsub("Mag", "Magnitude", MergedDataCols)
MergedDataCols <- gsub("Freq", "Frequency", MergedDataCols)
MergedDataCols <- gsub("mean", "Mean", MergedDataCols)
MergedDataCols <- gsub("std", "StandardDeviation", MergedDataCols)

# correct typo
MergedDataCols <- gsub("BodyBody", "Body",MergedDataCols)

# use new labels as column names
colnames(MergedData) <- MergedDataCols


################################################################################
##
##    5 From 4 create a second independent tidy data set with avg and sd for 
##      each activity and each subject
## 
################################################################################

# group
ActivityMeans <- MergedData %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# write to "tidy_data.txt"
setwd("../")
write.table(ActivityMeans, "tidy_data.txt", row.names = FALSE, quote = FALSE)



## Clean up by removing workfiles
unlink("data",recursive = TRUE)
unlink("UCI HAR Dataset",recursive = TRUE)
