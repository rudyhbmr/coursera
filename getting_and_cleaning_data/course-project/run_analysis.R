# Set working directory
setwd("./Documents/Github/coursera/getting_and_cleaning_data/course-project/UCI\ HAR\ Dataset")

# Step 0: Read datasets
## The datasets are divided into 3 parts mainly the features variable names and its training and test dataset, 
## the subject who carried out the experiment and the activity performed.

## Read features datasets and vector
x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
features <- read.table("features.txt")

## Read subject datasets
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

## Read activity datasets and labels
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
activity_labels <- read.table("activity_labels.txt")

# Step 1: Merge the training and the test sets to create one data set.

## Combine relevent data tables by rows
features_combined <- rbind(x_train, x_test)
subject_combined <- rbind(subject_train, subject_test)
activity_combined <- rbind(y_train, y_test)

## Assign column names
colnames(features_combined) <- features$V2
colnames(subject_combined) <- "subject"
colnames(activity_combined) <- "activity"

## Merge features, subject and activity by column into one dataset
data_combined <- cbind(features_combined, subject_combined, activity_combined)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

## Get only feature names that have mean() or std() in their name
mean_std_features <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

## Subset the data_combined data frame based on the selected columns
selected_columns <- c(as.character(mean_std_features), "subject", "activity")
data_combined <- subset(data_combined, select = selected_columns)

# Step 3: Use descriptive activity names to name the activities in the data set
data_combined$activity <- factor(data_combined$activity, 
                                 levels = activity_labels[, 1], labels = activity_labels[, 2])

# Step 4: Label the data set with descriptive variable names.
colnames(data_combined) <- gsub("[\\(\\)-]", "", colnames(data_combined))
colnames(data_combined) <- gsub("^t", "time", colnames(data_combined))
colnames(data_combined) <- gsub("^f", "frequency", colnames(data_combined))
colnames(data_combined) <- gsub("Acc", "Accelerometer", colnames(data_combined))
colnames(data_combined) <- gsub("Gyro", "Gyroscope", colnames(data_combined))
colnames(data_combined) <- gsub("Mag", "Magnitude", colnames(data_combined))
colnames(data_combined) <- gsub("BodyBody", "Body", colnames(data_combined))
colnames(data_combined) <- gsub("mean", "Mean", colnames(data_combined))
colnames(data_combined) <- gsub("std", "StandardDeviation", colnames(data_combined))

# Step 5: Create a second, independent tidy data set with the 
# average of each variable for each activity and each subject.

## Execute stat package for aggregate function
library(stats)

## Creates a data set of the means of each variable based on ativity and subject
data_combined2 <- aggregate(. ~subject + activity, data_combined, mean)

## Sort by subject for a cleaner presentation
data_combined2 <- data_combined2[order(data_combined2$subject, data_combined2$activity), ]
write.table(data_combined2, file = "averages_tidydata.txt", row.name = FALSE)
