## Getting and Cleaning Data Source Project

### Introduction

This folder and subfolders relate to the final project of the Coursera **Getting and Cleaning Data Source** course. 

The task proposed was to generate tidy data, after running an analysis on several files containing raw data about measurements
done with mobile phone accelerometers and gyroscopes during activities performed by 30 different people, refered to as "subjects". 

### About the algorithm

The source file *run_analysis.R* contain a R function with the same name, that takes no parameters. It collects the raw data 
contained into several files inside the *UCI_HAR_Dataset* folder, applies some operations on them and generate as output a file
named *tidy_measures.csv*. 

The algorithm divides the task in different phases: 
  - Reading the features label file, selecting labels related to means and standard deviations and tidying its information
  - Reading the activities label file and tidying its information
  - Loading train data (feature measures, activities and subjects), filtering to have only selected features
  - Loading test data (feature measures, activities and subjects), filtering to have only selected features
  - Generating a data frame with all raw data
  - By analysing the raw data and grouping it by subjects, activities and feature measures, generate a new data set with: 
    - Activity performed
    - Subject who performed the activity
    - Name of the measured feature
    - Average of the measurement records collected from the subject while performing the activity
    
#### Features file

The features file lists, in a condensed way, all the measurements that were made. In the file *UCI_HAR_Dataset/features_info.txt* 
we can find the following information about the features being measured: 

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
> These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using
> a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
> acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
> another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ
> and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
> (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
> fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern: 
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
> The set of variables that were estimated from these signals are: 
> mean(): Mean value
> std(): Standard deviation

From this text were extracted the rules for selecting the means and standard deviations: **(std / mean)**. 
And also, how to interpret the abbreviations and how to expand them to more clean and informative labels. 


