#Hacker Rank
#10 Days of Statistics
#Day04
#Geomtric distribution I

data <- scan("/dev/stdin")
p <- data[1]/data[2]
q <- 1 - p
n <- data[3]
ans <- (q ** (n - 1)) * p
cat(format(round(ans, 3), nsmall = 1))
