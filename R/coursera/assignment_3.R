setwd("C:/Users/carlos/Repo/sandbox/R/coursera/")

download.file("https://github.com/DanieleP/PA3-tutorial/raw/master/cities.csv", destfile = "cities.csv", method = "curl")
download.file("https://github.com/DanieleP/PA3-tutorial/raw/master/citiesNA.csv", destfile = "citiesNA.csv", method = "curl")

dir()


data <- read.csv("cities.csv")

# Order a data frame by the values in its columns

# Retorna os indices ordenados da primeira coluna
order(data[, 1])

# Faz um subset de data usando os indices retornados por order
data[order(data[, 1]), ]
# O subset funciona assim:
data[c(3, 5), ]
# cities countries areakm2 populationk
# 3    NYC       USA    1214        8406
# 5 London        UK    1737        9789

sortByColumn <- function(data, column) {
  orderData <- data[order(data[, column]), ]
  return(orderData)
}



