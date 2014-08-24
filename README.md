Title: Getting And Cleaning Data Project
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

Download and unzip the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
setwd() to be "UCI HAR Dataset"

Download run_analysis.R to the working directory.
source("run_analysis.R")


Below are the variables created by run_analysis.R

featureDF     : containes data from "features.txt"
trainDFx      : containes data from "train/X_train.txt"
testDFx       : containes data from "test/X_test.txt"
trainSub      : containes data from "train/subject_train.txt"
testSub       : containes data from "test/subject_test.txt"
trainActivity : containes data from "train/Y_train.txt"
testActivity  : containes data from "test/Y_test.txt"
activityLable : containes data from "activity_labels.txt"

###### merged data #########
combinedDFx : combined data set of trainDFx and testDFx 
combinedActivity : combined data set of trainActivity and testActivity
combinedSub : combined dtat set of trainSub and testSub

#### Extracted data with only mean, std measurements. using descriptive column names
meanOrStdDfx <- combinedDFx[,grepl("mean()", names(dfX)) | grepl("std()", names(trainDFx))]


##### newly create tidy data set which contains the average of every variable for every Activity and SubjectID ##
combinedDFx$Activity <- as.numeric(activityLable[combinedActivity[,1],2])
combinedDFx$SubjectID <- combinedSub[,1]
aggdata <- aggregate(combinedDFx, by=list(combinedDFx$Activity, combinedDFx$SubjectID), mean)


To replicate projectStep5.txt,  
write.table(aggdata, file="projectStep5.txt", row.name=FALSE)


