# "Curse of dimensionality": a large set of features and fewer data points, 
# or we have data with very high feature vectors. In such scenarios, fitting 
# a model to the dataset results in lower predictive power of the model.

# Principal component analysis: dimensionality reduction technique.

library(pca)

data("crimtab") #load data
head(crimtab) #show sample data
dim(crimtab) #check dimensions
str(crimtab) #show structure of the data
sum(crimtab)
colnames(crimtab)

apply(crimtab,2,var) #check the variance accross the variables

pca = prcomp(crimtab) #applying principal component analysis on crimtab data
par(mar = rep(2, 4)) #plot to show variable importance
plot(pca)

# Changes the directions of the biplot, if we dont include the below two lines 
# the plot will be mirror image to the below one.'
pca$rotation <- -pca$rotation
pca$x <- -pca$x
biplot(pca, scale = 0) #plot pca components using biplot in r