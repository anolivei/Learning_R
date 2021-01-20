#Hacker Rank
#10 Days of Statistics
#Day00

data <- scan("/dev/stdin")

len <- data[1]
y <- len + 1
x <- data[c(2:y)]

MEAN <- mean(x)
cat(MEAN)
cat('\n')

MEDIAN <- median(x)
cat(MEDIAN)
cat('\n')

getmode <- function(x)
{
    x <- sort(x)
    uniqx <- unique(x)
    uniqx[which.max(tabulate(match(x, uniqx)))]  
}
MODE <- getmode(x)
cat(MODE)
