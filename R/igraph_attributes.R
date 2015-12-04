# weight as vertex attribute

set.edge.attribute()
get.edge.attribute(graph)
remove.edge.attribute()
list.edge.attributes(graph)
edge.attributes(graph)


g <- graph.ring(10)
g <- set.edge.attribute(g, "weight", value = runif(ecount(g)))
get.edge.attribute(g, "weight")

g <- add.edges(g, c(3, 4), attr = list("weight" = 10))

plot(g, edge.label = E(g)$weight)
plot(g, edge.width = E(g)$weight)


# or

g <- graph.star(10)
E(g)$weight <- runif(ecount(g))
E(g)$weight

# --
g <- make_empty_graph(n = 5) %>%
  add_edges(c(1,2, 2,3, 3,4, 4,5)) %>%
  set_edge_attr("color", value = "red") %>%
  add_edges(c(5,1), color = "green")
E(g)[[]]
plot(g)

# ---
g <- make_empty_graph(n = 5)
g <- add_edges(g, c(1, 2, 3, 4, 5, 1), distances = c(1, 2, 3))
plot(g, edge.label = E(g)$distances)


g <- graph.adjacency(matrix(0,2,2))
g <- add.edges(g, c(1,2), attr = list(width = 10))
plot(g)


adjm <- matrix(sample(0:1, 100, replace=TRUE, prob=c(0.9,0.1)), nc=10)
g1 <- graph_from_adjacency_matrix( adjm )
adjm <- matrix(sample(0:5, 100, replace=TRUE,
                      prob=c(0.9,0.02,0.02,0.02,0.02,0.02)), nc=10)
g2 <- graph_from_adjacency_matrix(adjm, weighted=TRUE)
E(g2)$weight


nzs <- function(x) sort(x [x!=0])
adjm <- matrix(runif(100), 10)
adjm[ adjm<0.5 ] <- 0
g3 <- graph_from_adjacency_matrix((adjm + t(adjm))/2, weighted=TRUE,
                                  mode="undirected")

g4 <- graph_from_adjacency_matrix(adjm, weighted=TRUE, mode="max")
all(nzs(pmax(adjm, t(adjm))[upper.tri(adjm)]) == sort(E(g4)$weight))