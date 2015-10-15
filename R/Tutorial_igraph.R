# Tutorial do igraph

# *** graph_from_edgelist(el, directed = TRUE) ***
# Cria um grafo a partir de uma edge list
#   A edge list é uma matriz com duas colunas e cada linha define uma aresta
# Se for numérico, os valores representam o id do vértice, se for caracter será
#   o nome do vértice um id será atribuido. Um atributo name será adicionado

# Cria uma edge list
# Vetor, duas colunas
edgelist <- matrix(c("foo", "bar", "bar", "foobar"), ncol = 2)

# Cria grafo
g <- graph_from_edgelist(edgelist)
plot(g)


# *** graph_from_data_frame(d, directed = TRUE, vertices = NULL) ***
# Cria um grafo a partir de um ou dois data frames contendo a edge list
#   e outros atributos (as colunas adicionais são consideradas atributos)
# d é o data frame contendo a edge list nas primeiras duas colunas, sendo as
#   demais colunas atributos adicionais
# Se o parâmetro vertices for NULL, as primeiras duas colunas serão usadas como 
#   uma edge list.
# Se o parâmetro vertices não for NULL, então ele deve passar um data frame com
#   metadados do vértice. A primeira coluna é o nome do vértice e as outras
#   colunas serão atributos adicionais. Ou seja, se não é nulo, d só conterá
#   nomes listados no parametro vertices.

# Cria um data frame (normalmente são tabelas lidas de arquivos)
actors <- data.frame(name = c("Alice", "Bob", "Cecil", "David", "Esmeralda"), 
                     age = c(48, 33, 45, 34, 21), 
                     gender = c("F", "M", "F", "M", "F"))

relations <- data.frame(from=c("Bob", "Cecil", "Cecil", "David", "David", "Esmeralda"),
                        to=c("Alice", "Bob", "Alice", "Alice", "Bob", "Alice"),
                        same.dept=c(FALSE,FALSE,TRUE,FALSE,FALSE,TRUE),
                        friendship=c(4,5,5,2,1,1), 
                        advice=c(4,5,5,4,2,3))

g <- graph_from_data_frame(relations, vertices = actors)

# *** graph_from_adjacency_matrix(adjmatrix, mode = c("directed", "undirected",
#   "max", "min", "upper", "lower", "plus"), weighted = NULL, diag = TRUE,
#   add.colnames = NULL, add.rownames = NA) ***

# O primeiro parâmetro é uma matriz de adjacência quadrada.
# mode diz como essa matriz deve ser interpretada
# weighted se é para criar um grafo com pesos a partir da matriz. Se for nulo,
#   o valor contido na matriz é o número de arestas entre os nós. Se for um 
#   caracter, então para cada entrada não zero na matriz uma aresta é criada
#   e é adicionado um atributo com o weighted

# Criando uma matriz de adjacência
adjm <- 