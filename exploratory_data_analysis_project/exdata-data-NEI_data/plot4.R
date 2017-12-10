# Question 4
## Across the United States, how have emissions from coal combustion-related sources 
## changed from 1999–2008?

setwd("~/Documents/Github/coursera/exploratory_data_analysis_project/exdata-data-NEI_data")

library(ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset SCC data related to coal-combustion
SCCcoal <- SCC[grepl("Coal", SCC$Short.Name), ]

# Get NEI data with relevent SCC related to coal-combustion
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC, ]

# Remove scientific notation for emmission amount in plot
options(scipen = 100)

# Create Plot 4
g <- ggplot(NEIcoal, aes(factor(year), Emissions))
  g +
  geom_bar(stat = "identity", fill = "orange") +
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emissions (ton)")) + 
  ggtitle(expression("Total Coal Related PM"[2.5]*" Emissions in the United States"))

# Save file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()