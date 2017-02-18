# Question: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
#
# Strategy: 
# 0. Prior analysis has showed that the data does not contain NAs, and are already loaded with the correct classes
# 1. Select the SCC codes of the coal combustion-related sources; the codes selected were the ones in which the word "Coal" appears at the short name
# 2. Create a data frame with the consolidated sum of all emission per year, with filtering to the coal related SCC Codes
# 3. Plot the graph to see what were the changes from 1999 to 2008
# 
# Conclusion: It had a substancial decrease in the year 2008
#

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
