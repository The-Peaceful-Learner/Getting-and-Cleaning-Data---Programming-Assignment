library(dplyr)

#Training Datasets
subject_train<-read.delim(file = "UCI HAR Dataset\\train\\subject_train.txt",header = FALSE,col.names = "Subject No.")

X_train<-read.delim(file = "UCI HAR Dataset\\train\\X_train.txt",header = FALSE,sep = "")
feature_names<-read.delim("UCI HAR Dataset\\features.txt",header = FALSE)
names(X_train)<-t(feature_names)

y_train<-read.delim(file = "UCI HAR Dataset\\train\\y_train.txt",header = FALSE,col.names = "Activity No.")
Training_dataset<-cbind(subject_train,X_train,y_train)

#Test Datasets
subject_test<-read.delim(file = "UCI HAR Dataset\\test\\subject_test.txt",header = FALSE,col.names = "Subject No.")

X_test<-read.delim(file = "UCI HAR Dataset\\test\\X_test.txt",header = FALSE,sep = "")
names(X_test)<-t(feature_names)

y_test<-read.delim(file = "UCI HAR Dataset\\test\\y_test.txt",header = FALSE,col.names = "Activity No.")
Test_dataset<-cbind(subject_test,X_test,y_test)

#1. Combined_dataset: The training and test sets are merged to create one data set.
Combined_dataset<-rbind(Training_dataset,Test_dataset)

#2. mean_std_dataset: Extraction of only the measurements on the mean and standard deviation for each measurement
mean_std_dataset<-select(Combined_dataset,grep("mean",names(Combined_dataset),ignore.case = TRUE),grep("std",names(Combined_dataset),ignore.case = TRUE))

#3. Adding descriptive activity names for each activity in the combined dataset
Combined_dataset$Activity_Name<-case_when(Combined_dataset$Activity.No.==1 ~ "WALKING",
                                          Combined_dataset$Activity.No.==2 ~ "WALKING_UPSTAIRS",
                                          Combined_dataset$Activity.No.==3 ~ "WALKING_DOWNSTAIRS",
                                          Combined_dataset$Activity.No.==4 ~ "SITTING",
                                          Combined_dataset$Activity.No.==5 ~ "STANDING",
                                          Combined_dataset$Activity.No.==6 ~ "LAYING")

#4. Appropriate labelling of data set with descriptive variable names has been done in above steps during collation of training and test data sets.

#5.Creation of a second, independent tidy data set with the average of each variable for each activity and each subject.
Combined_dataset_split<-split(Combined_dataset,f = list(Combined_dataset$Activity_Name,Combined_dataset$Subject.No.))
Combined_dataset_split_average<-as.data.frame(t(sapply(Combined_dataset_split, function(x) {
  cbind(unique(x$Subject.No.),as.data.frame.list(colMeans(x[,2:562])),unique(x$Activity.No.),unique(x$Activity_Name))
})))
names(Combined_dataset_split_average)<-c("Subject.No.",t(feature_names),"Activity.No.","Activity_Name")
colnames(Combined_dataset_split_average)[2:562]<-paste("Average",colnames(Combined_dataset_split_average)[2:562],sep = "_")

write.table(Combined_dataset_split_average,file = "FinalSummary_Activity_Subject-wise_AvgValues.txt",row.names = FALSE)