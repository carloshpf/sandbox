# "boosting" / improving model performance
# first. Develop an initial model (base learner) using any algorithm
# Gradient boosting looks at the error and create a *second model* using a *loss function*
# loss function: difference between the current accuracy and the desired prediction

# Goal: predict a house's price

library(caret)
library(gbm)
library(corrplot)