setwd("/Users/rudyhidayat/Documents/Github/coursera/rprogramming/week2")
pollutantmean <- function(directory, pollutant, id = 1:332) {
  # 'directory' is a character vector of length 1 indicating
  # the location of the CSV files
  
  # 'pollutant' is a character vector of length 1 indicating
  # the name of the pollutant for which we will calculate the
  # mean; either "sulfate" or "nitrate".
  
  # 'id' is an integer vector indicating the monitor ID numbers
  # to be used
  
  # Return the mean of the pollutant across all monitors list
  # in the 'id' vector (ignoring NA values)
  csv.files <- list.files(directory, full.names = TRUE)
  z <- data.frame()
  for(i in id) {
    x <- read.csv(csv.files[i])
    z <- rbind(z,x)
  }
  return(mean(z[, pollutant], na.rm = TRUE))
}