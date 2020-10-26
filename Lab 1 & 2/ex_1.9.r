#!/usr/bin/env Rscript

year <- c(1994, 1995, 1996, 1997, 1998)
passengers <- c(34567, 34678, 36789, 38102, 39024)

data <- data.frame(year, passengers)

png("histogram_1.9.png")
hist(data$passengers, breaks=5, freq=FALSE, col = "green",border = "blue")
lines(density(data$passengers))