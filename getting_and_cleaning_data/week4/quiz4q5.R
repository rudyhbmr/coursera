library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

year2012 <- grepl('2012-*', sampleTimes)
sampleTimes2012 <- subset(sampleTimes, year2012)
day <- format(sampleTimes2012, '%A')
table(year2012)
table(day)
