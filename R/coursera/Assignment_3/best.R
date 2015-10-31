data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# Returns a character vector with  the  name  of  the  hospital  that  has  
# the  best  (i.e.   lowest)  30-day  mortality  for  the  specified  outcome
# in that state
best <- function(state, outcome) {
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
        
    # as.numeric will force a coercion of "Not Available" to NA.
    # order() by default puts NA in the end.
    ordered <- order(suppressWarnings(as.numeric(subset[, outcomeIndex])), subset[, 1])
    return(subset[ordered[1], 1])
}

# best("TX", "heart attack")
# best("TX", "heart failure")
# best("MD", "heart attack")
# best("MD", "pneumonia")
# best("BB", "heart attack")
# best("NY", "hert attack")