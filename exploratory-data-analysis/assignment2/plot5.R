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
