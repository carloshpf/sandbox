# Clustering
d <- dist(as.matrix(mtcars))
hc <- hclust(d)
plot(hc)
plot(hc, hang = -1)

x <- identify(hc)

hcd <- as.dendrogram(hc)
plot(hcd)

class(hcd)
# "dendrogram"

# ------

distIris <- dist(iris)
hcIris <- hclust(distIris, method = "complete")
plot(hcIris)

# ------

library(tree)
tree1 <- tree(Species ~ Sepal.Width + Petal.Width, data = iris)
summary(tree1)

plot(tree1)
text(tree1)

plot(iris$Petal.Width, iris$Sepal.Width, pch = 19, col = as.numeric(iris$Species))
partition.tree(tree1, label = "Species", add = TRUE)
legend(1.75, 4.5, legend = unique(iris$Species), col = unique(as.numeric(iris$Species)), pch = 19)

graph <- qplot(Petal.Width, Sepal.Width, data = iris, colour = Species, size = I(4))
graph + geom_hline(aes(yintercept = 2.65)) + geom_vline(aes(xintercept = 0.8)) + 
    geom_vline(aes(xintercept = 1.75)) + geom_vline(aes(xintercept = 1.35))

# ------

a <- list()
# negative numbers are leaves
# positive numbers are merged clusters (defined by row number in $merge)
a$merge <- matrix(c(-1:-4, 1, 2), ncol = 2, byrow = TRUE)
#       [,1] [,2]
# [1,]   -1   -2
# [2,]   -3   -4
# [3,]    1    2
a$height <- c(1, 1.5, 3)
a$order <- 1:4
a$labels <- LETTERS[1:4]
class(a) <- "hclust"
plot(a)

ad <- as.dendrogram(a)
plot(ad)

# ------

# Newick tree format

#(B, (A, C, E), D);
# The tree ends with a semicolon.

# branch lengths can be incorporated into a tree by putting a real number, with or without
# decimal point, after a node and preceded by a colon.
# this represents the length of the branch immediately below that node.
# (B:6.0,(A:5.0,C:3.0,E:4.0):5.0,D:11.0); 


# -----

library("ape")

# Make sure that the distance from the root to each tip is the same
# Make the tree non-ultrametric and as.hclust.phylo will raise an error
##  ultrametric tree is a tree in which the distances from the root to every branch tip are equal

tree <- read.tree(text='(((A:4.2,B:4.2):3.1,C:7.3):6.3,D:13.6);')
hc <- as.hclust.phylo(tree)
plot(hc)

is.ultrametric(tree)

tree <- read.tree(text = " ((raccoon:19.19959,bear:6.80041):0.84600,
                  ((sea_lion:11.99700, seal:12.00300):7.52973,
                  ((monkey:100.85930,cat:47.14069):20.59201, 
                  weasel:18.87953):2.09460):3.87382,dog:25.46154);")
dendrogram <- chronos(tree)
plot(dendrogram)

# -----

# Converte a data frame to tree structure

dataTree <- data.frame(x = c('A', 'A', 'B', 'B', 'B'), 
                       y = c('AB', 'AC', 'BA', 'BA', 'BD'), 
                       z = c('ABB', 'ACC', 'BAD', 'BAE', 'BDD'))

#       |---AB-------ABB
#   A---|
#   |   |---AC-------ACC
# --|             /--BAD
#   |   |---BA---|
#   B---|         \--BAE
#       |---BB-------BDD

test <- do.call(rbind, strsplit(as.character(dataTree[, ncol(dataTree)]), split = ""))
# http://stackoverflow.com/questions/15343338/how-to-convert-a-data-frame-to-tree-structure-object-such-as-dendrogram
# http://stackoverflow.com/questions/17024626/create-tree-diagram?lq=1
# http://stackoverflow.com/questions/2310913/how-do-i-manually-create-a-dendrogram-or-hclust-object-in-r?rq=1
