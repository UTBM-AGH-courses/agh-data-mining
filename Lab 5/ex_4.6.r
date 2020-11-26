#!/usr/bin/env Rscript
library(BBmisc)
library(factoextra)
library(cluster)


cloud.cover <- factor(c('overcast', 'overcast', 'scattered', 'broken', 'broken', 'overcast', 'scattered', 'overcast'))
precipitation <- factor(c('light', 'heavy', 'light', 'none', 'light', 'moderate', 'none', 'light'))
wind <- factor(c('strong', 'moderate', 'light', 'light', 'light', 'light', 'calm', 'calm'))
temperature <- factor(c('chilly', 'chilly', 'cold', 'cold', 'cold', 'chilly', 'chilly', 'normal'))

weather <- data.frame(cloud.cover, precipitation, wind, temperature)

print(weather)
summary(weather)

dist_mat <- daisy(weather, metric=c("euclidean"))

hc_single <- hclust(dist_mat, method = "single")
hc_complete <- hclust(dist_mat, method = "complete")

fviz_dend(hc_single, k = 3, horiz = T, main = "Single method", labels_track_height = 2, rect = TRUE)
fviz_dend(hc_complete, k = 3, horiz = T, main = "Complete method", labels_track_height = 2)