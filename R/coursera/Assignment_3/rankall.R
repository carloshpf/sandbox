source("rankhospital.R")

data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# Returns a 2-column data frame containing the hospital in each state 
# that has the ranking specified in num
rankall <- function(outcome, num = "best") {
    if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
        stop("invalid outcome")
    }
    
    # Name, State, Heart Attack, Heart Failure, Pneumonia
    subset <-  data[, c(2, 7, 11, 17, 23)]
    
    if (outcome == "heart attack") {
        outcomeIndex <- 3
    } else if (outcome == "heart failure") {
        outcomeIndex <- 4
    } else if (outcome == "pneumonia") {
        outcomeIndex <- 5
    }
    
    states <- unique(subset[, 2])
    hospitals <- c()
    
    for (i in states) {
        hospital <- rankhospital(i, outcome, num)
        hospitals <- c(hospitals, hospital)
    }
    
    result <- as.data.frame(cbind(hospitals, states))
    rownames(result) <- states
    colnames(result) <- c("hospital", "state")
    return(result[order(result[, 2]), ])
}

# head(rankall("heart attack", 20), 10)
# tail(rankall("pneumonia", "worst"), 3)
# tail(rankall("heart failure"), 10)