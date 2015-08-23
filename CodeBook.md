# Human Activity Measurements Data Set

## Introduction
The data described here is obtained by cleaning the original data set that was collected by `UCI Machine Learning Repository`  by conducting experiments with a group of 30 volutneers between the ages of (19-48) years. Each individual performed six activities `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING` and `LAYING` wearing a smartphone on their waist. The data was collected by the team at `UCI Machine Learning Repository` by using the embedded accelerometer and gyroscope in the Samsung galaxy smartphone. They captured 3 acxial linear acceleration (I refer to these as Linear meaurements along X, Y and Z) and 3-axial angular velocity at constant rate. The obtained data set at UCI was randomly partitioned into two datasets for generating the training and test datasets. In this project the data obtained from UCI was cleaned, by extracting only the measurements dealing with `mean` and `std deviation`. This data for each partition was merged after combining the subject and activity data with the experiment measurements. The details of the transformations done will be explained in the next section on `Data Transformation`.

## Note On Data Dictionary
The tidied data described here was obtained by following the transformation process as described in the next section on `Data Transformation`.

<table border=1 style="width:100%">
    <tr>
        <td><b>Data Characteristics</td>
        <td><i>Time, Frequency mean and std deviation</td>
    </tr>
    <tr>
        <td><b>Number of Average Instance By Subject And Activity</td>
        <td><b><i>180</td>
    </tr>
    <tr>
        <td><b>Number of Variable Attributes</td>
        <td><b><i>68</td>
    </tr>
</table>

## Data Transformation
This section outlines the data transformations that have been applied to the data set obtained from `UCI Machine Learning Repository`. The pre-processed data obtained contained data in two partition sets `train` and `test`. In each partition the data was in three files once containing the 561 experiment feature vector with time and frequence variable, the activity label and the identifier for the subject who participated in the experiment. The details of the transformations applied are as follows:

1. For each partition data set (`train`, `test`) apply the following transformations

    1.1 Extract only the `mean` and `std deviation` measurements from the 561 feature vector in `X_train.txt` or `X_test.txt` based on the partition.
    
    1.2 Assign descriptive column names to the truncated feature vector that includes only `mean` and `std deviation` measurements.
    
    1.3 Merge the `activity` with the data set obtained from step [1.2] obtained in the previous step using `cbind`
    
    1.4 Merge the `subject` with the merged data from step [1.3] using `cbind`
    
2. Repeat step[1] for the next partition data set. If `train` was done first, repeat the step for `test` data.

3. Merge the cleaned `train` and `test` data sets obtained from steps [1] and [2] into a single tidied data set.

4. Assign descriptive variable names to the merged tidied data set obtained from step[3]

5. Create another independent data set from the one obtained in step[4] with average of each variable for each subject and activity

## Data Variables
The details of the variables contained in the data set are described in the following sub-sections

### subject
    Size: 2
    Type: int
    Description: Code indentifying the person volunteering in the experiment. There are a total of 30 individuals.
    Person Codes: 1...30

### activity
    Size: 18
    Type: factor
    Description: Specifies the activity performed by the subject for the given measurement observation.
    Allowed Values: The supported values are as follows
        * WALKING
        * WALKING_UPSTAIRS
        * WALKING_DOWNSTAIRS
        * SITTING
        * STANDING
        * LAYING
        
### LinearBodyAcc-Mean-X
    Size: 18
    Type: num
    Description: Measures the average linear body acceleration along the X-axis
    
### LinearBodyAcc-Mean-Y
    Size: 18
    Type: num
    Description: Measures the average linear body acceleration along the Y-axis

### LinearBodyAcc-Mean-Z
    Size: 18
    Type: num
    Description: Measures the average linear body acceleration along the Z-axis

### LinearBodyAcc-StdDeviation-X
    Size: 18
    Type: num
    Description: Measures the std deviation of linear body acceleration along the X-axis

### LinearBodyAcc-StdDeviation-Y
    Size: 18
    Type: num
    Description: Measures the std deviation of linear body acceleration along the Y-axis

### LinearBodyAcc-StdDeviation-Z
    Size: 18
    Type: num
    Description: Measures the std deviation of linear body acceleration along the Z-axis

### LinearGravityAcc-Mean-X
    Size: 18
    Type: num
    Description: Measures the average linear gravity acceleration along the X-axis

### LinearGravityAcc-Mean-Y
    Size: 18
    Type: num
    Description: Measures the average linear gravity acceleration along the Y-axis

### LinearGravityAcc-Mean-Z
    Size: 18
    Type: num
    Description: Measures the average linear gravity acceleration along the Z-axis

### LinearGravityAcc-StdDeviation-X
    Size: 18
    Type: num
    Description: Measures the average std deviation of linear gravity acceleration along the X-axis

### LinearGravityAcc-StdDeviation-Y
    Size: 18
    Type: num
    Description: Measures the average std deviation of linear gravity acceleration along the Y-axis

### LinearGravityAcc-StdDeviation-Z
    Size: 18
    Type: num
    Description: Measures the average std deviation of linear gravity acceleration along the Z-axis

### LinearBodyAccJerk-Mean-X
    Size: 18
    Type: num
    Description: Measures the average linear body zerk acceleration along the X-axis

### LinearBodyAccJerk-Mean-Y
    Size: 18
    Type: num
    Description: Measures the average linear body zerk acceleration along the Y-axis

### LinearBodyAccJerk-Mean-Z
    Size: 18
    Type: num
    Description: Measures the average linear body zerk acceleration along the Z-axis

### LinearBodyAccJerk-StdDeviation-X
    Size: 18
    Type: num
    Description: Measures the std deviation of body zerk acceleration along the X-axis

### LinearBodyAccJerk-StdDeviation-Y
    Size: 18
    Type: num
    Description: Measures the std deviation of body zerk acceleration along the Y-axis

### LinearBodyAccJerk-StdDeviation-Z
    Size: 18
    Type: num
    Description: Measures the std deviation of body zerk acceleration along the Z-axis

### LinearBodyGyro-Mean-X
    Size: 18
    Type: num
    Description: Measures the average linear body motion measured using the gyroscope along the X-axis

### LinearBodyGyro-Mean-Y
    Size: 18
    Type: num
    Description: Measures the average linear body motion measured using the gyroscope along the Y-axis

### LinearBodyGyro-Mean-Z
    Size: 18
    Type: num
    Description: Measures the average linear body motion measured using the gyroscope along the Z-axis

### LinearBodyGyro-StdDeviation-X
    Size: 18
    Type: num
    Description: Measures the std deviation of linear body motion measured using the gyroscope along the X-axis

### LinearBodyGyro-StdDeviation-Y
    Size: 18
    Type: num
    Description: Measures the std deviation of linear body motion measured using the gyroscope along the Y-axis

### LinearBodyGyro-StdDeviation-Z
    Size: 18
    Type: num
    Description: Measures the std deviation of linear body motion measured using the gyroscope along the Z-axis

### LinearBodyGyroJerk-Mean-X
    Size: 18
    Type: num
    Description: Measures the average linear body jerk motion measured using the gyroscope along the X-axis

### LinearBodyGyroJerk-Mean-Y
    Size: 18
    Type: num
    Description: Measures the average linear body jerk motion measured using the gyroscope along the Y-axis

### LinearBodyGyroJerk-Mean-Z
    Size: 18
    Type: num
    Description: Measures the average linear body jerk motion measured using the gyroscope along the Z-axis

### LinearBodyAccMag-Mean
    Size: 18
    Type: num
    Description: The average magnitude of the linear body acceleration

### LinearBodyAccMag-StdDeviation
    Size: 18
    Type: num
    Description: The std deviation of magnitude for the linear body acceleration

### LinearGravityAccMag-Mean
    Size: 18
    Type: num
    Description: The average magnitude of the linear gravity acceleration

### LinearGravityAccMag-StdDeviation
    Size: 18
    Type: num
    Description: The std deviation of magnitude for the linear gravity acceleration

### LinearBodyAccJerkMag-Mean
    Size: 18
    Type: num
    Description: The average magnitude of the linear body jerk motion

### LinearBodyAccJerkMag-StdDeviation
    Size: 18
    Type: num
    Description: The std deviation of magnitude for the linear body jerk motion

### LinearBodyGyroMag-Mean
    Size: 18
    Type: num
    Description: The average magnitude of the linear body motion measured using gyroscope

### LinearBodyGyroMag-StdDeviation
    Size: 18
    Type: num
    Description: The std deviation of magnitude for the linear body motion measured using gyroscope

### LinearBodyGyroJerkMag-Mean
    Size: 18
    Type: num
    Description: The average magnitude of the linear body jerk motion measured using gyroscope

### LinearBodyGyroJerkMag-StdDeviation
    Size: 18
    Type: num
    Description: The std deviation of magnitude for the linear body jerk motion measured using gyroscope

### FourierBodyAcc-Mean-X
    Size: 18
    Type: num
    Description: The average frequency of the linear body acceleration measured along the X-axis

### FourierBodyAcc-Mean-Y
    Size: 18
    Type: num
    Description: The average frequency of the linear body acceleration measured along the Y-axis

### FourierBodyAcc-Mean-Z
    Size: 18
    Type: num
    Description: The average frequency of the linear body acceleration measured along the Z-axis

### FourierBodyAcc-StdDeviation-X
    Size: 18
    Type: num
    Description: The std deviation of frequency for the linear body acceleration measured along the X-axis

### FourierBodyAcc-StdDeviation-Y
    Size: 18
    Type: num
    Description: The std deviation of frequency for the linear body acceleration measured along the Y-axis

### FourierBodyAcc-StdDeviation-Z
    Size: 18
    Type: num
    Description: The std deviation of frequency for the linear body acceleration measured along the Z-axis

### FourierBodyAccJerk-Mean-X
    Size: 18
    Type: num
    Description: The average frequency for the linear body jerk motion measured along the X-axis

### FourierBodyAccJerk-Mean-Y
    Size: 18
    Type: num
    Description: The average frequency for the linear body jerk motion measured along the Y-axis

### FourierBodyAccJerk-Mean-Z
    Size: 18
    Type: num
    Description: The average frequency for the linear body jerk motion measured along the Z-axis

### FourierBodyAccJerk-StdDeviation-X
    Size: 18
    Type: num
    Description: The std deviation of frequency for the linear body jerk motion measured along the X-axis

### FourierBodyAccJerk-StdDeviation-Y
    Size: 18
    Type: num
    Description: The std deviation of frequency for the linear body jerk motion measured along the Y-axis

### FourierBodyAccJerk-StdDeviation-Z
    Size: 18
    Type: num
    Description: The std deviation of frequency for the linear body jerk motion measured along the Z-axis

### FourierBodyGyro-Mean-X
    Size: 18
    Type: num
    Description: The average frequency for the linear body motion using gyroscope measured along the X-axis

### FourierBodyGyro-Mean-Y
    Size: 18
    Type: num
    Description: The average frequency for the linear body motion using gyroscope measured along the Y-axis

### FourierBodyGyro-Mean-Z
    Size: 18
    Type: num
    Description: The average frequency for the linear body motion using gyroscope measured along the Z-axis

### FourierBodyGyro-StdDeviation-X
    Size: 18
    Type: num
    Description: The std deviation frequency for the linear body motion using gyroscope measured along the X-axis

### FourierBodyGyro-StdDeviation-Y
    Size: 18
    Type: num
    Description: The std deviation frequency for the linear body motion using gyroscope measured along the Y-axis

### FourierBodyGyro-StdDeviation-Z
    Size: 18
    Type: num
    Description: The std deviation frequency for the linear body motion using gyroscope measured along the Z-axis

### FourierBodyAccMag-Mean
    Size: 18
    Type: num
    Description: The average magnitude of frequency for the linear body acceleration

### FourierBodyAccMag-StdDeviation
    Size: 18
    Type: num
    Description: The std deviation of magnitude of frequency for the linear body acceleration

### FourierBodyBodyAccJerkMag-Mean
    Size: 18
    Type: num
    Description: The average of magnitude of frequency for the linear body jerk motion

### FourierBodyBodyAccJerkMag-StdDeviation
    Size: 18
    Type: num
    Description: The std deviation of magnitude of frequency for the linear body jerk motion

### FourierBodyBodyGyroMag-Mean
    Size: 18
    Type: num
    Description: The average magnitude of frequency for the body motion measured using gyroscope

### FourierBodyBodyGyroMag-StdDeviation
    Size: 18
    Type: num
    Description: The std deviation of magnitude of frequency for the body motion measured using gyroscope

### FourierBodyBodyGyroJerkMag-Mean
    Size: 18
    Type: num
    Description: The average magnitude of frequency for the body jerk motion measured using gyroscope

### FourierBodyBodyGyroJerkMag-StdDeviation
    Size: 18
    Type: num
    Description: The std deviation of magnitude of frequency for the body jerk motion measured using gyroscope

## Citation
[Human Activity Recognition Data Set from UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)