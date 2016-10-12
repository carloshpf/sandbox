# Exercise 1
# 1. Set seed with value 1235
# 2. Create a Bernoulli sample of 100 ‘fair coin’ flippings.
# Populate a variable called fair_coin with the sample results.
set.seed(1235)
fair_coin <- sample(c(0,1), 100, replace = TRUE)
