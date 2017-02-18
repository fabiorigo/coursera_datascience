filename1 <- "summarySCC_PM25.rds"
filename2 <- "Source_Classification_Code.rds"
if (!file.exists(filename1) || !file.exists(filename2)) {
    tmpFile <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", tmpFile, method = "curl")    
    unzip(tmpFile)
    unlink(tmpFile)
    remove(tmpFile)
}
if (!exists("NEI")) {
    NEI <- readRDS(filename1)
}
if (!exists("SCC")) {
    SCC <- readRDS(filename2)
}

remove(filename1)
remove(filename2)
