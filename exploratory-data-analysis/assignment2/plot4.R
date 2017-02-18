source("setup.R")

coalSCC <- SCC[grep("[Cc]oal", SCC$Short.Name), 1]
coalNEI <- NEI[NEI$SCC %in% coalSCC, ]

years <- c(1999, 2002, 2005, 2008)
emissions <- c()

for (year in years) {
    emissions <- c(emissions, sum(coalNEI[coalNEI$year == year,]$Emissions))
}

df4 <- data.frame(years=years, emissions=emissions)

png(filename = "plot4.png")
par(mfrow = c(1,1))
plot(x=df4$year, y=df4$emissions, pch = 20, xlab = "Year", ylab = "Total Coal Related PM2.5 (US)")
lines(x=df4$year, y=df4$emissions)
dev.off()

remove(coalNEI)
remove(coalSCC)
remove(df4)
remove(emissions)
remove(years)
remove(year)
