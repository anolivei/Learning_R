#Hacker Rank
#10 Days of Statistics
#Day01
#Binomial distribution I

data <- scan("/dev/stdin")
boy <- data[1]
girl <- data[2]
p <- boy/(boy+girl)
q <- girl/(boy+girl)
n <- 6
x <- 3
ans <- 0
while (x <= 6){
    n_x <- factorial(n)/(factorial(x)*factorial(n-x))
    ans <- ans + (n_x * (p ** x) * (q ** (n - x)))
    x <- x + 1
}
cat(format(round(ans, 3), nsmall = 1))
