---
title: "CodeBook.md"
author: "Scott Schanel"
date: "April 26, 2015"
output: html_document
---

## CodeBook

### The data
The information about the original data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The means() data frame returned by tidyMeans() has four columns:

Subject
An numeric identifier for the subject

Activity
A description of the activity

Measurement
The description of the measurement.  Original names can be found in the link above.  The names have been simplified by replacing the "t" prefix with "Time", the "f" prefix with "FFT", punctuation removed, and the entire name is in UpperCamelCase.

Mean
The mean of the variable measurements for the particular Subject/Activity/Measurement combination.



### Summary Choices
The output of tidyMeans() is a narrow-form data frame.  It is written to a 
file "means.txt" in your working directory.  It includes all measurements that
originally had the substring "-std" or "-mean" in it.

### Instructions
'''
means <- tidyMeans()
'''
The function getMeans() in the run_analysis.R file will load this data and calculate the means for every Subject/Activity/Measurement combination.  The output will be written to a means.txt file in your data directory.  It is also the return value of the function.  The columns are 


