library(plyr)
library(dplyr)
library(reshape2)

## cleanupName "cleans" a measurement name so it is more easily readable.
## For example:
##    tBodyAcc-mean()-X => TimeBodyAccMeanX

cleanupName <- function(name) {
    name <- gsub("^t", "Time", name)
    name <- gsub("^f", "FFT", name)
    name <- gsub("-std", "Std", name)
    name <- gsub("-mean", "Mean", name)
    name <- gsub("\\(\\)|-", "", name)
    name    
}

## tidyMeans
## Downloads the data set and outputs a tidy data set of the means of all
## the measurements

tidyMeans <- function() {

    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile="UCI HAR Dataset.zip", 
                  method="curl")
    
    unzip("UCI HAR Dataset.zip")
    
    ## (1) Merge the data sets
    ## First load everything up.
    X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    
    X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

    ## rbind the X, y and subject tables
    X <- rbind(X_train, X_test)
    y <- rbind(y_train, y_test)
    subject <- rbind(subject_train, subject_test)
    
    ## (4) Label the data set with descriptive variable names
    ## Easier to follow if we can do this sooner than later.
    ## Load the labels
    features <- read.table("./UCI HAR Dataset/features.txt")
    
    ## Label the columns 
    names(X) <- features[,2]
    
    ## Only keep columns that contain the text "-mean" or "-std"
    X_cols <- grep("(\\-mean)|(\\-std)", names(X))
    X <- X[,X_cols]
    
    ## cleanup the names
    names(X) <- sapply(names(X), cleanupName)
    
    ## Load the activity labels
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    
    ## Rename columns so we can do an inner join
    names(activity_labels) <- c("activityID", "activity")
    names(y) <- c("activityID")
    names(subject) <- c("subject")
    y_labeled <- inner_join(y, activity_labels)
    
    ## Add the subject and activity columns
    X <- cbind(subject, select(y_labeled, activity), X)

    ## Melt this thing so the remaining columns (not subject or activity)
    ## are pivoted into variable and value.
    melted <- melt(X, id=c("subject", "activity"))
    
    ## ddply the melted data frame with a summary column for the mean of each
    ## kind of measurement
    means <- ddply(melted, .(subject, activity, variable), summarize, mean=mean(value))
    
    ## give the columns some better names
    names(means) = c("Subject", "Activity", "Measurement", "Mean")
    
    ## write it into the working directory
    write.table(means, "./means.txt", row.names=FALSE)
    
    ## return it as a value
    means
}






