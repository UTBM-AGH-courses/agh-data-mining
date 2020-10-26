#!/usr/bin/env Rscript

age <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30, 33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)

get_mode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

get_midrange <- function(v) {
    (max(v)+min(v))/2
}

# Mean
mean_age <- mean(age)
mean_age

# Median
median_age <- median(age)
median_age

# Mode
get_mode(age)

# Mid range
get_midrange(age)

# Five-number summary
summary(age)

# Draw
png(file = "boxplot_1.3.png")
boxplot(age)