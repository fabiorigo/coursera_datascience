source("setup.R")

# Plot 4 (4-in-1 scattering plots)
# The first columns contain the same plots 2 and 3 (except that legend from plot 3 has no border); 
# It is added in second column the scattering plots Voltage x date/time and Global Reactive Power x date/time
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2), mar = c(4, 4, 3, 2))
plot(data[,1], data[,2], pch=20, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(data[,1], data[,2], pch=20)
plot(data[,1], data[,6], ylab = "Energy sub metering", xlab = "", type = "n")
lines(data[,1], data[,6], col = "black")
lines(data[,1], data[,7], col = "red")
lines(data[,1], data[,8], col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")
plot(data[,1], data[,4], pch=20, type = "n", ylab = "Voltage", xlab = "datetime")
lines(data[,1], data[,4])
plot(data[,1], data[,3], pch=20, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(data[,1], data[,3])
dev.off()
