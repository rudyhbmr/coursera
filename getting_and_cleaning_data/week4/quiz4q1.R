setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week4")
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url = fileurl, destfile = "getdata.csv", method = "curl")

data <- read.csv("getdata.csv", header = TRUE, sep = ",")
list <- strsplit(names(data), split = "wgtp")
list[123]