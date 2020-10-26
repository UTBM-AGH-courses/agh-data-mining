#!/usr/bin/env Rscript

florist <- read.table("florist.txt", header = T, sep = ",")

roses <- subset(florist, bouquet == 'roses')
roses_by_week <- aggregate(roses$price, by = list(roses$year, roses$week), FUN = sum)
names(roses_by_week) <- c('year', 'week', 'total')
roses_by_week <- roses_by_week[order(roses_by_week$year, roses_by_week$week),]
head(roses_by_week)
png("plot_2.2.png")
plot(roses_by_week$total, type = 'l')

binning <- function(x, bin_size, FUN = mean) {
  len <- length(x)
  y <- vector()
  for(i in 1:len) {
    k <- i / bin_size
    if (k == 0) {
        k0 <- i - bin_size + 1
    } else {
        k0 <- i - k + 1
    }
    k1 <- k0 + bin_size + 1
    if (k1 > len) {
        k1 <- len
    }
    y[i] <- FUN(x[k0:k1])
  }
  return(y)
}

rose_bin_1 <- binning(roses_by_week$total, 5)
rose_bin_2 <- binning(roses_by_week$total, 5, median)
png("plot_bining_2.2.png")
matplot(cbind(roses_by_week$total, rose_bin_1, rose_bin_2), type = 'l')