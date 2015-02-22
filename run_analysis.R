#1. 
#First I saved all of the relevant files into a separate folder named "Project Data" and set that as my working directory. 
# It included the following .txt files: subject_test, subject_train, X_test, X_train, y_test, y_train, and activity_labels

setwd("C:/Users/jessi_000/Desktop/Data Science Coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/Project Data")

# Then I read in each file and determined its dimensions. Using the dim() and the str() functions, I determined that
# x test and x train contained observations of 561 variables, and that they contained 2947 and 7352 observations, 
# respectively. The values in subtest and subtrain correspond to the individual subject associated with each observation. 
# The values in ytest and ytrain correspond to the activity associated with each observation in xtest and xtrain. I then 
# confirm that none of the datasets include NA values. 

subtest <- read.table("subject_test.txt", sep = "")
subtrain <- read.table("subject_train.txt", sep = "")
xtest <- read.table("X_test.txt", sep = "")
xtrain <- read.table("X_train.txt", sep ="")
ytest <- read.table("Y_test.txt", sep = "")
ytrain <- read.table("Y_train.txt", sep ="")

dim(subtest) 
dim(subtrain) 
dim(xtest) 
dim(xtrain)
dim(ytest)
dim(ytrain)    

str(xtest)
str(ytest)

any(is.na(subtest))
any(is.na(subtrain))
any(is.na(xtest))
any(is.na(xtrain))
any(is.na(ytest))
any(is.na(ytrain))

# Then I combine all of the data into one dataframe assigned testtraindata, which takes several steps.  
# First I add cloumns to xtrain and xtest DFs corresponding to the subject for each observation and the 
# activity for each observation. Now xtrain an xtest each have 563 variables (the original 561 plus 2 more)

xtest$subject <- subtest$V1
xtest$activity <- ytest$V1
xtrain$subject <- subtrain$V1
xtrain$activity <- ytrain$V1

# Using the table() function we can see 1) That the 30 subjects appear to be randomly grouped in to the test 
# or train groups with more in the train group and each subject has a unique number from 1 to 30 (there are 
# no duplicate subject numbers across groups) .2) Each subject has a different total number of 
# observations, though they are all roughly in the 300-400 range. 

table(xtest$subject)
table(xtrain$subject)

# Then I combine the new xtrain and xtest datasets together in testtraindata which has 10299 observations of 563 variables. 

testtraindata <- rbind(xtrain, xtest)

#2. Now that we have a merged dataset, we need to extract only the measurements on the mean and standard 
# deviation for each measurement. Str() on the features.txt files reveals that it is a dataframe with 561 
# observations of 2 variables. V2 is a factor variable which labels the variables measured in testtraindata. 
# We end up with meanstddata, a dataframe with 10299 observations of 79 variable (just the variables related
# to mean and standard deviation).

features <- read.table("features.txt", sep = "")
str(features)

meanfeatures <- features[grep("mean", features$V2),]
stdfeatures <- features[grep("std", features$V2),]
stdmeanfeatures <- rbind (meanfeatures, stdfeatures)

meanstddata <- testtraindata[, stdmeanfeatures$V1]

#4. I am doing part four of the homework before 3, because it seems easier that way. Rest assured part 3 is below!
# Here I label the variables using the descriptions provided in the features.txt file. However, since they contain
# some characters which are problematic in R, namely "()" and "-", I remove or replace them. 

newvarnames <- gsub(pattern = "()", replacement =".", stdmeanfeatures$V2, fixed = TRUE)
newvarnames2 <- gsub(pattern = "-", replacement ="", newvarnames, fixed = TRUE)
colnames(meanstddata) <- newvarnames2


#3. Now we apend the subject and activity columns to the meanstddata, creating meanstddata2 - a dataframe containing 
# 10299 observations of 81 variables. In the new "activity" column, we now we replace the integers 1:6 with descriptive 
# activity names (walking, lying down, etc.). The car package makes this easy with the recode() function. 

meanstddata2 <- cbind(meanstddata, testtraindata$subject, testtraindata$activity)
colnames(meanstddata2)[colnames(meanstddata2)== "testtraindata$subject"] <- "subject"
colnames(meanstddata2)[colnames(meanstddata2)== "testtraindata$activity"] <- "activity"

library(car)

activitynames <- recode(meanstddata2$activity, "1='walking';2='walking_upstairs'; 3='walking_downstairs'; 4='sitting'; 5='standing'; 6='laying'")
meanstddata2$activity <- activitynames


# 5. Now for our final tidy data set we want, for each subject, the average for each variable for each activity. I interpret
# this to mean that for example, for subject 1, we want the averages for each variable when s/he was sitting, the average for each
# variable when s/he was standing, etc. So, including the subject and activity columns we should still have a dataframe with 81 variables. 
# However, there will be fewer observations. There will only be six rows per subject because there are six activities. Since there 
# are 30 subjects, the final dataframe should have 30 * 6 = 180 observations. The datafram "tidydata" below accomplishes this through
# the use of functions and for loops. 



meangetter <- function(subject) {
    data <- data.frame()
    activites <- c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")
    for(activity in activites){
        currentactivity <- meanstddata2[meanstddata2$subject == subject & meanstddata2$activity == activity, 1:79]
        meancurrentactivity <- colMeans(currentactivity)
        data <- rbind(meancurrentactivity, data)
        colnames(data) <- newvarnames2 
    }
    data
}


    tidydata <- data.frame()
    for(subject in 1:30){
         subjectdata <- meangetter(subject)
         tidydata <- rbind(subjectdata, tidydata)
    }
    tidydata$subject <- rep(1:30, each = 6)
    tidydata$activity <- c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying") 
    write.table(tidydata, file = "tidydata.txt", row.name = FALSE, sep = " ")









