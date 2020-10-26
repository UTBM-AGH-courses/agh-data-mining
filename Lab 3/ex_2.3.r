#!/usr/bin/env Rscript

florist <- read.table("florist.txt", header = T, sep = ",")

florist_2014 <- subset(florist, year == 2014)
bouquets_by_province <- aggregate(florist_2014$price, by = list(florist_2014$sender_province), FUN = sum)
names(bouquets_by_province) <- c('province', 'total')
#bouquets_by_province <- bouquets_by_province[order(bouquets_by_province$total),]

head(bouquets_by_province)

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

bouquets_by_province_bin_1 <- binning(bouquets_by_province$total, 3)
bouquets_by_province_bin_2 <- binning(bouquets_by_province$total, 4)
bouquets_by_province_bin_3 <- binning(bouquets_by_province$total, 5)
png("plot_2.3.png")
matplot(cbind(bouquets_by_province$total, bouquets_by_province_bin_1, bouquets_by_province_bin_2, bouquets_by_province_bin_3), type = 'l')