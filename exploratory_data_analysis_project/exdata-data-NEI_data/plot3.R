# Question 3
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
## Which have seen increases in emmissions from 1999 to 2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

setwd("~/Documents/Github/coursera/exploratory_data_analysis_project/exdata-data-NEI_data")

library(ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get total emissions by year in Baltimore City, Maryland
baltimore <- subset(NEI, fips == "24510")
baltimoretype <- aggregate(Emissions ~ type + year, baltimore, sum)


# Create Plot 3
g <- ggplot(baltimoretype, aes(factor(year), Emissions, fill = type))
  g +
  geom_bar(stat = "identity") +
  facet_grid(.~type, scales = "free", space = "free") + 
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emissions (ton)")) + 
  ggtitle(expression("Total PM"[2.5]*" Emissions in Baltimore City, Maryland by Source Type"))

# Save file
dev.copy(png, file = "plot3.png")
dev.off()