setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week3")

file_url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file_url3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(file_url2, destfile = "gdp.csv", method = "curl")
download.file(file_url3, destfile = "country.csv", method = "curl")

gdp <- read.csv("gdp.csv", header = TRUE, skip = 3, sep = ",")
edu <- read.csv("country.csv", header = TRUE)

library(data.table)
library(dplyr)
gdp <- fread("GDP.csv", skip = 4, nrows = 190, select = c(1, 2, 4, 5), 
             col.names = c("CountryCode", "Rank", "Economy", "Total"))
edu <- fread("country.csv")
View(gdp)
View(edu)
merge <- merge(gdp, edu, by = 'CountryCode')
nrow(merge)
View(merge)
arrange(merge, desc(Rank))[13, "Economy"]

tapply(merge$Rank, merge$`Income Group`, mean)

merge$RankGroups <- cut(merge$Rank, breaks = 5)
table(merge$RankGroups, merge$`Income Group`)
