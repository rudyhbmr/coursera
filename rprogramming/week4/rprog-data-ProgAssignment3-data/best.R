setwd("/Users/rudyhidayat/Documents/Github/coursera/rprogramming/week4/rprog-data-ProgAssignment3-data")

best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", 
                   colClasses = "character")
  
  ## Check that state and outcome are valid
  if(!any(state == data$State)) {
    stop("invalid state")
  } else if(!any(outcome == c("heart attack", "heart failure", "pneumonia"))) {
    stop("invalid outcome")
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
  
  data2 <-  which(as.numeric(data1[, colnum]) == 
                    min(as.numeric(data1[,colnum]), na.rm = TRUE))
  hospital <- sort(data1[data2, 2])
  hospital
}