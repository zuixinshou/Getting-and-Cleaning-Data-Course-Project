---
title: "Readme"
output: html_document
---

## How the script work
### The run_analysis function take 6 steps to collect and clean the data.
### 1.Use "dir.create" function to prepare the work dir.
### 2.Use "download.file" and "unzip" function to download and unzip the files.
### 3.After read files, use "grepl" function to find the mean and standard deviation features. Store the features name and serial number into dataframe "targetcolnames".
### 4.Subset the target column from training dataset and test dataset. Adjust colnames with "gsub" function. Merge the activity codebook data and activity data with "merge" functions. Then merge the activity data, subject data and measurement data.Finally calculate the mean value for each activity and each subject with "aggregate" function.
### 5.Merge train and test dataset with "rbind" function.
### 6.Write tidydata into "tidydata.txt" with "write.table" function.

##Variables desicription

###subject_id: the subject who performed the activity for each window sample. Its range is from 1 to 30.    
###activity_name: six activity names.(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
###tBodyAcc.mean.X: The mean value of body acceleration in the X directions. The unit is standard gravity units 'g'.
###tBodyAcc.mean.Y: The mean value of body acceleration in the Y directions. The unit is standard gravity units 'g'.
###tBodyAcc.mean.Z: The mean value of body acceleration in the Z directions. The unit is standard gravity units 'g'.
###tBodyAcc.std.X: The standard deviation value of body acceleration in the X directions. The unit is standard gravity units 'g'.
###tBodyAcc.std.Y: The standard deviation value of body acceleration in the Y directions. The unit is standard gravity units 'g'.
###tBodyAcc.std.Z: The standard deviation value of body acceleration in the Z directions. The unit is standard gravity units 'g'.
###tGravityAcc.mean.X: The mean value of gravity acceleration in the X directions. The unit is standard gravity units 'g'.
###tGravityAcc.mean.Y: The mean value of gravity acceleration in the Y directions. The unit is standard gravity units 'g'.
###tGravityAcc.mean.Z: The mean value of gravity acceleration in the Z directions. The unit is standard gravity units 'g'.
###tGravityAcc.std.X: The standard deviation value of gravity acceleration in the X directions. The unit is standard gravity units 'g'.
###tGravityAcc.std.Y: The standard deviation value of gravity acceleration in the Y directions. The unit is standard gravity units 'g'.
###tGravityAcc.std.Z: The standard deviation value of gravity acceleration in the Z directions. The unit is standard gravity units 'g'.
###tBodyAccJerk.mean.X: The mean value of body linear acceleration derived in time to obtain Jerk signals in the X directions. The unit is standard gravity units 'g'.
###tBodyAccJerk.mean.Y: The mean value of body linear acceleration derived in time to obtain Jerk signals in the Y directions. The unit is standard gravity units 'g'.
###tBodyAccJerk.mean.Z: The mean value of body linear acceleration derived in time to obtain Jerk signals in the Z directions. The unit is standard gravity units 'g'.
###tBodyAccJerk.std.X: The standard deviation value of body linear acceleration derived in time to obtain Jerk signals in the X directions. The unit is standard gravity units 'g'.
###tBodyAccJerk.std.Y: The standard deviation value of body linear acceleration derived in time to obtain Jerk signals in the Y directions. The unit is standard gravity units 'g'.
###tBodyAccJerk.std.Z: The standard deviation value of body linear acceleration derived in time to obtain Jerk signals in the Z directions. The unit is standard gravity units 'g'.
###tBodyGyro.mean.X: The mean value of body angular velocity in the X directions. The units is radians/second.
###tBodyGyro.mean.Y: The mean value of body angular velocity in the Y directions. The units is radians/second.
###tBodyGyro.mean.Z: The mean value of body angular velocity in the Z directions. The units is radians/second.
###tBodyGyro.std.X: The standard deviation value of body angular velocity in the X directions. The units is radians/second.
###tBodyGyro.std.Y: The standard deviation value of body angular velocity in the X directions. The units is radians/second.
###tBodyGyro.std.Z: The standard deviation value of body angular velocity in the X directions. The units is radians/second.
###tBodyGyroJerk.mean.X: The mean value of body angular velocity derived in time to obtain Jerk signals in the X directions. The units is radians/second.
###tBodyGyroJerk.mean.Y: The mean value of body angular velocity derived in time to obtain Jerk signals in the Y directions. The units is radians/second.
###tBodyGyroJerk.mean.Z: The mean value of body angular velocity derived in time to obtain Jerk signals in the Z directions. The units is radians/second.
###tBodyGyroJerk.std.X: The standard deviation value of body angular velocity derived in time to obtain Jerk signals in the X directions. The units is radians/second.
###tBodyGyroJerk.std.Y: The standard deviation value of body angular velocity derived in time to obtain Jerk signals in the Y directions. The units is radians/second.
###tBodyGyroJerk.std.Z: The standard deviation value of body angular velocity derived in time to obtain Jerk signals in the Z directions. The units is radians/second.
###tBodyAccMag.mean: The mean value of magnitude of body acceleration signals calculated by Euclidean norm. The unit is standard gravity units 'g'.
###tBodyAccMag.std: The standard deviation value of magnitude of body acceleration signals calculated by Euclidean norm. The unit is standard gravity units 'g'.
###tGravityAccMag.mean: The mean value of magnitude of gravity acceleration signals calculated by Euclidean norm. The unit is standard gravity units 'g'.
###tGravityAccMag.std: The standard deviation vlue of magnitude of gravity acceleration signals calculated by Euclidean norm. The unit is standard gravity units 'g'.
###tBodyAccJerkMag.mean: The mean value of magnitude of body linear acceleration derived in time to obtain Jerk signals. The unit is standard gravity units 'g'.
###tBodyAccJerkMag.std: The standard deviation value of magnitude of body linear acceleration derived in time to obtain Jerk signals. The unit is standard gravity units 'g'.
###tBodyGyroMag.mean: The mean value of magnitude of body angular velocity. The units is radians/second.
###tBodyGyroMag.std: The standard deviation of magnitude of body angular velocity. The units is radians/second.
###tBodyGyroJerkMag.mean: The mean value of magnitude of body angular velocity derived in time to obtain Jerk signals. The unit is radians/second.
###tBodyGyroJerkMag.std: The standard deviation value of magnitude of body angular velocity derived in time to obtain Jerk signals. The unit is radians/second.
###fBodyAcc.mean.X: The mean value of body acceleration in the X directions transformed by Fast Fourier Transform. The unit is standard gravity units 'g'. 
###fBodyAcc.mean.Y: The mean value of body acceleration in the Y directions transformed by Fast Fourier Transform. The unit is standard gravity units 'g'. 
###fBodyAcc.mean.Z: The mean value of body acceleration in the Z directions transformed by Fast Fourier Transform. The unit is standard gravity units 'g'. 
###fBodyAcc.std.X: The standard deviation value of body acceleration in the X directions transformed by Fast Fourier Transform. The unit is standard gravity units 'g'. 
###fBodyAcc.std.Y: The standard deviation value of body acceleration in the Y directions transformed by Fast Fourier Transform. The unit is standard gravity units 'g'. 
###fBodyAcc.std.Z: The standard deviation value of body acceleration in the Z directions transformed by Fast Fourier Transform. The unit is standard gravity units 'g'. 
###fBodyAccJerk.mean.X: The mean value of body linear acceleration derived in time to obtain Jerk signals in the X directions transformed by FFT. The unit is standard gravity units 'g'.
###fBodyAccJerk.mean.Y: The mean value of body linear acceleration derived in time to obtain Jerk signals in the Y directions transformed by FFT. The unit is standard gravity units 'g'.
###fBodyAccJerk.mean.Z: The mean value of body linear acceleration derived in time to obtain Jerk signals in the Z directions transformed by FFT. The unit is standard gravity units 'g'.
###fBodyAccJerk.std.X: The standard deviation value of body linear acceleration derived in time to obtain Jerk signals in the X directions transformed by FFT. The unit is standard gravity units 'g'.
###fBodyAccJerk.std.Y: The standard deviation value of body linear acceleration derived in time to obtain Jerk signals in the Y directions transformed by FFT. The unit is standard gravity units 'g'.
###fBodyAccJerk.std.Z: The standard deviation value of body linear acceleration derived in time to obtain Jerk signals in the Z directions transformed by FFT. The unit is standard gravity units 'g'.
###fBodyGyro.mean.X: The mean value of body angular velocity in the X directions transformed by FFT. The units is radians/second.
###fBodyGyro.mean.Y: The mean value of body angular velocity in the Y directions transformed by FFT. The units is radians/second.
###fBodyGyro.mean.Z: The mean value of body angular velocity in the Z directions transformed by FFT. The units is radians/second.
###fBodyGyro.std.X: The standard deviation value of body angular velocity in the X directions transformed by FFT. The units is radians/second.
###fBodyGyro.std.Y: The standard deviation value of body angular velocity in the Y directions transformed by FFT. The units is radians/second.
###fBodyGyro.std.Z: The standard deviation value of body angular velocity in the Z directions transformed by FFT. The units is radians/second.
###fBodyAccMag.mean: The mean value of magnitude of body acceleration signals calculated by Euclidean norm transformed by FFT. The unit is standard gravity units 'g'.
###fBodyAccMag.std: The standard deviation value of magnitude of body acceleration signals calculated by Euclidean norm transformed by FFT. The unit is standard gravity units 'g'.
###fBodyBodyAccJerkMag.mean: The mean value of magnitude of body linear acceleration derived in time to obtain Jerk signals transformed by FFT. The unit is standard gravity units 'g'.             
###fBodyBodyAccJerkMag.std: The standard deviation value of magnitude of body linear acceleration derived in time to obtain Jerk signals transformed by FFT. The unit is standard gravity units 'g'.
###fBodyBodyGyroMag.mean: The mean value of magnitude of body angular velocity transformed by FFT. The units is radians/second.                                                                     
###fBodyBodyGyroMag.std: The standard deviation of magnitude of body angular velocity transformed by FFT. The units is radians/second.                                                              
###fBodyBodyGyroJerkMag.mean: The mean value of magnitude of body angular velocity derived in time to obtain Jerk signals transformed by FFT. The unit is radians/second.                           
###fBodyBodyGyroJerkMag.std: The standard deviation value of magnitude of body angular velocity derived in time to obtain Jerk signals transformed by FFT. The unit is radians/second.              
