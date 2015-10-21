# Week 3

# lapply
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)

# Vai passar para o runif os valores 1, 2, 3 e 4
x <- 1:4
lapply(x, runif)

# Se quiser passar os outros parâmetros da função
x <- 1:4
lapply(x, runif, min = 0, max = 10)

# anonymous function - extract the first column
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(x, function(elt) elt[,1])