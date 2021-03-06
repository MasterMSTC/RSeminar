x <- seq(-7, 7, 0.01)
pdf("gauss1.pdf")
plot(x, y=dnorm(x), type="l", main="Gaussiana (media 0, varianza 1)", xlab="", ylab="")
dev.off()
pdf("gauss2.pdf")
plot(x, y=pnorm(x), type="l", main="Gaussiana (media 0, varianza 1)", xlab="", ylab="")
dev.off()
pdf("gauss3.pdf")
plot(x, y=dnorm(x), type="l", main="Gaussiana (medias -1, 0 y 1), varianza 1)", xlab="", ylab="")
points(x, y=dnorm(x, mean=-1), type="l", col=2)
points(x, y=dnorm(x, mean=1), type="l", col=3)
grid()
legend("topright", legend=c("media=-1", "media=0", "media=1"), col=c(2,1,3), lty=1)
dev.off()
pdf("gauss4.pdf")
plot(x, y=pnorm(x), type="l", main="Gaussiana (medias -1, 0 y 1), varianza 1)", xlab="", ylab="")
points(x, y=pnorm(x, mean=-1), type="l", col=2)
points(x, y=pnorm(x, mean=1), type="l", col=3)
grid()
legend("topleft", legend=c("media=-1", "media=0", "media=1"), col=c(2,1,3), lty=1)
dev.off()
pdf("gauss5.pdf")
plot(x, y=dnorm(x), type="l", main="Gaussiana (media 0), varianzas 1, 2 y 3)", xlab="", ylab="")
points(x, y=dnorm(x, sd=sqrt(2)), type="l", col=2)
points(x, y=dnorm(x, sd=sqrt(3)), type="l", col=3)
grid()
legend("topright", legend=c("sd=1", "sd=sqrt(2)", "sd=sqrt(3)"), col=c(1,2,3), lty=1)
pdf("gauss6.pdf")
plot(x, y=pnorm(x), type="l", main="Gaussiana (media 0, varianzas 1, 2 y 3)", xlab="", ylab="")
points(x, y=pnorm(x, sd=sqrt(2)), type="l", col=2)
points(x, y=pnorm(x, sd=sqrt(3)), type="l", col=3)
grid()
legend("topleft", legend=c("sd=1", "sd=sqrt(2)", "sd=sqrt(3)"), col=c(1,2,3), lty=1)
dev.off()
