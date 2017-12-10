# Question 2
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system o make a plot nswering this question.

setwd("~/Documents/Github/coursera/exploratory_data_analysis_project/exdata-data-NEI_data")

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get total emissions by year in Baltimore City, Maryland
baltimore <- subset(NEI, fips == "24510")
totalbaltimorepm2.5year <- tapply(baltimore$Emissions, baltimore$year, sum)

# Create Plot 2
bp <- barplot(totalbaltimorepm2.5year, names.arg = unique(baltimore$year), ylim = c(0,4000), 
              xlab = "Year", ylab = expression("Total PM"[2.5]*" Emissions (tons)"), 
              main = expression("Total PM"[2.5]*" emissions"*" in Baltimore City, Maryland"))
text(x = bp, y = round(totalbaltimorepm2.5year), 
     label = round(totalbaltimorepm2.5year), 
     pos = 3, cex = 1, col = "black")

# Save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()