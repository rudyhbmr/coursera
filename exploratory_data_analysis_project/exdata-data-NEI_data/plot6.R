# Question 6
## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips=="06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

setwd("~/Documents/Github/coursera/exploratory_data_analysis_project/exdata-data-NEI_data")

library(ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data for Baltimore City and Los Angeles County and type: ON-ROAD
balandLAConroad <- NEI[(NEI$fips == "24510"|NEI$fips == "06037") & (NEI$type == "ON-ROAD"), ]

# Aggregate data and give name to fips
totalbalandLAConroad <- aggregate(Emissions ~ year + fips, balandLAConroad, sum)
totalbalandLAConroad$fips[totalbalandLAConroad$fips == "24510"] <- "Baltimore City, MD"
totalbalandLAConroad$fips[totalbalandLAConroad$fips == "06037"] <- "Los Angeles County, CA"

# Remove scientific notation for emmission amount in plot
options(scipen = 100)

# Create Plot 6
g <- ggplot(totalbalandLAConroad, aes(factor(year), Emissions, fill = fips))
  g +
  geom_bar(stat = "identity") +
  facet_grid(.~fips, scales = "free", space = "free") + 
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emissions (ton)")) + 
  ggtitle(expression("Total Motor Vehicle Related PM"[2.5]*" Emissions"))

# Save file
dev.copy(png, file = "plot6.png", height = 480, width = 480)
dev.off()