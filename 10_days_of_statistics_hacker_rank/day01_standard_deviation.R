#Hacker Rank
#10 Days of Statistics
#Day01
#Standard Deviation

data <- scan("/dev/stdin")
len <- data[1]
data <- data[2:(len+1)]
i <- 1
sum <- 0
while (i <= len){
    sum <- (data[i] - mean(data))**2 + sum
    i <- i+1
}
stdev <- sqrt(sum/len)
cat(format(round(stdev, 1), nsmall = 1))
