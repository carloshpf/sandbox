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

# sapply - simplifica a saída quando possível (ao invés de sempre retornar list)
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean) # retorna uma list
sapply(x, mean) # retorna um vector

# apply(X, MARGIN, FUN, ...)
x <- matrix(rnorm(200), 20, 10)
# MARGIN, for a matrix, 1 indicates rows, 2 indicates columns, c(1, 2) rows and columns
apply(x, 2, mean)
apply(x, 1, sum)

apply(x, 1, quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
# Pega somente a primeira e segunda dimensão e "colapsa" a terceira
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)

# mapply(FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
# ou posso fazer, a função rep, primeiro argumento de 1 a 4 e segundo argumento de 4 a 1
# ou seja: (1,4), (2,3), (3,2) e (4,1)
mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}

noise(5, 1, 2)

# se quisesse com mais, assim estaria errado
noise(1:5, 1:5, 2)
# e assim, cada vez ele passa 1, 1, 2 depois 2, 2, 2 etc.
mapply(noise, 1:5, 1:5, 2)
# no caso mapply pode ser usado para funções que não aceitam vector como parêmetro

# tapply(X, INDEX, FUN = NULL, ..., simplify = TRUE)
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
tapply(x, f, mean)
tapply(x, f, range)

# split(x, f, drop = FALSE, ...)
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

# Assim, temos as duas opções
lapply(split(x, f), mean)
tapply(x, f, mean)

# Tecnicamento o month não é um factor, mas pode ser usado como um
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

