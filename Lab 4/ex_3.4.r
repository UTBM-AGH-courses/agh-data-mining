#!/usr/bin/env Rscript
library(cluster)

cloud.cover <- factor(c('overcast', 'overcast', 'scattered', 'broken', 'broken', 'overcast', 'scattered', 'overcast'))
precipitation <- factor(c('light', 'heavy', 'light', 'none', 'light', 'moderate', 'none', 'light'))
wind <- factor(c('strong', 'moderate', 'light', 'light', 'light', 'light', 'calm', 'calm'))
temperature <- factor(c('chilly', 'chilly', 'cold', 'cold', 'cold', 'chilly', 'chilly', 'normal'))

weather <- data.frame(cloud.cover, precipitation, wind, temperature)

daisy(weather, metric = c("euclidean"))
