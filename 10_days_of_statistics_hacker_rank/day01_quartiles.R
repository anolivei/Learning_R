#Hacker Rank
#10 Days of Statistics
#Day01
#quartiles

data <- scan("/dev/stdin")
len <- data[1]
data <- sort(data[2:(len+1)])
X <- data[1:len]
Q2 <- quantile(X)[3]
L <- data[1: (len%/%2)]
Q1 <- quantile(L)[3]
if (len %% 2 == 0){
    i = 1
} else {
    i = 2
}
U <- data[(len%/%2+i):len]
Q3 <- quantile(U)[3]
cat(Q1,Q2,Q3,sep = "\n")
