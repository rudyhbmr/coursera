setwd("/Users/rudyhidayat/Documents/Github/coursera/getting_and_cleaning_data/week3")

library(jpeg)
file_url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url = file_url1, destfile = "jeff.jpg", method = "curl")
jpg <- readJPEG("jeff.jpg", native = TRUE)
quantile(jpg, probs = c(0.3, 0.8))