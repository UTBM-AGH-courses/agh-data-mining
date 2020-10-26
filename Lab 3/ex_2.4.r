#!/usr/bin/env Rscript

florist <- read.table("florist.txt", header = T, sep = ",")


florist_2014 <- subset(florist, year == 2014)
bouquets_by_province <- aggregate(florist_2014$price, by = list(florist_2014$sender_province), FUN = sum)
names(bouquets_by_province) <- c('province', 'total')

min_max_norm <- function(x, min, max) {
  len <- length(x)
  y <- vector()
  for(i in 1:len) {
      y[i] <- min +  ((x[i] - min(x)) * (max - min)) / (max(x) - min(x))
  }
  return(y)
}

z_score_norm <- function(x) {
  len <- length(x)
  y <- vector()
  for(i in 1:len) {
      y[i] <- (x[i] - mean(x)) / sd(x)
  }
  return(y)
}

decimal_norm <- function(x, power) {
  len <- length(x)
  y <- vector()
  for(i in 1:len) {
      y[i] <- x[i] / 10**power
  }
  return(y)
}

province_norm_1 <- min_max_norm(bouquets_by_province$total, 0, 1)
province_norm_2 <- z_score_norm(bouquets_by_province$total)
province_norm_3 <- decimal_norm(bouquets_by_province$total, 4)
png("plot_2.4.png")
plot(province_norm_2, col='green')
lines(province_norm_1, col='blue')
lines(province_norm_3, col='red')