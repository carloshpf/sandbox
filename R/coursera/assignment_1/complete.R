complete <- function(directory, id = 1:332) {
    files_list <- list.files(directory, full.names = TRUE)
    
    dat <- data.frame()
    
    for(i in id) {
        file <- read.csv(files_list[i])
        complete_cases <- complete.cases(file)
        count <- length(complete_cases[which(complete_cases == TRUE)]) 
        dat <- rbind(dat, c(i, count))  
    }
    
    colnames(dat) <- c("id", "nobs")
    dat
}