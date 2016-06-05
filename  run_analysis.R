dir<-setwd("C:\\Users\\kater_000\\Downloads\\ergasia")

training_set<-read.table("UCI HAR Dataset\\train\\X_train.txt")
test_set<-read.table("UCI HAR Dataset\\test\\X_test.txt")
training_label<-read.table("UCI HAR Dataset\\train\\y_train.txt")
test_label<-read.table("UCI HAR Dataset\\test\\y_test.txt")
training_subject<-read.table("UCI HAR Dataset\\train\\subject_train.txt")
test_subject<- read.table("UCI HAR Dataset\\test\\subject_test.txt") 
features<-read.table("UCI HAR Dataset\\features.txt")
feat<-as.vector(features[,2])

test<-cbind(test_label,test_subject,test_set)
training<-cbind(training_label,training_subject,training_set)

total_set<-rbind(training,test) # Merges the training and the test sets to create one data set

vector_means<-apply(total_set[,3:563],2,mean) # The mean for each measurement
vector_sds<-apply(total_set[,3:563],2,sd)  # The standard deviation for each measurement

activity_labels<-c("WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING","STANDING", "LAYING")
total_set$V1[total_set$V1=="1"]<-activity_labels[1] # descriptive activity names to name the activities in the data set
total_set$V1[total_set$V1=="2"]<-activity_labels[2]
total_set$V1[total_set$V1=="3"]<-activity_labels[3]
total_set$V1[total_set$V1=="4"]<-activity_labels[4]
total_set$V1[total_set$V1=="5"]<-activity_labels[5]
total_set$V1[total_set$V1=="6"]<-activity_labels[6]

colnames(total_set)[3:563]<-feat # Appropriately labels the data set with descriptive variable names
colnames(total_set)[1]<-"activity"  
colnames(total_set)[2]<-"subject"

aggdata<- aggregate(total_set[,3:563], by= list(total_set$activity,total_set$subject), FUN = mean) #the average of each variable for each activity and each subject
write.table(aggdata,"results.txt")
 
