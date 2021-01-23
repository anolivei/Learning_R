#Hacker Rank
#10 Days of Statistics
#Day01
#Interquartile Range

data <- scan("/dev/stdin")
len <- data[1]
data <- data[2:(len*2+1)]
element <- data[1:len]
frequency <- data[(len+1):(2*len)]
data <- rep(element,frequency)
data <- sort(data)
len <- length(data)
L <- data[1: (len%/%2)]
Q1 <- quantile(L)[3]
if (len %% 2 == 0){
    i = 1
} else {
    i = 2
}
U <- data[(len%/%2+i):len]
Q3 <- quantile(U)[3]
ret <- Q3 - Q1
cat(format(round(ret, 1), nsmall = 1))
