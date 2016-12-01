run_analysis <- function(n = -1) {
    conFeatures <- file("UCI_HAR_Dataset/features.txt")
    features <- readLines(conFeatures)
    close(conFeatures)
    featuresMeanStd <- grepl("mean\\(|std\\(", features)
    features <- as.character(lapply(features, function(x) { sub("^[0-9]+ ", "", x) }))
    features <- as.character(lapply(features, function(x) { sub("^t", "Time ", x) }))
    features <- as.character(lapply(features, function(x) { sub("^f", "Frequency ", x) }))
    features <- as.character(lapply(features, function(x) { sub("Acc", " Accelerometer ", x) }))
    features <- as.character(lapply(features, function(x) { sub("Gyro", " Gyroscope ", x) }))
    features <- as.character(lapply(features, function(x) { sub("Mag", "Magnitude ", x) }))
    features <- as.character(lapply(features, function(x) { sub("Jerk", "Jerk ", x) }))
    features <- as.character(lapply(features, function(x) { sub("\\-mean\\(\\)", "Mean", x) }))
    features <- as.character(lapply(features, function(x) { sub("\\-std\\(\\)", "Standard Deviation", x) }))
    
    widths <- as.numeric(lapply(featuresMeanStd, function(x) { if (x) { 16 } else { -16 }}))
    
    conActivities <- file("UCI_HAR_Dataset/activity_labels.txt")
    activities <- readLines(conActivities)
    activities <- as.character(lapply(activities, function(x) { sub("^[0-9]+ ", "", x) }))
    close(conActivities)
    
    conTrainY <- file("UCI_HAR_Dataset/train/y_train.txt")
    Activity <- readLines(conTrainY, n = n)
    Activity <- as.character(lapply(Activity, function(x) { activities[as.numeric(x)] }))
    close(conTrainY)
    df <- read.fwf("UCI_HAR_Dataset/train/X_train.txt", widths = widths, col.names = features[featuresMeanStd], header = FALSE, n = n)
    df <- cbind(df, Activity)
    
    conTestY <- file("UCI_HAR_Dataset/test/y_test.txt")
    Activity <- readLines(conTestY, n = n)
    Activity <- as.character(lapply(Activity, function(x) { activities[as.numeric(x)] }))
    close(conTestY)
    df2 <- read.fwf("UCI_HAR_Dataset/test/X_test.txt", widths = widths, col.names = features[featuresMeanStd], header = FALSE, n = n)
    df2 <- cbind(df2, Activity)
    
    rbind(df, df2)
}