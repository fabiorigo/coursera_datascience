source("setup.R")

years <- c(1999,2002,2005,2008)
emissions <- c()

for (year in years) {
    emissions <- c(emissions, sum(NEI[NEI$fips == "24510" & NEI$year == year,]$Emissions))
}

df2 <- data.frame(years=years, emissions=emissions)

png(filename = "plot2.png")
par(mfrow = c(1,1))
plot(x=df2$year, y=df2$emissions, pch = 20, xlab = "Year", ylab = "Total PM2.5 (Baltimore)")
lines(x=df2$year, y=df2$emissions)
dev.off()

remove(df2)
remove(emissions)
remove(year)
remove(years)
