setwd("/Users/rudyhidayat/Documents/Github/coursera/rprogramming/week2")
complete <- function(directory, id = 1:332) {
  # 'directory' is a character vector of length 1 indicating
  # the location of the CSV files
  
  # 'id' is an integer vector indicating the monitor ID numbers
  # to be used
  
  # Return a data frame of the form:
  # id nobs
  # 1  117
  # 2  1041
  # ...
  # where 'id' is the monitor ID number and 'nobs' is the
  # number of complete cases
  csv.files <- list.files(directory, full.names = TRUE)
  
  z <- data.frame()
  
  for(i in id) {
    x <- read.csv(csv.files[i])
    nobs <- sum(complete.cases(x))
    y <- data.frame(i, nobs)
    z <- rbind(z,y)
  }
  colnames(z) <- c('id', 'nobs')
  return(z)
}