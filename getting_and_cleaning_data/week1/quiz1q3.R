setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week1")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url = fileUrl1, destfile = "gov_NGAP.xlsx", method = "curl")

dateDownloaded <- date()
print(dateDownloaded)

library(xlsx)
dat <- read.xlsx(file="gov_NGAP.xlsx",
                 sheetIndex = 1, colIndex = 7:15, rowIndex = 18:23, header = TRUE)
head(dat)

sum(dat$Zip*dat$Ext, na.rm = TRUE)
