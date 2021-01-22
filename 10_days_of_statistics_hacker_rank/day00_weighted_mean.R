#Hacker Rank
#10 Days of Statistics
#Day00
data <- scan("/dev/stdin")
len <- data[1]
numbers <- data[c(2:(len+1))]
weight <- data[c((len+2):(2*len+1))]
x <- numbers * weight
sum_x <- sum(x)
sum_weight <- sum(weight)
MEAN <- sum_x/sum_weight
cat(format(round(MEAN, 1), nsmall = 1))
