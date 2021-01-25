#Hacker Rank
#10 Days of Statistics
#Day05
#Normal Distribution II

data <- scan("/dev/stdin")
MEAN <- data[1]
SD <- data[2]
X1 <- data[3]
X2 <- data[4]
P1 <- 100*pnorm(X1, mean = MEAN, sd = SD, lower.tail = FALSE)
P2 <- 100*pnorm(X2, mean = MEAN, sd = SD, lower.tail = FALSE)
P3 <- 100*pnorm(X2, mean = MEAN, sd = SD, lower.tail = TRUE)
cat(format(round(P1, 2), nsmall = 2), format(round(P2, 2), nsmall = 2), format(round(P3, 2), nsmall = 2), sep = "\n")
