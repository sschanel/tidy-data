## CodeBook

### The Data

The data set was gathered from a project for recognizing human activity using the accelerometer information produced by a smartphone.  Full and detailed documentation about this data set can be found here: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The input data set is split up into two sections, "training" and "test". Each of those two sections contains 3 files - the measurements, the subject identifiers, and the activity identifiers.  Each of those files are conceptually 3 parts of the same table and can be combined column-wise.  The two sections themselves can then be combined row-wise.  An additional two files are provided by the data set that include the names of the features that were measured (one for each column) and labels for the activities.

#### Citation

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

### The Script

The function tidyMeans() returns a data frame after downloading, unzipping, combining, merging, and summarizing the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The function processes this data by doing the following (but not necessarily in this order):

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation.
3. Applies the descriptive activity labels to the data set.
4. Labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  This data set (a data frame) is written to the file "means.txt" in the current working directory, and is also the return value of the function.

The final data frame consists of the following columns:

| Column        |             Description                           | Type    |
| :------------ |:--------------------------------------------------| :-------|
| Subject       | A numeric identifier assigned to the test subject | integer |
| Activity      | A description of the activity                     | factor  |    
| Measurement   | The description of the measurement                | factor  |      
| Mean          | The mean of the measurements for a particular Subject/Activity/Measurement combination | numeric |

There are no units for the Mean column. The measurement values are normalized to a range of [-1,1].

##### Note on the Measurement Name

The measurement names have been simplified by replacing the "t" prefix with "Time", the "f" prefix with "FFT", punctuation removed, and the entire name is in UpperCamelCase.  For example tBodyAcc-mean()-X becomes "TimeBodyAccMeanX".  This makes it easier to use from within R, especially when using the dplyr and reshape2 packages.  The specific meanings and units of each measurement can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Instructions
In the R console load the run_analysis.R file using the source() command, and type 

means <- tidyMeans()

This function tidyMeans() in the run_analysis.R file will load the data and calculate the means for every Subject/Activity/Measurement combination.  The output will be written to the file "means.txt" in your working directory.


