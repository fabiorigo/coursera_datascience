run_analysis <- function(n = -1) {
    conFeatures <- file("UCI_HAR_Dataset/features.txt")
    features <- readLines(conFeatures)
    close(conFeatures)
    remove(conFeatures)
    featuresMeanStd <- grepl("mean\\(|std\\(", features)
    features <- as.character(lapply(features, function(f) { 
        f <- sub("^[0-9]+ ", "", f) 
        f <- sub("^t", "Time.", f)
        f <- sub("^f", "Frequency.", f) 
        f <- sub("Acc", ".Accelerometer.", f)
        f <- sub("Gyro", ".Gyroscope.", f)
        f <- sub("Mag", "Magnitude.", f)
        f <- sub("Jerk", "Jerk.", f)
        f <- sub("\\-mean\\(\\)", "Mean", f)
        f <- sub("\\-std\\(\\)", "Standard.Deviation", f)
        gsub("\\-", ".", f) 
    }))
    
    widths <- as.numeric(lapply(featuresMeanStd, function(x) { if (x) { 16 } else { -16 }}))
    
    conActivities <- file("UCI_HAR_Dataset/activity_labels.txt")
    activities <- readLines(conActivities)
    activities <- as.character(lapply(activities, function(x) { sub("^[0-9]+ ", "", x) }))
    close(conActivities)
    remove(conActivities)
    
    conSubjectTrain <- file("UCI_HAR_Dataset/train/subject_train.txt")
    Subject <- readLines(conSubjectTrain, n = n)
    close(conSubjectTrain)
    remove(conSubjectTrain)
    conTrainY <- file("UCI_HAR_Dataset/train/y_train.txt")
    Activity <- readLines(conTrainY, n = n)
    Activity <- as.character(lapply(Activity, function(x) { activities[as.numeric(x)] }))
    close(conTrainY)
    remove(conTrainY)
    dfTrain <- read.fwf("UCI_HAR_Dataset/train/X_train.txt", widths = widths, col.names = features[featuresMeanStd], header = FALSE, n = n)
    dfTrain <- cbind(dfTrain, Activity)
    dfTrain <- cbind(dfTrain, Subject)
    
    conSubjectTest <- file("UCI_HAR_Dataset/test/subject_test.txt")
    Subject <- readLines(conSubjectTest, n = n)
    close(conSubjectTest)
    remove(conSubjectTest)
    conTestY <- file("UCI_HAR_Dataset/test/y_test.txt")
    Activity <- readLines(conTestY, n = n)
    Activity <- as.character(lapply(Activity, function(x) { activities[as.numeric(x)] }))
    close(conTestY)
    remove(conTestY)
    dfTest <- read.fwf("UCI_HAR_Dataset/test/X_test.txt", widths = widths, col.names = features[featuresMeanStd], header = FALSE, n = n)
    dfTest <- cbind(dfTest, Activity)
    dfTest <- cbind(dfTest, Subject)
    
    allData <- rbind(dfTrain, dfTest)
    remove(dfTrain)
    remove(dfTest)
    
    activities <- c()
    subjects <- c()
    measures <- c()
    averages <- c()
    for (a in levels(allData$Activity)) {
        for (s in levels(allData$Subject)) {
            for (f in features[featuresMeanStd]) {
                localData <- allData[allData$Subject == s & allData$Activity == a, ]
                activities <- c(activities, a)
                subjects <- c(subjects, s)
                measures <- c(measures, f)
                averages <- c(averages, mean(localData[, f]))
            }
        }
    }
    data.frame(Activity = activities, Subject = subjects, Measure = measures, Average = averages)
}
