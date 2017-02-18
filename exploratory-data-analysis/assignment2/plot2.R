# Question: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#
# Use the base plotting system to make a plot answering this question.
#
# Strategy: 
# 0. Prior analysis has showed that the data does not contain NAs, and are already loaded with the correct classes
# 1. Create a data frame with the consolidated sum of all emission per year, with filtering to the Baltimore fips
# 2. Plot the graph to see if the emissions have decreased from 1999 to 2008
# 
# Conclusion: It has overall decreased, but had a short period of increase. 
#

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
