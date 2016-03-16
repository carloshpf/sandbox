# http://www.r-bloggers.com/start-plotting-data

attach(mtcars)

# Exercice 1
# Plot Miles/(US) gallon versus Rear axle ratio by plot(mpg,drat) . On which axis does mpg appear?
# a. mpg appears on the x axis
# b. mpg appears on the y axis

plot(mpg, drat)
# x axis


# Exercise 2
# Is a scatterplot recommended for continuous or dichotomous variables?
# a. continuous
# b. dichotomous

# Continuous. Dichotomous plot with histogram


# Exercise 3
# Produce a histogram with hist(gear). What do you see?
# a. frequencies
# b. probability density

hist(gear)
# frequencies


# Exercise 4
# Change type of visualization of our scatterplot in Exercise 1 plot(mpg,drat,type=""). 
# If we want to see lines what we have to type into “”:
# a.type=”l”
# b.type=”p”

plot(mpg, drat, type = "l")


# Exercise 5
# Now we want to see both point and lines in our plot. What we have to type into
# plot(mpg,drat,type=""):
# a.type=c(“p”,”l”)
# b.type=”b”

plot(mpg, drat, type = "b")


# Exercise 6
# Add another variable to our plot, for example Weight. What command do we have to use:
# a.plot(mpg, drat); plot(mpg, wt)
# b.plot(mpg, drat); points(mpg, wt)
  
plot(mpg, drat)
points(mpg, wt)


# Exercise 7
# Now we have added a new variable to our plot. Suppose we want to use two different colours 
# to separate the points. Type plot(mpg, drat, col=2): What colour have we selected:
# a. red
# b. green

plot(mpg, drat, col = 2)
#red


# Exercise 8
# Now we want to differentiate the two different variables in the scatterplot:
# a. Let’s change the colours of the second plot
# b. Change use two different types of plot (e.g. points,lines)
 
plot(mpg, drat, col = 2)
points(mpg, wt, col = 3)


# Exercise 9
# Now we want to highlight a variable in the final plot.
# Type: plot(mpg, drat, lwd=2) ; points(mpg, wt, lwd=1). Which plot is highlighted:
# a. plot1 (mpg,drat)
# b. plot2 (mpg,wt)
 
plot(mpg, drat, lwd = 2)
points(mpg, wt, lwd = 1)
# plot1 (mpg, drat)


# Exercise 10
# Finally choose four different continuous variables from mtcars set and produce:
# a.Plot with lines and points for different variables with different colours 
# (hint: change y axis parameters by adding command ylim=c(0,30) to plot [e.g. plot(a,b,type="p",ylim=c(0,30)).
# b.Choose one variable from each and highlighted it set red colour and a broad line

plot(mpg, drat, col = 2, lwd = 2, ylim =c (0, 30))
points(mpg, wt, col = 3)
points(mpg, qsec, col = 4)
