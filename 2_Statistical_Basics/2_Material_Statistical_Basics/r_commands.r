# Absolute and relative frequency tables.
# Some graphical representations of data distribution.
nperspiso <- scan("ej_1_2_nperspiso.txt")
nperspiso
table(nperspiso)
table(nperspiso) / length(nperspiso)
table(nperspiso) * 100 / length(nperspiso)
barplot(table(nperspiso))
pie(table(nperspiso))

# Histograms (data distribution for continuous variables).
hist(nperspiso)
hist(nperspiso, breaks=11)

# Central tendency measures: mean, median, mode.
mean(nperspiso)
median(nperspiso)
table_nperspiso <- table(nperspiso)
table_nperspiso
names(table_nperspiso)
names(table_nperspiso)[which.max(table_nperspiso)]

# Dispersion measures: range, variance, standard deviation.
max(nperspiso) - min(nperspiso)
sum((nperspiso - mean(nperspiso))^2) / length(nperspiso)
sum((nperspiso - mean(nperspiso))^2) / (length(nperspiso) - 1)
var(nperspiso)
sqrt(sum((nperspiso - mean(nperspiso))^2) / length(nperspiso))
sqrt(sum((nperspiso - mean(nperspiso))^2) / (length(nperspiso) - 1))
sd(nperspiso)

# Percentiles, quartiles, interquartile range.
gasto <- scan("ej_1_18_gasto.txt")
gasto
quantile(gasto)
median(gasto)
quantile(gasto, probs=c(0.25, 0.75))
quantile(gasto, probs=c(0.25, 0.75), type=4)
quantile(gasto, probs=0.75) - quantile(gasto, probs=0.25)
quantile(gasto, probs=0.75, type=4) - quantile(gasto, probs=0.25, type=4)
IQR(gasto)

# Boxplot (graphical representation with information about quartiles).
# It gives one way to detect outliers.
distCadiz <- scan("ej_1_21_distcadiz.txt")
distCadiz
distCadiz <- distCadiz[distCadiz > 0]
distCadiz
boxplot(distCadiz)
abline(h=seq(0, 1500, 100), lty=2, col="lightgrey")
boxplot(distCadiz,
	    main="Distance from Cádiz to other province capital cities",
	    xlab="Km", col="green", horizontal=T)
abline(v=seq(100, 1500, 100), lty=2, col="lightgrey")

# Usefulness of variable transformations.
ipc <- scan("ipc.txt")
par(mfrow=c(1, 2))
hist(ipc, density=15)
hist(log(ipc), density=15)
boxplot(ipc, col="grey")
boxplot(log(ipc), col="grey")
par(mfrow=c(1, 1))

# STOP. We go back to the presentation.

# Dependence between variables.
# Two discrete variables.
# One continuous variables and one discrete variable.
load("ratas")
ratas
ratas$veneno <- as.factor(ratas$veneno)
table(ratas$tint, ratas$veneno)
mytable <- table(ratas$tint, ratas$veneno)
barplot(t(mytable), cex.names=0.5, col=c("red", "green", "blue"),
	    legend=T, beside=T)
table(ratas$tint[ratas$veneno == "2"]) * 100 /
  length(ratas$tint[ratas$veneno == "2"])
table(ratas$veneno[ratas$tint == "(0.17,0.3]"]) * 100 /
  length(ratas$veneno[ratas$tint == "(0.17,0.3]"])
boxplot(ratas$t ~ ratas$veneno, col="grey")

# STOP. We go back to the presentation.

# Linear dependence between continuous variables.
# Covariance, correlation.
load("tasas_paises")
tasas_paises
cov(tasas_paises[, -1])
cor(tasas_paises[, -1])

# Linear regression line.
load("peso_estatura")
peso_estatura
plot(x=peso_estatura$estatura, y=peso_estatura$peso)
cor(peso_estatura$estatura, peso_estatura$peso)
cor(peso_estatura)
a <- cov(peso_estatura$estatura, peso_estatura$peso) / var(peso_estatura$estatura)
b <- mean(peso_estatura$peso) - a * mean(peso_estatura$estatura)
abline(a=b, b=a, col="red")
new_heights <- c(0, 1.65, 1.70, 1.75, 1.80)
new_weights <- a * new_heights + b
new_weights

# Linear predictive model (based on the linear regression line).
plot(x=peso_estatura$estatura, y=peso_estatura$peso)
mod_lin <- lm(peso ~ estatura, data=peso_estatura)
mod_lin
names(mod_lin)
mod_lin$coefficients
abline(mod_lin, col=2)
new_heights <- data.frame(estatura=new_heights)
new_weights <- predict(mod_lin, newdata=new_heights)
