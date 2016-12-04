## Code Book for the Coursera Cleaning Data Project

#### ACTIVITY

Activity performed by the subject while the measurements were being made
  - LAYING
  - SITTING
  - STANDING
  - WALKING
  - WALKING DOWNSTAIRS
  - WALKING UPSTAIRS
     

#### SUBJECT

Number associated with the anonymous person that performed the activity for measurement in this research
  - 1..30
   

#### AVERAGES

Averages calculated from a given raw measure, grouped by subject and activity. 
Details on the procedures for measuring can be found in the raw data folder, at the file *UCI_HAR_Dataset/features_info.txt*. 

The columns for the measures are: 
  - Time.Body.Accelerometer.Mean.X
  - Time.Body.Accelerometer.Mean.Y
  - Time.Body.Accelerometer.Mean.Z
  - Time.Body.Accelerometer.Standard.Deviation.X
  - Time.Body.Accelerometer.Standard.Deviation.Y
  - Time.Body.Accelerometer.Standard.Deviation.Z
  - Time.Gravity.Accelerometer.Mean.X
  - Time.Gravity.Accelerometer.Mean.Y
  - Time.Gravity.Accelerometer.Mean.Z
  - Time.Gravity.Accelerometer.Standard.Deviation.X
  - Time.Gravity.Accelerometer.Standard.Deviation.Y
  - Time.Gravity.Accelerometer.Standard.Deviation.Z
  - Time.Body.Accelerometer.Jerk.Mean.X
  - Time.Body.Accelerometer.Jerk.Mean.Y
  - Time.Body.Accelerometer.Jerk.Mean.Z
  - Time.Body.Accelerometer.Jerk.Standard.Deviation.X
  - Time.Body.Accelerometer.Jerk.Standard.Deviation.Y
  - Time.Body.Accelerometer.Jerk.Standard.Deviation.Z
  - Time.Body.Gyroscope.Mean.X
  - Time.Body.Gyroscope.Mean.Y
  - Time.Body.Gyroscope.Mean.Z
  - Time.Body.Gyroscope.Standard.Deviation.X
  - Time.Body.Gyroscope.Standard.Deviation.Y
  - Time.Body.Gyroscope.Standard.Deviation.Z
  - Time.Body.Gyroscope.Jerk.Mean.X
  - Time.Body.Gyroscope.Jerk.Mean.Y
  - Time.Body.Gyroscope.Jerk.Mean.Z
  - Time.Body.Gyroscope.Jerk.Standard.Deviation.X
  - Time.Body.Gyroscope.Jerk.Standard.Deviation.Y
  - Time.Body.Gyroscope.Jerk.Standard.Deviation.Z
  - Time.Body.Accelerometer.Magnitude.Mean
  - Time.Body.Accelerometer.Magnitude.Standard.Deviation
  - Time.Gravity.Accelerometer.Magnitude.Mean
  - Time.Gravity.Accelerometer.Magnitude.Standard.Deviation
  - Time.Body.Accelerometer.Jerk.Magnitude.Mean
  - Time.Body.Accelerometer.Jerk.Magnitude.Standard.Deviation
  - Time.Body.Gyroscope.Magnitude.Mean
  - Time.Body.Gyroscope.Magnitude.Standard.Deviation
  - Time.Body.Gyroscope.Jerk.Magnitude.Mean
  - Time.Body.Gyroscope.Jerk.Magnitude.Standard.Deviation
  - Frequency.Body.Accelerometer.Mean.X
  - Frequency.Body.Accelerometer.Mean.Y
  - Frequency.Body.Accelerometer.Mean.Z
  - Frequency.Body.Accelerometer.Standard.Deviation.X
  - Frequency.Body.Accelerometer.Standard.Deviation.Y
  - Frequency.Body.Accelerometer.Standard.Deviation.Z
  - Frequency.Body.Accelerometer.Jerk.Mean.X
  - Frequency.Body.Accelerometer.Jerk.Mean.Y
  - Frequency.Body.Accelerometer.Jerk.Mean.Z
  - Frequency.Body.Accelerometer.Jerk.Standard.Deviation.X
  - Frequency.Body.Accelerometer.Jerk.Standard.Deviation.Y
  - Frequency.Body.Accelerometer.Jerk.Standard.Deviation.Z
  - Frequency.Body.Gyroscope.Mean.X
  - Frequency.Body.Gyroscope.Mean.Y
  - Frequency.Body.Gyroscope.Mean.Z
  - Frequency.Body.Gyroscope.Standard.Deviation.X
  - Frequency.Body.Gyroscope.Standard.Deviation.Y
  - Frequency.Body.Gyroscope.Standard.Deviation.Z
  - Frequency.Body.Accelerometer.Magnitude.Mean
  - Frequency.Body.Accelerometer.Magnitude.Standard.Deviation
  - Frequency.Body.Accelerometer.Jerk.Magnitude.Mean
  - Frequency.Body.Accelerometer.Jerk.Magnitude.Standard.Deviation
  - Frequency.Body.Gyroscope.Magnitude.Mean
  - Frequency.Body.Gyroscope.Magnitude.Standard.Deviation
  - Frequency.Body.Gyroscope.Jerk.Magnitude.Mean
  - Frequency.Body.Gyroscope.Jerk.Magnitude.Standard.Deviation


### About original data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record were collected: 
 - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
 - Triaxial Angular velocity from the gyroscope. 
 - A 561-feature vector with time and frequency domain variables
 - Its activity label. 
 - An identifier of the subject who carried out the experiment.
