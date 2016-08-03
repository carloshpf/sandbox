# Linear Discriminant Analysis (LDA)

require(MASS)

result <- lda(formula = Species ~ ., data = iris, prior = c(1, 1, 1) / 3, CV = TRUE)
# The "." means that we use all the remaining values in data as covariates.
# prior sets the prior probabilities of class membership.


# Using LDA to classify data


# Trainning set
train <- sample(1:150, 75)

# Calculate LDA for the full set
result <- lda(Species ~ ., data = iris, prior = c(1, 1, 1) / 3)

# Calculate LDA for the trainning set
resultTrainning <- lda(Species ~ ., data = iris, prior = c(1, 1, 1) / 3, subset = train)

# Predictions
predictionsLDA <- predict(object = result, newdata = iris[-train, ])

predictionsLDA$class



vectors <- read.csv("~/Programming/masters/data/Polipos/vectors_todos.csv")
vectorsCancerNaoCancer <- subset(vectors, select = -c(name, class1))
vectorsTodasAtipias <- subset(vectors, select = -c(name, class2))

result2 <- lda(formula = class2 ~ ., data = vectorsCancerNaoCancer, CV = TRUE)
# prior = c(6, 18) / 24)