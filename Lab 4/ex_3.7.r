#!/usr/bin/env Rscript
library(cluster)

chocolate <- factor(c('milk', 'milk', 'milk', 'milk', 'milk', 'white', 'white', 'white', 'white', 'white', 'dark', 'dark', 'dark', 'dark', 'dark'))
nuts <- factor(c('pistachios', 'pistachios', 'walnuts', 'hazelnuts', 'almonds', 'pistachios', 'pistachios', 'hazelnuts', 'almonds', 'almonds', 'walnuts', 'walnuts', 'almonds', 'hazelnuts', 'hazelnuts'))
filling <- factor(c('cream', 'coffee', 'cream', 'cream', 'marzipan', 'cream', 'coffee', 'strawberry', 'marzipan', 'cream', 'cream', 'marzipan', 'cream', 'coffee', 'strawberry'))
shape <- factor(c('heart', 'heart', 'leaf', 'snowflake', 'ball', 'ball', 'ball', 'heart', 'leaf', 'snowflake', 'snowflake', 'leaf', 'leaf', 'heart', 'heart'))

sweets <- data.frame(chocolate, nuts, filling, shape)
print(sweets)

daisy(sweets, metric = c("euclidean"))