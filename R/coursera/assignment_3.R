download.file("https://github.com/DanieleP/PA3-tutorial/raw/master/cities.csv", destfile = "cities.csv", method = "curl")
download.file("https://github.com/DanieleP/PA3-tutorial/raw/master/citiesNA.csv", destfile = "citiesNA.csv", method = "curl")

dir()

data <- read.csv("cities.csv")

# Order a data frame by the values in its columns
