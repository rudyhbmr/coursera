# Question 1
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

setwd("~/Documents/Github/coursera/exploratory_data_analysis_project/exdata-data-NEI_data")

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get total emissions by year
totalpm2.5year <- tapply(NEI$Emissions, NEI$year, sum)

# Create Plot 1
bp <- barplot(totalpm2.5year, names.arg = unique(NEI$year), ylim = c(0,8000000), 
        xlab = "Year", ylab = expression("Total PM"[2.5]*" Emissions (tons)"), 
        main = expression("Total PM"[2.5]*" emissions"*" for various years"))
text(x = bp, y = round(totalpm2.5year), 
     label = round(totalpm2.5year), 
     pos = 3, cex = 1, col = "black")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()