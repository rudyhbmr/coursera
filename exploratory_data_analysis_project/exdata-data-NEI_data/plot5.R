# Question 5
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

setwd("~/Documents/Github/coursera/exploratory_data_analysis_project/exdata-data-NEI_data")

library(ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data for Baltimore City and type: ON-ROAD
baltimoreonroad <- NEI[(NEI$fips == "24510") & (NEI$type == "ON-ROAD"), ]

# Remove scientific notation for emmission amount in plot
options(scipen = 100)

# Create Plot 5
g <- ggplot(baltimoreonroad, aes(factor(year), Emissions))
  g +
  geom_bar(stat = "identity", fill = "brown") +
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emissions (ton)")) + 
  ggtitle(expression("Total Motor Vehicle Related PM"[2.5]*" Emissions in Baltimore City"))

# Save file
dev.copy(png, file = "plot5.png", height = 480, width = 480)
dev.off()