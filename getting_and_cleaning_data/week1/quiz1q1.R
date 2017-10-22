setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url = fileUrl, destfile = "idaho_housing.csv", method="curl")
list.files(".")

dateDownloaded <- date()
dateDownloaded

idaho_housing <- read.csv("idaho_housing.csv")
head(idaho_housing)

length(idaho_housing$VAL[!is.na(idaho_housing$VAL) & idaho_housing$VAL==24])