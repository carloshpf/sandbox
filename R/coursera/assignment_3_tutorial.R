download.file("https://github.com/DanieleP/PA3-tutorial/raw/master/cities.csv", destfile = "cities.csv", method = "curl")
download.file("https://github.com/DanieleP/PA3-tutorial/raw/master/citiesNA.csv", destfile = "citiesNA.csv", method = "curl")

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

# grep acha a string "China" no factor data$countries e retorna os índices
grep("China", data$countries)
# Retorna linha 1 e 2
# 1 2

# Podemos fazer um subset usando esses índices
data[grep("China", data$countries), ]

sortCountry <- function(data, country, column) {
    countryData <- data[grep(country, data$countries), ]
    orderData <- countryData[order(countryData[, column]), ]
    return(orderData)
}

# Return a specific ranking after ordering
# We want to know what's the second biggest city in our UK database. 
# Na função order(), o argumento decreasing = TRUE retorna do maior para o menor
# as.character() retorna o vetor com o nome da cidade, se usar orderData[rank, 1] vai retorna um factor

findCityRank <- function(data, column, rank) {
    orderData <- data[order(decreasing = TRUE, data[, column]), ]
    return(as.character(orderData[rank, 1]))
}

# Achar o índice da última cidade
findLastCity <- function(data, column) {
    orderData <- data[order(decreasing = TRUE, data[, column]), ]
    return(as.character(orderData[nrow(orderData), 1]))
}
# > findLastCity(data, 3)
# [1] "Manchester"
# > findLastCity(data, 1)
# [1] "Beijing"

# Return a data frame os specific rankings for each subset
# A data frame with the second city by size of each country.
rankByCountry <- function(data, column, rank) {
    # colocamos os "levels" da colunas 2 (countries) em um vetor
    countries <- levels(data[, 2])
    # instancia um vetor que irá armazenar a saída
    output <- vector()
    # Um loop para pegar os dados de cada cidade. length(countries) é o nro de países (diferentes)
    for (i in 1:length(countries)) {
        # Faz um subset considerando country
        countryData <- data[grep(countries[i], data$countries), ]
        orderData <- countryData[order(decreasing = TRUE, countryData[, column]), ]
        # append() adiciona um elemento no final do vetor
        # Vamos adicionar o nome da cidade [rank, 1], a área [rank, 2] e a população [rank, 3]
        output <- append(output, as.character(orderData[rank, 1]))
        for (l in 3:4) {
            output <- append(output, as.character(orderData[rank, l]))
        }
    }
    # É mais simples criar uma matriz que um data frame. Agora é preciso converter
    output <- as.data.frame(matrix(output, length(countries), 3, byrow = TRUE))
    # Nome das colunas será "cities", "areakm2", "populationk".
    # Noma das linhas será os nomes em coutries
    colnames(output) <- c("cities", "areakm2", "populationk")
    rownames(output) <- countries
    return(output)
}

# Assignment 3 ---------------------------------------------------------------------
datasetUrl <- "https://d396qusza40orc.cloudfront.net/rprog/data/ProgAssignment3-data.zip"
download.file(datasetUrl, "ProgAssignment3-data.zip")
unzip("ProgAssignment3-data.zip", exdir = "./Assignment3")