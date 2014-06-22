#Getting and Cleaning Data Course Project
#AChanna 06.22.2014

#data downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#working directory is set to the root "UCI HAR Dataset" folder: 
#/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"

#load the "reshape2" library to use the "melt" and "dcast" functions
library(reshape2)

#load data into r
features<-read.table("features.txt", stringsAsFactors=FALSE)
activityLabels<-read.table("activity_labels.txt", stringsAsFactors=FALSE)

subjectTest<-read.table("test/subject_test.txt")
xTest<-read.table("test/X_test.txt")
yTest<-read.table("test/y_test.txt")

subjectTrain<-read.table("train/subject_train.txt")
xTrain<-read.table("train/X_train.txt")
yTrain<-read.table("train/y_train.txt")

#combine all the test files together, and the train files together
testData<-cbind(subjectTest, yTest, xTest)
trainData<-cbind(subjectTrain, yTrain,xTrain)

#Part 1 of assignment: 1. Merges the training and the test sets to create one data set. 
mergedData<-rbind(testData,trainData)

#give the columns names for reference
names(mergedData)[3:563]<-features$V2
names(mergedData)[1:2]<-c("subject.id", "activity")

#Part 2 of assignment: Extracts only the measurments on the mean and standard deviation for each measurement.
measurementData<-mergedData[,c(1, 2, grep("mean\\(\\)|std\\(\\)", names(mergedData)))]

#Part 3 of assignment: Uses descriptive activity names to name the activities in the data set.
#To make the data descriptive and easy to read, I removed the underscores and recast the strings to lower case
measurementData$activity<-factor(measurementData$activity, labels=activityLabels$V2)
measurementData$activity<-tolower(measurementData$activity)
measurementData$activity<-gsub("\\_", " ", measurementData$activity, )

#Part 4 of assignment: Appropriately labels the data set with descriptive variable names.
#Here I basically expanded out each variable name and removed any unneccesarry characters. Also, each word was separated by a "."
#This was based on google's R Style rules. Refer to the README file for further details. 
names(measurementData)<-gsub("^t", "time.domain.", names(measurementData),)
names(measurementData)<-gsub("^f", "freq.domain.", names(measurementData),)
names(measurementData)<-gsub("Body", "body.", names(measurementData),)
names(measurementData)<-gsub("Gravity", "gravity.", names(measurementData),)
names(measurementData)<-gsub("Gyro", "gyroscope.", names(measurementData),)
names(measurementData)<-gsub("Acc", "accelaration.", names(measurementData),)
names(measurementData)<-gsub("Jerk", "jerk.", names(measurementData), )
names(measurementData)<-gsub("Mag", "magnitude.", names(measurementData),)
names(measurementData)<-gsub("std", "standard.deviation", names(measurementData),)
names(measurementData)<-gsub("X", "in.x.direction", names(measurementData),)
names(measurementData)<-gsub("Y", "in.y.direction", names(measurementData),)
names(measurementData)<-gsub("Z", "in.z.direction", names(measurementData),)

names(measurementData)<-gsub("\\-", "", names(measurementData),)
names(measurementData)<-gsub("\\(\\)", ".", names(measurementData),)
names(measurementData)<-gsub("\\.$", "", names(measurementData),)

#Part 5 of assignment: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
meltedData<-melt(measurementData, id=c("subject.id", "activity"))
tidyData <- dcast(meltedData, subject.id + activity ~ variable, mean)

#changing the names of columns to represent that these are now averages
names(tidyData)[3:68]<-gsub("^", "average.of.", names(measurementData)[3:68],)

#save the tidy data set to a text file
write.table(tidyData, file="tidyData.txt")