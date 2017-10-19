setwd("/Users/rudyhidayat/Documents/Github/coursera/rprogramming/week4/rprog-data-ProgAssignment3-data")

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data0 <- read.csv("outcome-of-care-measures.csv", 
                    colClasses = "character")
  valid_outcome <- c("heart attack", "heart failure", "pneumonia")
  states <- sort(unique(data0$State))
  state_len <- length(states)
  hospital <- rep("", state_len)
  
  ## Check that state and outcome are valid
  if(!any(outcome == c("heart attack", "heart failure", "pneumonia"))) {
  stop("invalid outcome")
}  else if(is.numeric(num) == TRUE) {
  if(length(data0[, 2]) < num) {
    stop("NA")
  }
}

  ## For each state, find the hospital of the given rank
  num_helper <- function(state_subset, col_num, num) {
    # get "attack", "failure" and "pneumonia" vector
    outcome_arr <- as.numeric(state_subset[, col_num])
    len <- dim(state_subset[!is.na(outcome_arr), ])[1]
    if (num == "best") {
      rank <- rank_helper(state_subset, outcome_arr, 1)
    } else if (num == "worst") {
      rank <- rank_helper(state_subset, outcome_arr, len)
    } else {
      rank <- rank_helper(state_subset, outcome_arr, num)
    }
    result <- rank
    return(result)
  }
  
  rank_helper <- function(state_subset, outcome_arr, num) {
    result <- state_subset[, 2][order(outcome_arr, state_subset[, 2])[num]]
    return(result)
  }
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  for(i in 1:state_len) {
    # loop for each state
    state_subset <- data0[data0[, 7]==states[i], ]
    if(outcome == "heart attack") {
      hospital[i] <- num_helper(state_subset, 11, num) 
    } else if (outcome == "heart failure") {
      hospital[i] <- num_helper(state_subset, 17, num) 
    } else {
      hospital[i] <- num_helper(state_subset, 23, num) 
    }
  }
  # create the data frame to return
  df <- data.frame(hospital = hospital, state = states)
  result <- df
  return(result)
}