# The str Function
# What is in this objetc?
# Alternative to summary
# Compactly display the contents of lists

str(str)
# function (object, ...)

f <- gl(40, 10)
str(f)
summary(f)

head(airquality)
str(airquality)

m <- matrix(rnorm(100), 10, 10)
str(m)

s <- split(airquality, airquality$Month)
str(s)


# -----------------------

a <- matrix(rnorm(100, 1, 0.25), ncol = 2)
b <- matrix(rnorm(100, 2, 0.25), ncol = 2)
c <- rbind(a, b)
plot(c)

# criar fator para cada um, uma terceira coluna talvez

# -----------------------
# Simulation ------
# rnorm, dnorm, pnorm, rpois

# d for density
# r for random number generation
# p for cumulative distribution
# q for quantile function

# Every distribution has these four types of functions

set.seed(1)

rpois(10, 1)

ppois(2, 2)

# Profiler
# 

hilbert <- function(n) {
    i <- 1:n
    1 / outer(i - 1, i, "+")
}

x <- hilbert(500)
system.time(svd(x))

set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)

