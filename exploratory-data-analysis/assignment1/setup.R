# Preparing the data
#
# In here we load the data set, making the needed adaptations for it to be ready for consumption. That means: 
# 1) Guaranteeing we have English locale (for the weekdays to be plotted in English)
# 2) Downloading and unzipping the dataset
# 3) Reading only the data from 2007 Feb 1 and 2007 Feb 2 (skip 66637 lines and read 2880)
# 4) Using class numeric for all columns, except for date and time, which is used character; in a later step, this is translated to a Date column
# 5) Setting the header manually (due to the limitation of the function, that can only skip lines from the start of the file)
# 6) Removing date and time character type columns, that are now translated to one single Date column
Sys.setlocale("LC_TIME", "C")
filename <- "household_power_consumption.txt"
if (!file.exists(filename)) {
    tmpFile <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", tmpFile, method = "curl")    
    unzip(tmpFile)
    unlink(tmpFile)
}
data <- read.table(filename, sep = ";", skip = 66637, nrows = 2880, header = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), col.names = c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
datetime <- strptime(paste(data[,1], data[,2]), format = "%d/%m/%Y %H:%M:%S")
data <- cbind(datetime, data)
colnames(data)[1] <- c("Date/Time")
data <- data[ , !(names(data) %in% c("Date", "Time"))]
