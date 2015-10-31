data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# Returns a character vector with the name of the hospital that has 
# the ranking specified by the num argument
rankhospital <- function(state, outcome, num) {
    if (!state %in% data[, 7]) {
        stop("invalid state")
    }
    if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
        stop("invalid outcome")
    } 
    
    # Name, State, Heart Attack, Heart Failure, Pneumonia
    subset <-  data[data[, 7] == state, c(2, 7, 11, 17, 23)]
    
    if (outcome == "heart attack") {
        outcomeIndex <- 3
    } else if (outcome == "heart failure") {
        outcomeIndex <- 4
    } else if (outcome == "pneumonia") {
        outcomeIndex <- 5
    }
    
    ordered <- order(suppressWarnings(as.numeric(subset[, outcomeIndex])), subset[, 1], na.last = NA)
    if (num == "best") {
        num <- 1
    } else if (num == "worst") {
        num <- length(ordered)
    }
    return(subset[ordered[num], 1])
}

# rankhospital("TX", "heart failure", 4)
# rankhospital("MD", "heart attack", "worst")
# rankhospital("MN", "heart attack", 5000)