# Generate synthetic data with a specified correlation structure
# The basic function for generating multivariate normal data is mvrnorm() (from the MASS package)

# Simulate a bivariate normal sample
library(MASS)

# Simulate bivatiate normal data
mu <- c(0,0) # mean
Sigma <- matrix(c(1, .5, .5, 1), 2) # covariance matrix 
# Sigma <- matrix(c(1, .1, .1, 1), 2)
# Covariance matrix: element in the i, j position is the covariance between the ith and jth elements of a random vector)

# Generate sample from N(mu, Sigma)
bivn <- mvrnorm(5000, mu = mu, Sigma = Sigma)
head(bivn)

# Calculate kernel density estimate
bivn.kde <- kde2d(bivn[, 1], bivn[, 2], n = 50)

# Overlay a contour plot on a heat map that maps the density of points to a gradient of colors
# Plots the irregular contours of the simulated data.
image(bivn.kde)
contour(bivn.kde, add = TRUE)

# Classic bivariate normal diagram
library(ellipse)

rho <- cor(bivn)
y_on_x <- lm(bivn[, 2] ~ bivn[, 1]) # regression Y ~ X
x_on_y <- lm(bivn[, 1] ~ bivn[, 2]) # regression X ~ Y
plot_legend <- c("99% CI green", "95% CI red", "90% CI blue",
                 "Y on X black", "X on Y brown")

plot(bivn, xlab = "X", ylab = "Y", col = "dark blue",
     main = "Bivariate Normal with Confidence Intervals")
lines(ellipse(rho), col = "red")
lines(ellipse(rho, level = .99), col = "green")
lines(ellipse(rho, level = .90), col = "blue")
abline(y_on_x)
abline(x_on_y, col = "brown")
legend(3, 1, legend = plot_legend, cex = .5, bty = "n")


# Three dimensional surface
# Basic perspective plot
persp(bivn.kde, phi = 45, theta = 30, shade = .1, border = NA)

# RGL interactive plot
library(rgl)
col2 <- heat.colors(length(bivn.kde$z))[rank(bivn.kde$z)]
persp3d(x = bivn.kde, col = col2)