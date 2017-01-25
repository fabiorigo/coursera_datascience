source("setup.R")

# Plot 3 (Scattering plot of sub meterings x date/time)
# Here it's plotted without data first, so that each type of sub metering can have its color; legend is included with border
png(filename = "plot3.png", width = 480, height = 480)
plot(data[,1], data[,6], ylab = "Energy sub metering", xlab = "", type = "n")
lines(data[,1], data[,6], col = "black")
lines(data[,1], data[,7], col = "red")
lines(data[,1], data[,8], col = "blue")
legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()
