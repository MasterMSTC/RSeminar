# As a calculator:
3 * (11.5 + 2.3)
g <- 4931
g
g * 1000

# It works in a "vectorized" way.
c(15.1, 11.3, 7.8) 
c(15.1, 11.3, 7.8) * 2.7
murder <- c(15.1, 11.3, 7.8, 10.1, 10.3, 6.8, 3.1, 6.2, 10.7, 13.9)

# You call operators and functions that work on R "objects".
# Read data from a file. Operations on vectors.
illit <- scan("illitdata.txt")
illit
states <- scan("statecodes.txt", character())
states
murder / illit
abs(murder - mean(murder))
2^c(5,8,3)

# Ranges, sequences...
0:10
3:-7
r1 <- seq(1, 1000, by=2)
r1
r2 <- rep(2, 5)
r2

# Conditions and indexing. Some utility functions.
murder > 12
summary(murder)
summary(murder > 12)
murder[1:13]
murder[1:3]
murder[murder > 12]
states[murder > 12]
illit[states == "CA"]
cond <- (murder > 12) & (illit <= 2)
murder[cond]
cond <- (murder > 12) | (illit <= 2)
murder[cond]
murder[-1]
murder[-c(1, 7)]
which_m12 <- (1:10)[murder>12]
which_m12
which_m12 <- (1:length(murder))[murder>12]
which_m12
which_m12 <- which(murder > 12)
murder[which_m12]

# Matrices. Some plots
state.x77
dimnames(state.x77)
murder <- state.x77[,5]
murder
illit <- state.x77[,3]
illit
states <- state.abb
states
plot(illit, murder, pch="*")
identify(illit, murder, states)
nasty <- murder > 10
points(illit[nasty], murder[nasty], pch="O")
plot(illit, murder, pch="*")
text(illit[nasty], murder[nasty], states[nasty], adj=-0.25)

# data.frames. Variables of different classes. Selection (rows, columns).
states_data <- data.frame(murder=murder, illit=illit, ab_state=states,
                          state=row.names(state.x77), row.names=NULL,
                          stringsAsFactors=F)
states_data$illit
states_data$ab_state
states_data[1, c(2, 1)]
states_data[states_data$murder > 10,]
states_data[states_data$murder > 10, c("state", "illit", "murder")]
my_iris <-
  read.table("my_iris.txt", header=F, sep="|", quote="",
             col.names=c("longsep", "anchsep", "longpet", "anchpet", "clase"),
             colClasses=c("numeric", "numeric", "numeric", "numeric", "character"),
             stringsAsFactors=F)
my_iris[1:10,]

# Save and load R objects
save(my_iris, file="lirios")
rm(my_iris)
my_iris
load("lirios")
my_iris[1:10,]

# Write a function
squared <- function(x) x^2
squared(1:5)
is.min <- function(x) x==min(x)
is.min(states_data$illit)
states_data$state[is.min(states_data$illit)]
squared
source("newsquared.r")
newsquared
ls()
newsquared(1:5)

# Quit session. You can save your workspace or not
q()
