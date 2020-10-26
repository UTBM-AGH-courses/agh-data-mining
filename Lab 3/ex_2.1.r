#!/usr/bin/env Rscript

florist <- read.table("florist.txt", header = T, sep = ",")
head(florist)

florist_by_day <- aggregate(florist$price, by = list(florist$date), FUN = length)
names(florist_by_day) <- c('date', 'n_of_buquets')
head(florist_by_day)
png("plot_2.1.png")
# Correlation plot :
plot(florist_by_day$n_of_buquets)
florist_by_day[florist_by_day$n_of_buquets > 100,]

# Roses
roses <- subset(florist, bouquet == 'roses')
roses_by_day <- aggregate(roses$price, by = list(roses$date), FUN = length)
names(roses_by_day) <- c('date', 'n_of_buquets')
head(roses_by_day)
png("plot_roses_2.1.png")
# Correlation plot :
plot(roses_by_day$n_of_buquets)