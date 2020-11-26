#!/usr/bin/env Rscript
library(BBmisc)
library(cluster)
library(dbscan)
library(scatterplot3d)
library(factoextra)

orange <- data.frame(Orange)
head(orange)
summary(orange)

dist_mat <- daisy(orange, metric=c("euclidean"))
summary(dist_mat)

hc_complete <- hclust(dist_mat, method = "complete")

fviz_dend(hc_complete, k = 3, horiz = T, main = "Single method", labels_track_height = 2, rect = TRUE)

png("dbsplot_4.9.png")
dbs <- fpc::dbscan(dist_mat, eps = 0.12, MinPts = 4, method=c("dist"), scale = FALSE)
#plot(dbs, orange, main = "DBSCAN", frame = FALSE)
scatterplot3d(x=orange$Tree, y=orange$age, z=orange$circumference, color = dbs$cluster + 1)

#There are 2 outliers
