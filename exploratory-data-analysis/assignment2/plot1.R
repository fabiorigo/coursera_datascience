source("setup.R")

years <- c(1999,2002,2005,2008)
emissions <- c()

for (year in years) {
    emissions <- c(emissions, sum(NEI[NEI$year == year,]$Emissions))
}

df1 <- data.frame(years=years, emissions=emissions)

png(filename = "plot1.png")
par(mfrow = c(1,1))
plot(x=df1$year, y=df1$emissions, pch = 20, xlab = "Year", ylab = "Total PM2.5 (US)")
lines(x=df1$year, y=df1$emissions)
dev.off()

remove(df1)
remove(year)
remove(years)
remove(emissions)
