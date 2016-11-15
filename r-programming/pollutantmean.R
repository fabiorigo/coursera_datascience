pollutantmean <- function(directory, pollutant, id = 1:332) {
    data <- data.frame()
    for (i in id) {
        filename <- if (i < 100) paste('0', i, sep = '') else as.character(i)
        filename <- if (i < 10) paste('0', filename, sep = '') else filename
        file <- paste(directory, '/', filename, '.csv', sep = '')
        data <- rbind(data, read.csv(file))
    }
    data <- data[complete.cases(data[,pollutant]),pollutant]
    round(mean(data), digits = 3);
}
