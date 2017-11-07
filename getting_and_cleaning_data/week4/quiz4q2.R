setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week4")
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url = fileurl, destfile = "gdp.csv", method = "curl")

gdp <- read.csv("gdp.csv", sep = ",", skip = 4, nrows = 190)
cleanData <- gsub(",", "", gdp$X.4)
cleanData <- (as.numeric(cleanData))
mean(cleanData, na.rm = TRUE)

