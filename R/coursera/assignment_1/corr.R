corr <- function(directory, threshold = 0) {
    files_list <- list.files(directory, full.names = TRUE)
    
    complete <- complete(directory)
    ids_threshold <- complete[which(complete$nobs > threshold), 1]
    
    dat <- c()
    
    for(i in ids_threshold) {
        file <- read.csv(files_list[i])
        good <- complete.cases(file)
        file <- file[good,]
        dat <- append(dat, cor(file$sulfate, file$nitrate))
    }
    
    dat
}