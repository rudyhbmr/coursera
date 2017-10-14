setwd("/Users/rudyhidayat/Documents/coursera/rprogramming/week2")
corr <- function(directory, threshold = 0) {
  # 'directory' is a character vector of length 1 indicating
  # the location of the CSV files
  
  # 'threshold' is a numeric vector of length 1 indicating the
  # number of completely observed observations (on all
  # variables) required to compute the correlation between
  # nitrate and sulfate; the default is 0
  
  # Return a numeric vector of correlations
  
  csv.files <- list.files(directory, full.names = TRUE)

  v <- vector(mode = 'numeric', length = 0)
  
  for(i in 1:length(csv.files)) {
    
    x <- read.csv(csv.files[i])
    y <- x[complete.cases(x),]
    nobs <- sum(complete.cases(x))
  
    if(nobs > threshold) {
      v <- c(v, cor(y[, "sulfate"], y[, "nitrate"]))
    }
  }
  return(v)
}