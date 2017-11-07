setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week3")
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url = file_url, destfile = "getdata_q1.csv", method = "curl")

data <- read.csv("getdata_q1.csv", header = TRUE, sep = ",")
head(data)

agricultureLogical <- data$ACR == 3 & data$AGS == 6
head(which(agricultureLogical), 3)