# The state of art tool in image classification is Convolutional Neural Network (CNN)
# Simple Neural Network with 2 layers (fully connected)

# Create a spiral dataset with 4 classes and 200 examples each
library(ggplot2)
library(caret)

numberOfPoints <- 200
dimensionality <- 2
numberOfClasses <- 4
x <- data.frame() # data matrix (each row is a single example)
y <- data.frame() # class labels

set.seed(308)

for (j in (1:numberOfClasses)) {
  radius <- seq(0.05, 1, length.out = numberOfPoints)
  theta <- seq((j - 1) * 4.7, j * 4.7, length.out = numberOfPoints) + rnorm(numberOfPoints, sd = 0.3)
  xTemp <- data.frame(x = radius * sin(theta), y = radius * cos(theta))
  yTemp <- data.frame(matrix(j, numberOfPoints, 1))
  x <- rbind(x, xTemp)
  y <- rbind(y, yTemp)
}

data <- cbind(x, y)
colnames(data) <- c(colnames(x), 'label')

# x, y are 800 by 2 and 800 by 1 data frames respectively, and they are created in a way
# such that a linear classifier cannot separete them. 

xMin <- min(x[, 1]) - 0.2
xMax <- max(x[, 1]) + 0.2
yMin <- min(x[, 2]) - 0.2
yMax <- max(x[, 2]) + 0.2


ggplot(data) + geom_point(aes(x=x, y=y, color = as.character(label)), size = 2) + theme_bw(base_size = 15) +
  xlim(xMin, xMax) + ylim(yMin, yMax) +
  ggtitle('Spiral Data Visulization') +
  coord_fixed(ratio = 0.8) +
  theme(axis.ticks=element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
        axis.text=element_blank(), axis.title=element_blank(), legend.position = 'none')