source("setup.R")

# Plot 2 (Scattering plot of Global Active Power x date/time)
# Here it's plotted without data first, so that data can be drawn as lines after
png(filename = "plot2.png", width = 480, height = 480)
plot(data[,1], data[,2], pch=20, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(data[,1], data[,2], pch=20)
dev.off()
