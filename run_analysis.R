download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "samsungdata.zip")
unzip("samsungdata.zip")
library(plyr) # for the join and arrange commands

#Create the test and train data sets
testFull <- read.table('UCI HAR Dataset//test/X_test.txt', sep="", header = FALSE)
trainFull <- read.table('UCI HAR Dataset//train//X_train.txt', sep="", header = FALSE)

#Read the activity lists from the data set and make meaningful activity labels. 

testActivities <- read.table('UCI HAR Dataset//test/y_test.txt', header = FALSE)
trainActivities <- read.table('UCI HAR Dataset//train/y_train.txt', header = FALSE)
activityLabels <- read.table('UCI HAR Dataset//activity_labels.txt', sep ='', header = FALSE)
testActivities <- join(data.frame(testActivities), activityLabels)
trainActivities <- join(data.frame(trainActivities), activityLabels)

#Provide names for the variables in the two data sets

features <- read.table('UCI HAR Dataset//features.txt', sep = '', header = FALSE)
names(testFull) <- features[,2]
names(trainFull) <- features[,2]

#Bind activities with the variable values in the data set
testFull <- cbind(testActivities$V2,testFull)
trainFull <- cbind(trainActivities$V2,trainFull)

#Make meaningful names and activities
names(testFull)[1] = "Activity"
names(trainFull)[1] = "Activity"

#Bind subjects to the data sets
testSubjects <- read.table("UCI HAR Dataset//test//subject_test.txt", header = FALSE)
trainSubjects <- read.table("UCI HAR Dataset//train//subject_train.txt", header = FALSE)
testFull <- cbind(testSubjects, testFull)
trainFull <- cbind(trainSubjects, trainFull)

#Make meaningful names for subject
names(trainFull)[1] <- "Subject"
names(testFull)[1] <- "Subject"

#Only extract the means and stds and combine the data sets
small <-grep("mean\\(\\)|std\\(\\)",names(testFull))
test <- testFull[,c(1,2,small)]
train <- trainFull[,c(1,2,small)]
combined <- rbind(train,test)

#Produce averages by subject and activity and sort by activity
consolidated <- aggregate(.~Activity + Subject, data = combined, FUN = mean)
consolidated <- arrange(consolidated, Activity)

#Export the tidy data set
write.csv(consolidated, "activityMeans.txt")

