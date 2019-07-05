### assignment####



#Goals of this script

#1 - Merges the training and the test sets to create one data set.
#2 - Extracts only the measurements on the mean and standard deviation for each measurement.
#3 - Uses descriptive activity names to name the activities in the data set
#4 - Appropriately labels the data set with descriptive variable names.
#5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#### source the data

# have the data as copied in home directory
setwd(".........data/UCI HAR Dataset")


#load the libraries
library(dplyr)
library(tidyr)

#Read the data in first level - the activity labels and the features
act_labels <- read.delim("activity_labels.txt", header = FALSE)
features <- read.delim("features.txt", header = FALSE)



# go to Train data set
setwd("train")

# read all Train data
# as we only need the first 6 columns, just pull these thru by making the column classes NULL for columns we don't want
X_train <-  read.table("X_train.txt", colClasses = c(rep("numeric", 6), rep("NULL", 555)))
y_train <- read.table("y_train.txt", header = FALSE, sep ="")
subjectTrain <-read.table("subject_train.txt", header = FALSE)


#go to Test data and read test data
setwd('..')
setwd("test")

# read all the test data set aswell
# as we only need the first 6 columns, just pull these thru by making the column classes NULL for columns we don't want
X_test<- read.table("X_test.txt", colClasses = c(rep("numeric", 6), rep("NULL", 555)))
y_test <- read.table("y_test.txt", header = FALSE, sep ="")
subjectTest <-read.table("subject_test.txt", header = FALSE)


#Add headers to each column so we can make better sense of the data
names(subjectTrain)<-c("Subject")
names(subjectTest)<-c("Subject")

names(y_test)<-c("Activity")
names(y_train)<-c("Activity")

# Addsome labels to the means and Std devs
labels<-c("X Mean","Y Mean","Z Mean","X Std Dev","Y Std Dev","Z Std Dev")
names(X_test)<-labels
names(X_train)<-labels



######## Merge the data sets for training and test sets 

#first combine participants, activity and means/St dev for test and train data sets

testData<-cbind(subjectTrain,y_train,X_train)
trainData<-cbind(subjectTest,y_test,X_test)
CombinedData<-rbind(testData,trainData)



# Add the descriptive activity names in data set

CombinedData$Activity<-gsub("1","Walking",CombinedData$Activity)
CombinedData$Activity<-gsub("2","Walking Upstairs",CombinedData$Activity)
CombinedData$Activity<-gsub("3","Walking Downstairs",CombinedData$Activity) 
CombinedData$Activity<-gsub("4","Sitting",CombinedData$Activity)
CombinedData$Activity<-gsub("5","Standing",CombinedData$Activity)
CombinedData$Activity<-gsub("6","Laying",CombinedData$Activity)



# create a tidy data grouped by each subject and each activity - I read this as needing to be an average for each subject/activity combinations, ie subject 1 sitting ,subject 1 walking etc
FinalTable<- CombinedData %>%
  group_by(Subject,Activity) %>%
  summarise_at( vars(-Activity,-Subject),funs(mean(., na.rm=TRUE)))

#for this table need to re-name the variables to reflect they are an mean of the means/st deviation, so add the text "mean of" in front of existing label names

NewLabels<-  paste("Mean of:", labels, sep='')
NewLabels<-c("Subject","Activity",NewLabels)
names(FinalTable)<-NewLabels

#write the table to upload for assignment
write.table(FinalTable,"DavidBlandFinalTable", row.name=FALSE)



