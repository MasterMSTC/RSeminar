# Exercises 1 to 4.
x <- c(2, 5, 120, 5, 8, 11)
i <- 1:length(x)
i
inv_i <- length(x):1
inv_i
inv_x <- x[inv_i]
inv_x
x <- c(x[1:4], 7, x[5:length(x)])
x
x <- c(x, 3)
x
x[x == 120] <- 12
x

# Exercise 5.
x <- seq(0, 5, 0.01)
y <- sin(x)
plot(x, y)
plot(x, y, type="l")

# Exercise 6.
x <- c(rep(0.5, 4), rep(1.5, 4), rep(3, 4))
x

# Exercise 7.
x <- c(1, 3, 5, 7, 9)
y <- c(2, 3, 5, 7, 11, 13)
x + 1
y * 2
c(length(x), length(y))
x + y
sum(x > 5)
sum(x[x > 5])
sum(x[x > 5 | x > 3])
y[y > 7]

# Exercise 8.
mean_x <- sum(x) / length(x)
mean_x
mean(x)
var_x <- sum((x - media_x)^2) / (length(x) - 1)
var_x
var(x)

# Exercise 9.
month_expense <- c(23, 33, 25, 45, 10, 28, 39, 27, 15, 38, 34, 29)
sum(month_expense)
min(month_expense)
max(month_expense)
which(month_expense > mean(month_expense))
month_name <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov",
                "Dec")
month_name[which(month_expense > mean(month_name))]
length(which(month_expense > mean(month_expense))) * 100 / length(month_expense)

# Exercise 10.
ans <- read.table(file="anscombe.txt", sep=";", dec = ",", header=F,
                  col.names=c ("x1","y1","x2","y2","x3","y3","x4","y4"))
write.table(ans, file="ans.txt", sep=";", dec=".")

# Exercise 11.
write.table(ans[, c("x1", "y1", "x3", "y3")], file="ans13.txt", sep=";", dec=".")
plot(ans$x1, ans$y1)
plot(ans$x2, ans$y2)
plot(ans$x3, ans$y3)
plot(ans$x4, ans$y4)
par(mfrow=c(2, 2))
plot(ans$x1, ans$y1)
plot(ans$x2, ans$y2)
plot(ans$x3, ans$y3)
plot(ans$x4, ans$y4)
par(mfrow=c(1, 1))

# Exercise 12.
rango <- seq(4, 16, 0.1)
func_dens_prob_acum <- pnorm(rango, mean=10, sd=2)
plot(x=rango, y=func_dens_prob_acum, type="l", lwd=2)
abline(h=0.5, v=10, lty=2)
y_a <- 0.9
abline(h=y_a, col="red", lty=3)
x_a <- qnorm(y_a, mean=10, sd=2)
abline(v=x_a, col="red", lty=3)
text(x=x_a, y=0, labels="A", pos=4, col="red")
y_b <- y_a - 0.6
abline(h=y_b, col="red", lty=3)
x_b <- qnorm(y_b, mean=10, sd=2)
abline(v=x_b, col="red", lty=3)
text(x=x_b, y=0, labels="B", pos=4, col="red")
y_c <- 1 - 0.8
abline(h=y_c, col="red", lty=3)
x_c <- qnorm(y_c, mean=10, sd=2)
abline(v=x_c, col="red", lty=3)
text(x=x_c, y=0, labels="C", pos=4, col="red")
y_d <- y_c + 0.3
abline(h=y_d, col="red", lty=3)
x_d <- qnorm(y_d, mean=10, sd=2)
abline(v=x_d, col="red", lty=3)
text(x=x_d, y=0, labels="D", pos=4, col="red")
(1 - pnorm(x_a, mean=10, sd=2)) * 100
pnorm(x_a, mean=10, sd=2) * 100
(1 - pnorm(x_b, mean=10, sd=2)) * 100
pnorm(x_b, mean=10, sd=2) * 100
(1 - pnorm(x_c, mean=10, sd=2)) * 100
pnorm(x_c, mean=10, sd=2) * 100
(1 - pnorm(x_d, mean=10, sd=2)) * 100
pnorm(x_d, mean=10, sd=2) * 100

# Exercise 13.
y_a <- 0.5 - 0.7 / 2
x_a <- qnorm(y_a, mean=6, sd=2)
x_a
y_b <- 0.5 + 0.7 / 2
x_b <- qnorm(y_b, mean=6, sd=2)
x_b
pnorm(7, mean=6, sd=2) - pnorm(6, mean=6, sd=2)
pnorm(10, mean=6, sd=2) - pnorm(9, mean=6, sd=2)
1 - pnorm(8, mean=6, sd=2)
pnorm(4, mean=6, sd=2)
# Both values are equal because their distance to the mean is the same,
# and the distribution is symmetrical.
qnorm(0.95, mean=6, sd=2)
# (9.29, Inf)
qnorm((1 - 0.3), mean=6, sd=2)
# (-Inf, 7.05)

