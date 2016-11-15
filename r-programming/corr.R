corr <- function(directory, threshold = 0) {
    files <- list.files(directory);
    cor_data <- c()
    for (file in files) {
        data <- read.csv(paste(directory, '/', file, sep = ''))
        complete_data <- data[complete.cases(data[,1:4]),]
        nrows <- nrow(complete_data)
        if (nrows > threshold) {
            cor_data <- c(cor_data, cor(complete_data$sulfate, complete_data$nitrate))
        }
    }
    cor_data
}