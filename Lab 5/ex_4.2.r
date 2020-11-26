#!/usr/bin/env Rscript

library(cluster)

florist <- read.table("../Lab\ 3/florist.txt", header = T, sep = ",")

roses <- subset(florist, bouquet == 'roses')
roses_by_day <- aggregate(roses$price, by = list(roses$date), FUN = length)
names(roses_by_day) <- c('date', 'n_of_buquets')
roses_by_day$date <- as.numeric(gsub("-", "", as.character(roses_by_day$date)))
head(roses_by_day)

k_means <- kmeans(roses_by_day, 3)

str(k_means)

clusplot(roses_by_day, k_means$cluster, color=TRUE, shade=TRUE, labels=2, lines=2)