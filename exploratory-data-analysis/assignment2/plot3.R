# Question: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of 
# these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in 
# emissions from 1999–2008? 
# 
# Use the ggplot2 plotting system to make a plot answer this question.
#
# Strategy: 
# 0. Prior analysis has showed that the data does not contain NAs, and are already loaded with the correct classes
# 1. Create a data frame with the consolidated sum of all emission per year, with filtering to the Baltimore fips and the type variable
# 2. Plot the graph to see if the emissions have decreased/increased from 1999 to 2008
# 
# Conclusion: Point type was the only one to increase; the others decreased, with highlight to non-point type.
#

library(ggplot2)
source("setup.R")

NEIBaltimorePoint <- NEI[NEI$fips == "24510" & NEI$type == "POINT",]
NEIBaltimoreNonPoint <- NEI[NEI$fips == "24510" & NEI$type == "NONPOINT",]
NEIBaltimoreOnRoadPoint <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
NEIBaltimoreNonRoadPoint <- NEI[NEI$fips == "24510" & NEI$type == "NON-ROAD",]

years <- c()
emissions <- c()
types <- c()

for (year in c(1999, 2002, 2005, 2008)) {
    years <- c(years, rep(year, 4))
    emissions <- c(emissions, c(
        sum(NEIBaltimorePoint[NEIBaltimorePoint$year == year,]$Emissions), 
        sum(NEIBaltimoreNonPoint[NEIBaltimoreNonPoint$year == year,]$Emissions), 
        sum(NEIBaltimoreOnRoadPoint[NEIBaltimoreOnRoadPoint$year == year,]$Emissions), 
        sum(NEIBaltimoreNonRoadPoint[NEIBaltimoreNonRoadPoint$year == year,]$Emissions)))
    types <- c(types, c("Point", "Non-Point", "On-Road", "Non-Road"))
}

df3 <- data.frame(Year=years, Emission=emissions, Type=types)

png(filename = "plot3.png")
par(mfrow = c(1,1))
ggplot(df3, aes(x = Year, y = Emission, color = Type)) + geom_line()
dev.off()

remove(df3)
remove(NEIBaltimoreNonPoint)
remove(NEIBaltimoreNonRoadPoint)
remove(NEIBaltimoreOnRoadPoint)
remove(NEIBaltimorePoint)
remove(emissions)
remove(types)
remove(year)
remove(years)
