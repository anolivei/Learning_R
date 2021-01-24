#Hacker Rank
#10 Days of Statistics
#Day05
#Poisson Distribution II

data <- scan("/dev/stdin")
lamb_A <- data[1]
lamb_B <- data[2]
X2 <- lamb_A + lamb_A * lamb_A
Y2 <- lamb_B + lamb_B * lamb_B
A <- 160 + (40 * X2)
B <- 128 + (40 * Y2)
cat(format(round(A, 3), nsmall = 3), format(round(B, 3), nsmall = 3),sep = "\n")
