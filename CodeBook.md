

1. ######## reading data ################
featureDF     : containes data from "features.txt"
trainDFx      : containes data from "train/X_train.txt"
testDFx       : containes data from "test/X_test.txt"
trainSub      : containes data from "train/subject_train.txt"
testSub       : containes data from "test/subject_test.txt"
trainActivity : containes data from "train/Y_train.txt"
testActivity  : containes data from "test/Y_test.txt"
activityLable : containes data from "activity_labels.txt"

featureDF <- read.table("features.txt")
trainDFx <- read.table("train/X_train.txt",col.names=featureDF[,2])
testDFx <- read.table("test/X_test.txt",col.names=featureDF[,2])
trainSub <- read.table("train/subject_train.txt")
testSub <- read.table("test/subject_test.txt")
trainActivity <- read.table("train/Y_train.txt")
testActivity <- read.table("test/Y_test.txt")
activityLable <- read.table("activity_labels.txt")

2. ###### gives appropriate descriptive names from feature.txt to X_ data ##
colnames(trainDFx) <- featureDF[,2]
colnames(testDFx) <- featureDF[,2]

3. ###### merged data #########
combinedDFx : combined data set of trainDFx and testDFx 
combinedActivity : combined data set of trainActivity and testActivity
combinedSub : combined dtat set of trainSub and testSub



4. #### Extracted data with only mean, std measurements. using descriptive column names
meanOrStdDfx <- combinedDFx[,grepl("mean()", names(dfX)) | grepl("std()", names(trainDFx))]


5. ##### newly create tidy data set which contains the average of every variable for every Activity and SubjectID ##
combinedDFx$Activity <- as.numeric(activityLable[combinedActivity[,1],2])
combinedDFx$SubjectID <- combinedSub[,1]
aggdata <- aggregate(combinedDFx, by=list(combinedDFx$Activity, combinedDFx$SubjectID), mean)