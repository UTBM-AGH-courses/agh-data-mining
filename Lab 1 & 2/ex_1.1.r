#!/usr/bin/env Rscript

colors <- factor(c('blue', 'yellow', 'red', 'purple'))
#colors
pattern <- sample(colors, 500, replace = T)
#pattern
pattern1 <- data.frame(pattern)
#pattern1
pattern2 <- matrix(data = pattern)
#pattern2
colors1 <- list(colors)
colors1