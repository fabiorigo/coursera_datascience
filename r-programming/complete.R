complete <- function(directory, id = 1:332) {
    result <- data.frame()
    for (i in id) {
        filename <- if (i < 100) paste('0', i, sep = '') else as.character(i)
        filename <- if (i < 10) paste('0', filename, sep = '') else filename
        file <- paste(directory, '/', filename, '.csv', sep = '')
        data <- read.csv(file)
        complete_data <- data[complete.cases(data[,1:4]),]
        nrows <- nrow(complete_data)
        new_row <- c(i,nrows)
        result <- rbind(result, new_row)
    }
    colnames(result) <- c('id', 'nobs')
    result
}