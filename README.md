# tidy-data

## Coursera: Getting and Cleaning Data, Course Project

### Purpose

The run_analysis.R file contains the function tidyMeans(), which returns a data frame after downloading, unzipping, combining, merging, and summarizing the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
 
The function processes this data by doing the following (but not necessarily in this order):

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation.
3. Applies the descriptive activity labels to the data set.
4. Labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  This data set (a data frame) is written to the file "means.txt" in the current working directory, and is also the return value of the function.

### Version of R

[1] "R version 3.1.2 (2014-10-31)"

### Library Dependencies
- plyr
- dplyr
- reshape2

### Further Detail
Further detail can be found in the CodeBook.md file.