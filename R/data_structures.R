# http://adv-r.had.co.nz/Data-structures.html

# Dimensionality    Homogeneous (content with the same type)   	Heterogeneous
# 1d 	              Atomic vector 	                            List
# 2d 	              Matrix                             	        Data frame
# nd 	              Array

# What are the three properties of a vector, other than its contents?
#   Type, length, and attributes
# What are the four common types of atomic vectors? What are the two rare types?
#   Common types: logical, integer, double (or numeric), and character. 
#   Two rarer types: complex and raw.
# What are attributes? How do you get them and set them?
#   Attributes allow you to associate arbitrary additional metadata to any object. 
#   You can get and set individual attributes with attr(x, "y") and attr(x, "y") <- value; 
#   or get and set all attributes at once with attributes().
# How is a list different from an atomic vector? How is a matrix different from a data frame?
#   The elements of a list can be any type (even a list); 
#   the elements of an atomic vector are all of the same type. 
#   Similarly, every element of a matrix must be the same type; 
#   in a data frame, the different columns can have different types.
# Can you have a list that is a matrix? Can a data frame have a column that is a matrix?
#   You can make “list-array” by assuming dimensions to a list. 
#   You can make a matrix a column of a data frame with df$x <- matrix(), or using I() when creating a new data frame data.frame(x = I(matrix())).

# Vectors: basic data structure
# Properties: typeof(), length(), attributes()

# Atomic vectors (created with c())
doubleVar <- c(1, 2.4, 4.5)
typeof(doubleVar)
length(doubleVar)
attributes(doubleVar)

intVar <- c(1L, 4L, 10L)
typeof(intVar)

logVar <- c(TRUE, FALSE, T, F)
typeof(logVar)

is.logical(logVar)
is.integer(intVar)

# coercion
str(c("a", 1))

# *** Lists ***
# Pode ser de qualquer tipo (diferentemente do atomic vector)

# vc pode usar list() ao invés de c()

x <- list(1:3, "a", c(TRUE, FALSE, TRUE, FALSE), c(1, 2, 3, 4, 5))
typeof(x)
str(x) # mostra a estrutura de um objeto R

# Uma lista pode conter outras listas e assim pode ser um vetor recursivo
y <- list(list(list(list())))
str(y)
is.recursive(y)

# coerção
j <- list(list(1, 2), c(3, 4))
k <- c(list(1, 2), c(3, 4))
str(j)
str(k)
j
k

typeof(j)
typeof(k)

c(1, FALSE)
c("a", 1)
c(list(1), "a")
c(TRUE, 1L)

# Atributos
# named list.. podem ser acessados individualmente com attr() ou tudo de uma vez com attributes()
y <- 1:10
y
typeof(y)
str(y)
attr(y, "atributo") <- "isso é um vetor"
attributes(y)

# alguns atributos são importantes.. não use attr(x, "names") ou "dim", etc.. use logo names(x), dim(x) ou class(x)
# nomear um vetor
x <- c(a = 1, b = 2, c = 3)
# ou usando o names()
x <- 1:3
names(x) <- c("a", "b", "c")
str(x)

# Factors
# é um uso importante para os atributos
# Um factor é um vetor que possui apenas valores pré definidos e é usada para guardar dados categóricos
# Factors são construídos em cima de vetores de inteiros usando o atributos class() "factor" que faz com que seu comportamento mude
# e levels() que define os valores permitidos
x <- factor(c("a", "b", "b", "a"))
# Levels: a b
class(x)
# "factor"
levels(x)
# "a" "b"

# não da para adicionar um valor que não está definido no factor
x[2] <- "d"
# o índice 2 fica um um NA


# Factor são úteis quando vc já sabe todos os valores possíveis que uma variável pode assumir
# ...

# Matrizes e arrays
# Adicionando o atributo dim() a um vetor atômico ele pode ser multidimensional.
# Com duas dimensões ele é uma matriz

a <- matrix(1:6, ncol = 3, nrow = 2)
b <- array(1:12, c(2, 3, 2))
c <- 1:16
dim(c) <- c(3, 2)

# Data frame
# Data frame é uma list com vetores de mesmo tamanho. 
# Tem duas dimensões e assim tem características de list e de matriz
df <- data.frame(x = 1:3, y = c("a", "b", "c"))
str(df) # transforma as strings em factor

# O data frame é uma lista de vetores então é possível ter uma coluna que é uma lista
df <- data.frame(x = 1:3)
df$y <- list(1:2, 1:3, 1:4)
df
str(df)
df[2,2]
# vetores de diferentes tamanhos

# "Colunas especiais"
# Uma vez que um data frame é na verdade uma lista de vetores é possível então que um data frame tenha uma coluna que é uma lista
df <- data.frame(x = 1:3)
df$y <- list(1:2, 1:3, 1:4)
df

# Entretanto, quando uma lista é dada ao data frame, ele tenta colocar cada item da lista em sua própria coluna:
data.frame(x = 1:3, y = list(1:2, 1:3, 1:4)) # erro: differing number of rows: 2, 3, 4
# Uma maneira de contornar isso é usar I(), fazendo o data frame tratar a lista como uma unidade:
dfl <- data.frame(x = 1:3, y = I(list(1:2, 1:3, 1:4)))
str(dfl)
dfl[2, "y"]

# Também é possível tem uma coluna no data frame que seja uma matriz desde que o numero de linhas coincida com as linhas do data frame
dfm <- data.frame(x = 1:3, y = I(matrix(1:9, nrow = 3)))
dfm


muMax <- 5
test <- list(1:3, 1:4)
str(test)
test[1,1]
test[1,2]
test[1,3]