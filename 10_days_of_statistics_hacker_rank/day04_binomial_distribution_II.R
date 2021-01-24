#Hacker Rank
#10 Days of Statistics
#Day04
#Binomial distribution II

data <- scan("/dev/stdin")
reject <- data[1]
n <- data[2]
p <- reject / 100
q <- 1 - p
#No more than 2 rejects, x >= 0 and x <= 2
x <- 0
ans <- 0
while (x <= 2){
    n_x <- factorial(n)/(factorial(x)*factorial(n-x))
    ans <- ans + (n_x * (p ** x) * (q ** (n - x)))
    x <- x + 1
}
cat(format(round(ans, 3), nsmall = 1))
cat('\n')
#At least 2 rejects, x >= 2 and x <= 10
x <- 2
ans <- 0
while (x <= n){
    n_x <- factorial(n)/(factorial(x)*factorial(n-x))
    ans <- ans + (n_x * (p ** x) * (q ** (n - x)))
    x <- x + 1
}
cat(format(round(ans, 3), nsmall = 1))
