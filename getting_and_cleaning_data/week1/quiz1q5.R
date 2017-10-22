setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week1")
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url = fileUrl3, destfile = "fsspid.csv", method="curl")
dateDownloaded <- date()
print(dateDownloaded)

library(data.table)
DT <- fread(input="fsspid.csv", sep=",")

system.time(DT[, mean(pwgtp15), by = SEX])
system.time(tapply(DT$pwgtp15, DT$SEX, mean))
system.time(mean(DT$pwgtp15, by = DT$SEX))
system.time(rowMeans(DT)[DT$SEX==1]) + system.time(rowMeans(DT)[DT$SEX==2])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2, ]$pwgtp15))