#Hacker Rank
#10 Days of Statistics
#Day05
#Normal Distribution I

data <- scan("/dev/stdin")
MEAN <- data[1]
SD <- data[2]
X1 <- data[3]
X21 <- data[4]
X22 <- data[5]
P1 <- pnorm(X1,mean = MEAN,sd = SD, lower.tail = TRUE)
P2 <- 1- pnorm(X21,mean = MEAN,sd = SD, lower.tail = TRUE) - pnorm(X22,mean = MEAN,sd = SD, lower.tail = FALSE)
cat(format(round(P1, 3), nsmall = 3), format(round(P2, 3), nsmall = 3),sep = "\n")

#Here I was trying do make my own function, but it didn't work...
#I intend to return here in future
#
#calc_prob <- function(X, MEAN, SD) {
#    elev <- (((X - MEAN) ** 2)/(2 * (SD ** 2)))
#    Nx <- (1 / ((SD) * sqrt(2 * pi))) * exp(-1 * elev)
#    return(Nx)
#}
#P1 <- calc_prob(X1, MEAN, SD)
#P21 <- calc_prob(X21, MEAN, SD)
#P22 <- calc_prob(X22, MEAN, SD)
#P2 <- P22 - P21
#cat(format(round(P1, 3), nsmall = 3), format(round(P2, 3), nsmall = 3),sep = "\n")
