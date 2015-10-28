a <- 1
b <- 2

f <- function(x) {
    a * x + b
}

g <- function(x) {
    a <- 2
    b <- 1
    f(x)
}

g(2)

# Dynamic scope
# Use the version of the variable that is in scope at the time that the function was called
# 5

# Lexical scope
# Use the version that is “in scope” in the enclosing piece of code 
#   f() foi definido em um ambiente global (global environment)
#   g() have no impact on the global bindings, not relevant to the evaluation of f()
# 4

a <- 1
b <- 2

f <- function(a, b) {
    return( function(x) {
        a * x + b
    })
}

g <- f(2, 1)
g(2) # function closure

# 5
# function g() is created inside f(), and so it is the variable bindings in scope within f() 
#   at the time g() was created which matter

a <- 10

f <- function(x) {
    if(rbinom(1, 1, 0.5)) {
        a = 1000
    }
    return(a * x)
}

# f(3) could be 30 or 3000 (the definition of the function is dynamic)



a <- 1

f <- function(x) {
    function() {
        x
    }
}

f2 <- f(a)
#f2()

a <- 2
f2()

# --

a <- 3
b <- 3
x <- 1:5

fn1 <- function(x, a, b) {
    a + b + x
}

fn2 <- function(x) {
    a + b + x
}

fn1(x, a, b)
fn2(x)

# Avoid globals by using ** closure **
make.fn2 <- function(a, b) {
    fn2 <- function(x) {
        return(x + a + b)
    }
    return(fn2)
}

a <- 2
b <- 3

fn2.1 <- make.fn2(a, b)
fn2.1(3) # 8

a <- 4
fn2.2 <- make.fn2(a, b)
fn2.2(3) # 10


