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

# Se houver empate, podemos definir um parâmetro a mais
sortBycolumn <- function(data, column1, column2) {
  orderData <- data[order(data[, column1], data[, column2]), ]
  return(orderData)
}

# Na coluna 2 há o empata China China, USA USA e UK UK
sortByColumn(data, 2, 3)

# Manage NA
data <- read.csv("citiesNA.csv")

# Fazer um subset pela coluna 2 nos da um fator de 3 níveis
data[, 2]
#[1] China China USA   USA   UK    UK   
#Levels: China UK USA

# A função levels() nos retorna um vetor com os níveis
levels(data[, 2])

# Podemos pegar o conteúdo
levels(data[, 2])[data[, 2]]

# data[, 2] retornaria o mesmo, mas não seria um vetor
# poderia usar as.vector(data[, 2])
identical(as.vector(data[, 2]), levels(data[, 2])[data[, 2]])
# TRUE

# Força uma coerção do vetor para numeric fazendo o Unknown ser NA
# complete.cases() retorna os índices das linhas que não possuem NA
# Um subset com esses índice retorna um data.frame com os casos completos
sortByColumnNA <- function(data, column) {
  for (i in 3:4) {
    data[, i] <- suppressWarnings(as.numeric(levels(data[, i])[data[, i]]))
  }
  orderData <- data[order(data[, column]), ]
  orderData <- orderData[complete.cases(orderData), ]
  return(orderData)
}

# Apagar linha de um data frame
data2 <- data[-c(3, 4), ]
# Ou passar um vetor booleano
rowToKeep <- c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE)
data3 <- data[rowToKeep, ]

# Order only a specific subset of a data frame
data <- read.csv("cities.csv")
