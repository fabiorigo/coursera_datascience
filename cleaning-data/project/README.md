## Getting and Cleaning Data Source Project

### Introduction

This folder and subfolders relate to the final project of the Coursera **Getting and Cleaning Data Source** course. 

The task proposed was to generate tidy data, after running an analysis on several files containing raw data about measurements
done with mobile phone accelerometers and gyroscopes during activities performed by 30 different people, 
refered to as "subjects". 

### About the algorithm

The source file *run_analysis.R* contain a R function with the same name, that takes no parameters. It collects the raw data 
contained into several files inside the *UCI_HAR_Dataset* folder, applies some operations on them and generate as output a file
named *tidy_measures.txt*. 

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
    
#### Phase 1: Features

The *UCI_HAR_Dataset/features.txt* file lists, in a condensed way, all the measurements that were made. 
In the file *UCI_HAR_Dataset/features_info.txt* we can find the following information about the features being measured: 

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
>
> mean(): Mean value
>
> std(): Standard deviation

From this text were extracted the rules for selecting the means and standard deviations. 
The features selected are the ones containing: *-std() and -mean()*. 

And also, how to interpret the abbreviations and how to expand them to more clean and informative labels. 

The labels in the *UCI_HAR_Dataset/features.txt* files correlates to the measurements in 
*UCI_HAR_Dataset/test/X_test.txt* and *UCI_HAR_Dataset/train/X_train.txt*. 

#### Phase 2: Activities labels

The activity labels file lists and correlates the numbers found in *UCI_HAR_Dataset/test/y_test.txt* and
*UCI_HAR_Dataset/train/y_train.txt* with the activity labels. 

They can be: LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, WALKING UPSTAIRS. 

#### Phases 3, 4 and 5: Building the raw data frame

The raw data frame comes from joining the measures, subjects and activities from *train* and *test* data directories, labeled 
as the indicated from the files read in phases 1 and 2. 

Activities and subjects were added as additional columns to the measures data frame, so that it is possible to identify for each
record, what are them. This will in important because in phase 6 the function will make subsets of the raw data frame according
to the activities and subjects. 

#### Phase 6: Calculating derived average from the different measures

With the raw data frame built, it is time to iterate on it to select the rows that share the same activity and subject. 
With those rows, calculate the average of all measures and organize a new data frame with the clean and tidy data. 
The resulting data table was designed for being not sparse, so it has a simple structure to be very clear and condensed. 
The chosen structure seems like a fact table from a data warehouse star modelling: three dimension columns (activity, subject
and name of the measured feature) and one value (average). After running the algorigthm, the resulting table is written as a 
TXT file, *tidy_measures.txt*, which is also commited in this repository. 

To reload it in RStudio, it is enough to issue the command: 

```r
tm <- read.table("tidy_measures.txt", header = TRUE)
```

