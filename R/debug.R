newFunction <- function(string) {
    print(aNonExistingVariable)
}

myFunction <- function(a, b) {
    c <- 2 * a
    d <- 5 * b
    return(2 * c + newFunction(d))
}

# Debug 
#   traceback()

myFunction(2, 3)
traceback()

#   debug()
debug(myFunction)
myFunction(2, 3)
# Keep pressing enter, it will execute each line at once
# to stop:
undebug(myFunction)

#   browser()

myFunction <- function(a, b) {
    browser()
    c <- 2 * a
    d <- 5 * b
    return(2 * c + newFunction(d))
}
myFunction(2, 3)

# You can see what is in the environment (press ls(), or the variable name)
