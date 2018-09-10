# Two artificial vectors containing 1000 random samples:
# - from a gaussian variable with mean 0 and standard deviation 1
# - from the square of a gaussian variable with mean 10 and standard deviation
#   3
# The values are ordered to stablish a relationship between
# pair of values of the two vectors.
varx <- rnorm(1000)
varx <- sort(varx)
vary <- (rnorm(1000, mean=10, sd=3))^2
vary <- sort(vary)

# Definition of a function to have an overview of the data.
source("eda.shape.r")

# Overview of both vectors.
eda.shape(varx)
eda.shape(vary)
# We apply the default value of one plot per page.
par(mfrow=c(1, 1))

# Scatter plot to have and idea of the possible relation between both
# variables.
# Linear correlation coefficient between both variables.
# We do that for the original variables, and also transforming one of
# them (taking the square root).
plot(varx, vary)
cor(varx, vary)
plot(varx, sqrt(vary))
cor(varx, sqrt(vary))

# We obtain a linear model to predict vary from varx.
# The model obtained is shown (parameters and plots).
mod1 <- lm(vary ~ varx)
summary(mod1)
plot(varx, vary)
abline(mod1, col="red")
plot(mod1)

# Another model is obtained to predict the square root of vary from varx.
# This model is also shown (parameters and plots)
mod2 <- lm(sqrt(vary) ~ varx)
summary(mod2)
plot(varx, sqrt(vary))
abline(mod2, col="red")
plot(mod2)

# This way, vary values can be predicted from varx values using both models.
predict.lm(mod1, newdata=data.frame(varx=c(-2, -1, 0, 1, 2)), type="response")
(predict.lm(mod2, newdata=data.frame(varx=c(-2, -1, 0, 1, 2)), type="response"))^2

# What is shown for the R objects that contains the models?
mod1
mod2

