# Question 1
# mean of 'Sepal.Length' for the species virginica
x <- split(iris, iris$Species)
mean(x$virginica$Sepal.Length)

# R code returns a vector of the means of the variables 
#   'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'
apply(iris[, 1:4], 2, mean)

# average miles per gallon (mpg) by number of cylinders in the car (cyl)
tapply(mtcars$mpg, mtcars$cyl, mean)

# absolute difference between the average horsepower of 
#   4-cylinder cars and the average horsepower of 8-cylinder cars
x <- split(mtcars, mtcars$cyl)
abs(mean(x$`4`$hp) - mean(x$`8`$hp))
