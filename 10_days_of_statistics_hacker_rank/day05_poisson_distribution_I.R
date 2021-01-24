#Hacker Rank
#10 Days of Statistics
#Day05
#Poisson Distribution I

data <- scan("/dev/stdin")
lamb <- data[1]
k <- data[2]
P <- ((lamb ** k) * (exp(lamb * -1)))/factorial(k)
cat(format(round(P, 3), nsmall = 1))
