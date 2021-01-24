#Hacker Rank
#10 Days of Statistics
#Day04
#Geomtric distribution II

data <- scan("/dev/stdin")
p <- data[1]/data[2]
q <- 1 - p
n <- data[3]
i <- 1
ans <- 0
while (i <= n)
{
    ans <- ans + ((q ** (i - 1)) * p)
    i = i + 1
}
cat(format(round(ans, 3), nsmall = 1))
