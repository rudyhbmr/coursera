setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week1")
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url = fileUrl3, destfile = "fsspid.csv", method="curl")
dateDownloaded <- date()
print(dateDownloaded)

