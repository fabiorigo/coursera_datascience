source("setup.R")

vehicleSCC <- SCC[grep("[Vv]ehicle", SCC$Short.Name), 1]
vehicleNEI_B <- NEI[NEI$fips == "24510" & NEI$SCC %in% vehicleSCC, ]
vehicleNEI_LA <- NEI[NEI$fips == "06037" & NEI$SCC %in% vehicleSCC, ]

years <- c(1999, 2002, 2005, 2008)
emissions_B <- c()
emissions_LA <- c()

for (year in years) {
    emissions_B <- c(emissions_B, sum(vehicleNEI_B[vehicleNEI_B$year == year,]$Emissions))
    emissions_LA <- c(emissions_LA, sum(vehicleNEI_LA[vehicleNEI_LA$year == year,]$Emissions))
}

df6 <- data.frame(years=years, emissions_B=emissions_B, emissions_LA=emissions_LA)

png(filename = "plot6.png")
par(mfrow = c(1,2), mar = c(4, 4, 3, 2))
plot(x=df6$year, y=df6$emissions_B, pch = 20, xlab = "Year", ylab = "Total Vehicle Related PM2.5 (Baltimore)", ylim = c(23, 1475))
lines(x=df6$year, y=df6$emissions_B)
plot(x=df6$year, y=df6$emissions_LA, pch = 20, xlab = "Year", ylab = "Total Vehicle Related PM2.5 (Los Angeles)", ylim = c(23, 1475))
lines(x=df6$year, y=df6$emissions_LA)
dev.off()

remove(vehicleNEI_B)
remove(vehicleNEI_LA)
remove(vehicleSCC)
remove(df6)
remove(emissions_B)
remove(emissions_LA)
remove(years)
remove(year)
