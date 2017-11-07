setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week4")
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url = fileurl, destfile = "edu.csv", method = "curl")

gdpdata <- read.csv("GDP.csv", skip = 4, nrows = 190)
edudata <- read.csv("edu.csv")

mergeData <- merge(gdpdata, edudata, by.x = "X", by.y = "CountryCode")
View(mergeData)
june <- grep('Fiscal year end: June', mergeData$Special.Notes)
length(june)