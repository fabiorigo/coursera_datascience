# Question: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#
# Strategy: 
# 0. Prior analysis has showed that the data does not contain NAs, and are already loaded with the correct classes
# 1. Select the SCC codes of the vehicle related sources; the codes selected were the ones in which the word "Vehicle" appears at the short name
# 2. Create a data frame with the consolidated sum of all emission per year, with filtering to the vehicle related SCC Codes and the Baltimore fips
# 3. Plot the graph to see what were the changes from 1999 to 2008
# 
# Conclusion: It had a substancial decrease in the year 2002
#

source("setup.R")

vehicleSCC <- SCC[grep("[Vv]ehicle", SCC$Short.Name), 1]
vehicleNEI <- NEI[NEI$fips == "24510" & NEI$SCC %in% vehicleSCC, ]

years <- c(1999, 2002, 2005, 2008)
emissions <- c()

for (year in years) {
    emissions <- c(emissions, sum(vehicleNEI[vehicleNEI$year == year,]$Emissions))
}

df5 <- data.frame(years=years, emissions=emissions)

png(filename = "plot5.png")
par(mfrow = c(1,1))
plot(x=df5$year, y=df5$emissions, pch = 20, xlab = "Year", ylab = "Total Vehicle Related PM2.5 (Baltimore)")
lines(x=df5$year, y=df5$emissions)
dev.off()

remove(vehicleNEI)
remove(vehicleSCC)
remove(df5)
remove(emissions)
remove(years)
remove(year)
