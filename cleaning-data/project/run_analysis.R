run_analysis <- function() {

    ## ------------------------------------
    ## Part 1: Loading and tidying features
    ## ------------------------------------

    ## Load the features.txt file into "features" to have the list of features to select from
    ## It has a single value per line, so it's possible to get a vector of them by using function "readLines"
    conFeatures <- file("UCI_HAR_Dataset/features.txt")
    features <- readLines(conFeatures)
    close(conFeatures)

    ## Generate a boolean vector that indicates which of the features are means or standard deviations
    featuresMeanStd <- grepl("mean\\(|std\\(", features)

    ## Tidy the feature names, for them to be easy for a human to read
    ## I'm using "lapply" to change every record of the vector, and save the values back to "features" variable
    ## The patterns which were chosen are the minimum set that can tidy the means and standard deviations
    features <- as.character(lapply(features, function(f) {
        f <- sub("^[0-9]+ ", "", f)
        f <- sub("^t", "Time.", f)
        f <- sub("^f", "Frequency.", f)
        f <- sub("Acc", ".Accelerometer.", f)
        f <- sub("Gyro", ".Gyroscope.", f)
        f <- sub("Mag", "Magnitude.", f)
        f <- sub("Jerk", "Jerk.", f)
        f <- sub("BodyBody", "Body", f)
        f <- sub("\\-mean\\(\\)", "Mean", f)
        f <- sub("\\-std\\(\\)", "Standard.Deviation", f)
        gsub("\\-", ".", f)
    }))

    ## Generate a vector of widths to use when reading training data
    ## The "read.fwf" function accept a width parameter with the size of each field to be read
    ## If positive value, the field is read; if negative value, the field is discarded
    ## All fields in "train_X.txt" and "test_X.txt" are 16 characters long; selection is made on the mean and standard deviation features
    ## With this, we can later improve the performance of the "read.fwf" function calls
    widths <- as.numeric(lapply(featuresMeanStd, function(isMeanOrStd) { if (isMeanOrStd) { 16 } else { -16 }}))

    ## --------------------------------------
    ## Part 2: Loading and tidying activities
    ## --------------------------------------

    ## Load the activity_labels.txt file into "activities" to have the list of activities done by the subjects
    ## It has a single value per line, so it's possible to get a vector of them by using function "readLines"
    ## Take out the numbers from the beginning of the labels; we won't need them
    conActivities <- file("UCI_HAR_Dataset/activity_labels.txt")
    activities <- readLines(conActivities)
    activities <- as.character(lapply(activities, function(x) { sub("^[0-9]+ ", "", x) }))
    close(conActivities)

    ## --------------------------------------
    ## Part 3: Loading and tidying train data
    ## --------------------------------------

    ## Load the train/subject_train.txt file into "Subject" to have the list of subjects per train record
    ## It has a single value per line, so it's possible to get a vector of them by using function "readLines"
    conSubjectTrain <- file("UCI_HAR_Dataset/train/subject_train.txt")
    Subject <- readLines(conSubjectTrain)
    close(conSubjectTrain)

    ## Load the train/y_train.txt file into "Activity" to have the list of activities per train record
    ## It has a single value per line, so it's possible to get a vector of them by using function "readLines"
    ## Use the activities vector to translate the activity numbers into their correspondent labels
    conTrainY <- file("UCI_HAR_Dataset/train/y_train.txt")
    Activity <- readLines(conTrainY)
    Activity <- as.character(lapply(Activity, function(x) { activities[as.numeric(x)] }))
    close(conTrainY)

    ## Load the train/X_train.txt file into a data frame, selecting features data using the widths vector and naming the columns according to features/featuresMeanStd vectors
    ## Bind the Subject and Activity vectors as columns, as they are additional data about the records read into the data frame
    dfTrain <- read.fwf("UCI_HAR_Dataset/train/X_train.txt", widths = widths, col.names = features[featuresMeanStd], header = FALSE)
    dfTrain <- cbind(Activity, Subject, dfTrain)

    ## -------------------------------------
    ## Part 4: Loading and tidying test data
    ## -------------------------------------

    ## Load the test/subject_test.txt file into "Subject" to have the list of subjects per test record
    ## It has a single value per line, so it's possible to get a vector of them by using function "readLines"
    conSubjectTest <- file("UCI_HAR_Dataset/test/subject_test.txt")
    Subject <- readLines(conSubjectTest)
    close(conSubjectTest)

    ## Load the test/y_test.txt file into "Activity" to have the list of activities per test record
    ## It has a single value per line, so it's possible to get a vector of them by using function "readLines"
    ## Use the activities vector to translate the activity numbers into their correspondent labels
    conTestY <- file("UCI_HAR_Dataset/test/y_test.txt")
    Activity <- readLines(conTestY)
    Activity <- as.character(lapply(Activity, function(x) { activities[as.numeric(x)] }))
    close(conTestY)

    ## Load the test/X_test.txt file into a data frame, selecting features data using the widths vector and naming the columns according to features/featuresMeanStd vectors
    ## Bind the Subject and Activity vectors as columns, as they are additional data about the records read into the data frame
    dfTest <- read.fwf("UCI_HAR_Dataset/test/X_test.txt", widths = widths, col.names = features[featuresMeanStd], header = FALSE)
    dfTest <- cbind(Activity, Subject, dfTest)

    ## -----------------------------------------------
    ## Part 5: Creating a data frame with all raw data
    ## -----------------------------------------------

    allData <- rbind(dfTrain, dfTest)
    ## Removing the intermediate data frames to save memory
    remove(dfTrain)
    remove(dfTest)

    ## -----------------------------------------------------------------------------------
    ## Part 6: Obtaining the averages of each selected measure, by subject and by activity
    ## -----------------------------------------------------------------------------------

    ## Making the aggregation of measurement columns, by activity and subject, using function "mean"
    result <- aggregate(allData[,3:ncol(allData)], by=list(allData$Activity, allData$Subject), FUN = mean)
    ## Fix the column names after applying the aggregate function
    colnames(result) <- c("Activity", "Subject", names(allData[3:ncol(allData)]))
    ## Saving the resulting data frame into a file
    write.table(result, "tidy_measures.txt", row.names = FALSE)
}
