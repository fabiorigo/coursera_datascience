# Question: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the 
# years 1999, 2002, 2005, and 2008.
#
# Strategy: 
# 0. Prior analysis has showed that the data does not contain NAs, and are already loaded with the correct classes
# 1. Create a data frame with the consolidated sum of all emission per year, without any location filtering 
# 2. Plot the graph to see if the emissions have decreased from 1999 to 2008
# 
# Conclusion: It has decreased. 
#

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
