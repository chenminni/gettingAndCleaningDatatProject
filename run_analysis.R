
#### getting data ########

featureDF <- read.table("features.txt")
trainDFx <- read.table("train/X_train.txt",col.names=featureDF[,2])
testDFx <- read.table("test/X_test.txt",col.names=featureDF[,2])
trainSub <- read.table("train/subject_train.txt")
testSub <- read.table("test/subject_test.txt")
trainActivity <- read.table("train/Y_train.txt")
testActivity <- read.table("test/Y_test.txt")
activityLable <- read.table("activity_labels.txt")

colnames(trainDFx) <- featureDF[,2]
colnames(testDFx) <- featureDF[,2]

#### merged data #####
combinedDFx <- rbind(trainDFx, testDFx)
combinedActivity <- rbind(trainActivity, testActivity)
combinedSub <- rbind (trainSub, testSub)


###### extract only measurements on means or std #####
meanOrStdDfx <- combinedDFx[,grepl("mean()", names(dfX)) | grepl("std()", names(trainDFx))]

##### adding descriptive activity lable 
colnames(combinedDFx) <- featureDF[,2]
combinedDFx$Activity <- as.numeric(activityLable[combinedActivity[,1],2])
combinedDFx$SubjectID <- combinedSub[,1]

###### update col names
colnames(meanOrStdDfx) <- names(dfX)[grepl("mean()", names(dfX)) | grepl("std()", names(dfX))]

#### step 5 #####
aggdata <- aggregate(combinedDFx, by=list(combinedDFx$Activity, combinedDFx$SubjectID), mean)