# "boosting" / improving model performance
# first. Develop an initial model (base learner) using any algorithm
# Gradient boosting looks at the error and create a *second model* using a *loss function*
# loss function: difference between the current accuracy and the desired prediction

# Goal: predict a house's price

library(caret)
library(gbm)
library(corrplot)

# load the data
data("Sacramento")

# Correlations (only numeric)
corrplot(cor(Sacramento[, -c(1, 2, 6)]), method = "number")

# Remove city, zip, latitude and longitude
sacramentoClean <- Sacramento[, -c(1, 2, 8, 9)]

# Divide the dataset in 0.7/0.3
set.seed(1)
ind <- sample(2, nrow(sacramentoClean), replace = TRUE, prob = c(0.7, 0.3))

# Trainning set
train <- sacramentoClean[ind == 1,]

# Test set
test <- sacramentoClean[ind ==2,]

# create a df from all possible combinations of the vectors provided (grid)
# n.trees: how many trees gradient boosting will make
# interaction.depth: number of splits
# shrinkage: the contribution of each tree
# n.minobsinnode
grid <- expand.grid(n.trees = seq(100, 500, by = 200), interaction.depth = seq(1, 4, by = 1),
                     shrinkage = c(.001, .01, .1), n.minobsinnode = 10)

# Set the type of cross-validation
control <- trainControl(method = "CV")

# Train the model
gbmTrain <- train(price~.,data = train, method='gbm', trControl = control, tuneGrid = grid)
gbmTrain

# Result: The final values used for the model were n.trees = 100, interaction.depth = 1, shrinkage = 0.1 and n.minobsinnode = 10.
gbmPrice <- gbm(price~., data = train, n.trees = 100, interaction.depth = 1,
               shrinkage = 0.1, distribution = 'gaussian')

# Test
gbmTest <- predict(gbmPrice, newdata = test, n.trees = 100)
gbmResid <- gbmTest - test$price
mean(gbmResid^2)

plot(gbmTest, test$price)
