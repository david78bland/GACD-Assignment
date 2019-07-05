# GACD-Assignment
Assignment for Getting And Cleaning Data assignment

This assumes you have all the base data as copied from website in your home directory

uses the following tables as supplied ( for more info check http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data was download originally on XXXX date


the following is true from origin of data and is reproduced below for reference:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

*******************************************************8



New data tables created in Script (inlcudes intermediate data)

"act_lables" - reads in teh data for activty labels, whcih as above is the class label of the activity name
"features" -reads in teh features table, is a list of all features, is 561 observations of which we are only interested in the first 6 variables which is the mean and standard deviation for each measurement.

"X_train " - reads the first 6 variables of the Training data set, as only interested in the mean and standard deviation of each variable, only need the first 6 variables

"X_test " - reads the first 6 variables of the Test data set, as only interested in the mean and standard deviation of each variable, only need the first 6 variables

"y_train" - is the indicator on which activty the subject was doing in the training data set
"y_test" - is the indicator on which activty the subject was doing in the testing data set

"subjectTrain" - is the subject undertaking that activity and which relates to the measurement data in teh training data set
"subjectTest" - is the subject undertaking that activity and which relates to the measurement data in the testing data set

"testData" - combines the 'subjectTest', 'y_test', 'X_test' data into a dataframe,  that is it combines the subject, activity number and data set information

"trainData" - combines the 'subjectTrain', 'y_train', 'X_train' data into a dataframe,  that is it combines the subject, activity number and data set information

"combinedData" - combines the test and training data into one dataset

"FinalTable" - is the summary table of Subject/Activity for the 6 measurements we are interested in




