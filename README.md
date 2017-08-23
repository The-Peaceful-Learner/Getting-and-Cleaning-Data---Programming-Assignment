# Getting-and-Cleaning-Data---Programming-Assignment
DESCRIPTION: My solution repository for Getting and Cleaning Data - Programming Assignment

The repository contains the following files:
README.md: This very file describing about the programming assignment and the other relevant files present in the repository.

1. The script run_analysis.R which:
  i. Merges the training and test datasets to create one dataset
  ii. Extracts only the measurements on the mean and standard deviation for each measurement
  iii. Uses descriptive activity names to name the activities in the data set - the activity names are appended as a new column to the dataset obtained in step i
  iv. Appropriately labels the data set with descriptive variable names
  v. From the data set in step iv, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  
2. Cookbook - Original Dataset.txt
   Describes in detail the methodology used to arrive at the original dataset and all the files available in the dataset
   
3. features_info.txt
   i. Describes the feature variables present in each observation denoting various action measurements using the accelerometer and gyroscope of Samsung Galaxy S smartphones
   ii. Describes the naming convention of the variables and summaries calculated.
   
4. features.txt:
   The complete list of variables of each feature vector is available in 'features.txt'
   
5. activity_labels.txt:
   Label descriptions of each activity experimented

6. The final tidy dataset file - FinalSummary_Activity_Subject-wise_AvgValues.txt:
   It contains the tidy dataset with the average of each variable for each activity and each subject.
