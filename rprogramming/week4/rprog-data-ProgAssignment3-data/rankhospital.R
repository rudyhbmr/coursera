setwd("/Users/rudyhidayat/Documents/Github/coursera/rprogramming/week4/rprog-data-ProgAssignment3-data")

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", 
                   colClasses = "character")
  
  ## Check that state and outcome are valid
  if(!any(state == data$State)) {
    stop("invalid state")
  } else if(!any(outcome == c("heart attack", "heart failure", "pneumonia"))) {
    stop("invalid outcome")
  }  else if(is.numeric(num) == TRUE) {
      if(length(data[, 2]) < num) {
        stop("NA")
      }
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  data1 <- subset(data, State == state)
  
  if(outcome == "heart attack") {
    colnum <- 11
  } else if(outcome == "heart failure") {
    colnum <- 17
  } else {
    colnum <- 23
  }
  # set outcome rate column as numeric
  data1[,colnum] <- as.numeric(data1[, colnum])
  # order data1 based on outcome rate value
  data2 <- data1[order(data1[,colnum], data1[, 2]), ]
  # remove NA values from data2
  data3 <- data2[(!is.na(data2[, colnum])), ]
  
  if(num == "best") {
    num <- 1
  } else if(num == "worst") {
    num <- nrow(data3)
  } else {
    num = num
  }
  
  hospital <- data3[num, 2]
  hospital
}