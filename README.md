---
output: html_document
---
## Introduction

The purpose of "run_analysis.R" package is to provide a set of scripts to collect, process and tidy the data to get it ready for analysis. Each of the
interface functions provided in this package will be described in detail in the following sections. This package exposes four different interface as follows:
1. Interface to get the activity label to descriptive name mappings
2. Interface to get the list of experiment features
3. Helper Interface to to extract the mean and Standard deviation variables of the experiment data and merge with subject and activity info
4. Interface to tidy, merge the test and train data and update the variable names.
5. Interface to create the average for each variable based on the activity and the subject

## getActivityLabelMappings
This function loads the activity label to descriptive name mappings from the specified data location. It will return a vector of the activity names.

### Input Parameters
<table border=1 style="width:100%">
    <tr>
        <th>Parameter Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><b>dataLocation</td>
        <td><i>specifies the location locally on disk to fetch the data from</td>
    </tr>
</table>

### Return
This interface returns a vector of descriptive activity names indexed by the activity label.


## getExperimentDataFeatures
This function will load the complete list of feature variable names used in the collected experiment data. It will return a vector of the feature variable names.

### Input Parameters
<table border=1 style="width:100%">
    <tr>
        <th>Parameter Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><b>dataLocation</td>
        <td><i>specifies the location locally on disk to fetch the data from</td>
    </tr>
</table>

### Return
This interface returns a complete list of feature variable names as a character vector.


## extractMeanAndStdDeviationMeasurements
This is a helper function that is used by the *getMergedTidyDataSet* interface described in the next section. This function will load the subjects, activities and measurement data for a given data set. It will extract only the *mean* and *standard deviation* variables of the experiment observations. It will also assign descriptive variable names to the data that was loaded. Finally it will merge the activity, subject and experiment data set using the *cbind* function.

### Input Parameters
<table border=1 style="width:100%">
    <tr>
        <th>Parameter Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><b>dataLocation</td>
        <td><i>specifies the location locally on disk to fetch the data from</td>
    </tr>
    <tr>
        <td><b>dataType</td>
        <td><i>specifies the type of data being processed. Allowed values are <b>train</b> and <b>test</b></td>
    </tr>
    <tr>
        <td><b>activityLabels</td>
        <td><i>List of activity label descriptive name mappings returned by <b>getActivityLabelMappings</b> inteface</td>
    </tr>
    <tr>
        <td><b>experimentFeatures</td>
        <td><i>Experiment feature variable names returned by <b>getExperimentDataFeatures</b> interface</td>
    </tr>
</table>

### Return
This interface returns a data frame containing the activity, subject and experiment feature variables.


## getMergedTidyDataSet
This function will process, tidy and merge the training and test data set to generate a tidy data set that is ready for analysis. It will use the helper function `extractMeanAndStdDeviationMeasurements` to tidy the training and test datasets. It will then merge the tidied training and test data sets to form a single comprehensive data set using the *rbind* function. It will then process the variable names in the merged data set to give descriptive variable names using the *gsub* function.

### Input Parameters
<table border=1 style="width:100%">
    <tr>
        <th>Parameter Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><b>dataLocation</td>
        <td><i>specifies the location locally on disk to fetch the data from</td>
    </tr>
    <tr>
        <td><b>activityLabels</td>
        <td><i>List of activity label descriptive name mappings returned by <b>getActivityLabelMappings</b> inteface</td>
    </tr>
    <tr>
        <td><b>experimentFeatures</td>
        <td><i>Experiment feature variable names returned by <b>getExperimentDataFeatures</b> interface</td>
    </tr>
</table>

### Return
This interface will return a data frame that is a merged and tidied dataset of the means and standard deviations of the experiment data.


## getAverageByActivityAndSubject
This function will compute the average on all feature variables that are grouped by subject and activity. This function will convert the fullDataSet data frame into a datatable and use the *lapply* function to compute the averages of all feature measurements for each subject and activity.

### Input Parameters
<table border=1 style="width:100%">
    <tr>
        <th>Parameter Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><b>fullDataSet</td>
        <td><i>specifies merged and tidied data set returned by <b>getMergedTidyDataSet</b> function</td>
    </tr>
</table>

### Return
This function will return a summary table of averages on all features in the fullDataSet for each subject and activity.

## fetchTidyDataSetOfFeatureAveragesBySubjectAndActivity
This function is used to cleans, merges and transforms the data set provided for this project and summarizes the averages of the `mean` and `std deviation` feature variables by each subject and activity. It is the wrapper function that calls the other functions provided in this package to clean, transform and summarize the data that is finally written to a file in text format.

## Script Usage
This section outlines the usage for the interfaces provided in `run_analysis.R`. The folder location shown here in the steps "GettingAndCleaningData" is an example and contains the run_analysis.R script and a data sub-folder containing the experiment measurement data. Shown here is the sequence of R calls some calling function from this package to transform the experiment data for analysis.

```
setwd("/users/home/user1/GettingAndCleaningData")
source("run_analysis.R")
dataLocation <- "/users/home/user1/GettingAndCleaningData/data"
fetchTidyDataSetOfFeatureAveragesBySubjectAndActivity(dataLoc)
```

<table border=1 style="width:100%">
    <tr>
        <th>Data Transform Step</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><b>1</td>
        <td><i>Set the working directory</td>
    </tr>
    <tr>
        <td><b>2</td>
        <td><i>Assign the data location to variable <b>dataLocation</b></td>
    </tr>
    <tr>
        <td><b>3</td>
        <td><i>Call interface <b>fetchTidyDataSetOfFeatureAveragesBySubjectAndActivity</b> to clean, transform and summarize the data. The results are written to a text file `./data/featureAveragesBySubjectAndActivity.txt`</td>
    </tr>
</table>