#
## This R script demonstrates the process of getting, tidying, assembling and processing the data into 
## a format that is easy to analyze.
##
## This script does the following:
## 1) Merges the training and test data set located under the data folder
## 2) It will extract only the measurmements that measure the mean and standard deviations
## 3) Assign meaningful variable names to the data set.
## 4) Compute the averages of the measurements by subject and activity.
##

##
## This function will load the activity label to descriptive name mappings.
## It will return a vector of activity names.
##
## Input: dataLocation - Location of the experiment data.
##
## Output: A vector with list of activities, assumption index maps to activity label.
##
getActivityLabelMappings <- function(dataLocation) {
    activityLabelsFile <- paste(dataLocation, "activity_labels.txt", sep="/")
    #
    # Load activity mappings.
    #
    activityLabelsDF <- read.table(activityLabelsFile)
    #
    # Assign descriptive variable names to the activity mappings.
    #
    colnames(activityLabelsDF) <- c("Label", "ActivityName")
    #
    # Return activity names vector
    #
    activityLabels <<- activityLabelsDF$ActivityName
}

##
## This function will load the complete list of experiment features and return it as a character vector.
##
## Input: dataLocation - Location of the experiment data.
##
## Output: A character vector containing the list of all experiment feature variable names.
##
getExperimentDataFeatures <- function(dataLocation) {
    dataFeaturesFile <- paste(dataLocation, "features.txt", sep="/")
    #
    # Load experiment measurement variable names
    #
    dataFeaturesDF <- read.table(dataFeaturesFile)
    #
    # return the complete list of experiment variable names as a charcter vector
    #
    experimentFeatures <<- as.character(dataFeaturesDF$V2)
}

##
## Helper method that merges the experiment, activity and subject data. It then assigns descriptive variable names
## and finally extracts only the measurements dealing with mean and standard deviation and returns the data frame.
## This helper method is called twice once for the Training dataset and once for the test dataset.
##
extractMeanAndStdDeviationMeasurements <- function(dataLocation, dataType, activityLabels, experimentFeaturers) {
    #
    # Define variables to hold the location of experiment data, activity data and subject data for the observations.
    #
    dataSetFile <- paste(dataLocation, dataType, sprintf("X_%s.txt", dataType), sep="/")
    dataSetActivityFile <- paste(dataLocation, dataType, sprintf("y_%s.txt", dataType), sep="/")
    subjectPerformingActivityFile <- paste(dataLocation, dataType, sprintf("subject_%s.txt", dataType), sep="/")
    #
    # Extract the names of variables that deal with mean and standard deviation measurements.
    #
    meanAndStdDeviationFeaturesIndexList <- grep("[a-zA-z]+-mean\\(|[a-zA-z]+-std\\(",experimentFeatures)
    meanAndStdDeviationFeaturesNameList <- experimentFeatures[meanAndStdDeviationFeaturesIndexList]
    #
    # Load the experiment data
    #
    dataSet <- read.table(dataSetFile)
    #
    # Assign descriptive names to the experiment variables.
    #
    colnames(dataSet) <- experimentFeatures
    #
    # Truncate the data set to include only the experiment variables that deal with mean and std deviation.
    #
    dataSet <- dataSet[,meanAndStdDeviationFeaturesNameList]
    #
    # Load the activities corresponding to the experiment measurements.
    #
    dataSetActivitiesDF <- read.table(dataSetActivityFile)
    #
    # Assign descriptive name to activity variable.
    #
    colnames(dataSetActivitiesDF) <- c("activity")
    #
    # Get Activity label mappings and replace the activity labels within the data frame with descriptive activity names.
    # Use the "within" API to accomplish this.
    #
    activityNames <- as.character(activityLabels)
    dataSetActivitiesDF <- within(dataSetActivitiesDF, activity <- factor(activity, labels=activityNames))
    #
    # Merge the activity and experiment data using the "cbind" function
    #
    dataSet <- cbind(dataSetActivitiesDF, dataSet)
    #
    # Load the subject data for corresponding to the experiment observations and assign it a descriptive variable name.
    #
    subjectPerformingActivityDF <- read.table(subjectPerformingActivityFile)
    colnames(subjectPerformingActivityDF) <- c("subject")
    #
    # Merge the subject and merged actvity/experiment data using "cbind" function and return the data frame.
    #
    cbind(subjectPerformingActivityDF, dataSet)
}

##
## This function will merge, tidy and process the training and test data set to return a clean set of data that is ready for analysis.
##
## Input: dataLocation - Location of the experiment data.
##        activityLabels - descriptive activity label names.
##        experimentFeatures - Complete list of experiment feature names.
##
## Output: A cleaned merged data set from training and test data.
##
getMergedTidyDataSet <- function(dataLocation, activityLabels, experimentFeatures) {
    #
    # Fetch the merged training data set extracting only the mean and std deviation measurements
    #
    trainDataSet <- extractMeanAndStdDeviationMeasurements(dataLocation, "train", activityLabels, experimentFeatures)
    #
    # Fetch the merged test data set extracting only the mean and std deviation measurements
    #
    testDataSet <- extractMeanAndStdDeviationMeasurements(dataLocation, "test", activityLabels, experimentFeatures)
    #
    # Merge the training and test data set using "rbind" function
    #
    fullDataSet <- rbind(trainDataSet, testDataSet)
    #
    # Give more descriptive variables names to the tidied and merged data set.
    #
    fullDataSetColNames <- colnames(fullDataSet)
    fullDataSetColNames <- gsub("mean\\(\\)", "Mean", fullDataSetColNames)
    fullDataSetColNames <- gsub("std\\(\\)", "StdDeviation", fullDataSetColNames)
    fullDataSetColNames <- gsub("tBodyAcc", "LinearBodyAcc", fullDataSetColNames)
    fullDataSetColNames <- gsub("tGravityAcc", "LinearGravityAcc", fullDataSetColNames)
    fullDataSetColNames <- gsub("tBodyGyro", "LinearBodyGyro", fullDataSetColNames)
    fullDataSetColNames <- gsub("fBodyAcc", "FourierBodyAcc", fullDataSetColNames)
    fullDataSetColNames <- gsub("fBodyGyro", "FourierBodyGyro", fullDataSetColNames)
    fullDataSetColNames <- gsub("fBodyBody", "FourierBodyBody", fullDataSetColNames)
    colnames(fullDataSet) <- fullDataSetColNames
    #
    # Return the tidied and merged data set
    #
    fullDataSet
}

##
## getAverageByActivityAndSubject is used for computing the Average on every feature measurement based on
## the activity and subject variables in the merged tidy data set that was passed in as input.
##
## Input: fullDataSet - Is the merged tidied data set that was obtained by combining the training and
##                      test data set and extracting only the mean and std deviation measurements.
##
## Return: A data table with averages computed on all features by activity and subject.
##
getAverageByActivityAndSubject <- function(fullDataSet) {
    #
    # load the "data.table" package
    #
    library(data.table)
    #
    # Convert the fullDataSet data frame to a data table.
    #
    fullDT <- data.table(fullDataSet)
    #
    # Summarize the measurement data to compute the mean by subject and activity.
    #
    fullDT[,lapply(.SD,mean), by=list(subject, activity)]
}

##
## fetchTidyDataSetOfFeatureAveragesBySubjectAndActivity is used to tidy the training and test data, merge the two data sets,
## update the feature variables names with descriptive labels. The complete data set obtained this way is then used to
## summarize the averages of the mean and std devation features for each subject and activity.
##
##
## Input: dataLocation - Location of the experiment data.
##
## Output: A file "./data/featureAveragesBySubjectAndActivity.txt" containing the summary average results.
##
fetchTidyDataSetOfFeatureAveragesBySubjectAndActivity <- function(dataLocation) {
    #
    # Load Activity label to deseriptive activty name mappings.
    #
    activityLabels <- getActivityLabelMappings(dataLocation)
    #
    # Load complete experiment variable feature list
    #
    experimentFeatures <- getExperimentDataFeatures(dataLocation)
    #
    # Load the Train, Test data, Tidy it, merge it with activity and subject data and return the complete cleaned
    # data set fetching only the mean and std deviation features from the experiment measurements.
    #
    fullDataSet <- getMergedTidyDataSet(dataLocation, activityLabels, experimentFeatures)
    #
    # Convert the fullDataSet data frame to a data table for performing summary transformations.
    #
    library(data.table)
    fullDT <- data.table(fullDataSet)
    #
    # Summarize the means for the data set features by each subject and activity
    #
    avgDataSet <- fullDT[,lapply(.SD,mean), by=list(subject, activity)]
    #
    # Write the summary results table to a file
    #
    write.table(avgDataSet, "./data/featureAveragesBySubjectAndActivity.txt", row.names=FALSE)
}
