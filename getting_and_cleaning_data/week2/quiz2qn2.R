setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week2")
library(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=fileUrl,destfile="acsdata.csv", method="curl")
acs <- read.csv("acsdata.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")