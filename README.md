# Getting-and-Cleaning-data
Human Activity Recognition Using Smartphones Dataset

After determining the working directory, I uploaded in R the txt files (the data sets) and start the cleaning.
The first thing that I did, was to merge the training set with the test set. Then, I created two vectors. In the 
first one, you can see the mean for each measurement and in the second one the standard deviation. After that,
I added descriptive activity names to name the activities in the data set, using the names from features.txt.
Then, I put names to the columns, the first column is the "activity", the second column is the "subject" and the 
columns have names from the feature.txt. In the end, I calculated the average of each variable for each activity
and each subject, using the "aggregate" function of R.
