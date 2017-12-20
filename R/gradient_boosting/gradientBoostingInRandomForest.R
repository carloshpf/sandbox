library(randomForest)
library(gbm)
library(caret)
library(Ecdat)

data("Participation")

Participation$age <- Participation$age * 10
Participation$lnnlinc <- exp(Participation$lnnlinc) # not log

set.seed(502)
ind <- sample(2, nrow(Participation), replace = TRUE , prob = c(0.7, 0.3))
train <- Participation[ind == 1,]
test <- Participation[ind == 2,]

grid <- expand.grid(n.trees=seq(200, 500, by = 200), interaction.depth = seq(1, 3, by = 2),
                    shrinkage = seq(0.01, 0.09, by = 0.04), n.minobsinnode = seq(1, 5, by = 2))
control <- trainControl(method = "CV", number = 10)

set.seed(123)
gbm.lfp.train <- train(lfp~., data = train, method = 'gbm', trControl = control, tuneGrid = grid)
gbm.lfp.train

train$lfp <- ifelse(train$lfp == "no", 0, 1)
gbm.lfp <- gbm(lfp~., distribution = 'bernoulli', data = train, n.trees = 400, 
               interaction.depth = 1, shrinkage = 0.01, n.minobsinnode = 3)

summary(gbm.lfp)

gbm.lfp.test <- predict(gbm.lfp, newdata = test, type = 'response', n.trees = 400)

gbm.class <- ifelse(gbm.lfp.test < 0.5, 'no', 'yes')

table(gbm.class,test$lfp)
