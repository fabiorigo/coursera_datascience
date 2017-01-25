source("setup.R")

# Plot 1 (histogram of Global Active Power)
png(filename = "plot1.png", width = 480, height = 480)
hist(data[,2], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "tomato2")
dev.off()
