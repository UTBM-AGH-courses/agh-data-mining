#!/usr/bin/env Rscript#!/usr/bin/env Rscript

florist <- read.table("../Lab\ 3/florist.txt", header = T, sep = ",")

roses <- subset(florist, bouquet == 'roses')
roses_by_day <- aggregate(roses$price, by = list(roses$date), FUN = length)

print(roses_by_day)

k_means <- kmeans(roses, 4)