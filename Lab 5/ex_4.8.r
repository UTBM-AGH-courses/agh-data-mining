#!/usr/bin/env Rscript
library(BBmisc)
library(cluster)
library(dbscan)
library(scatterplot3d)


shapes <- read.table("shapes_2d.txt", header = T, sep = ",")

png("plot_4.8.png")
plot(shapes)

png("knplot_4.8.png")
k_n <- kNNdistplot(shapes, k = 4)
summary(k_n)

#Best value ==> arround 0.1 - 0.12

png("dbsplot_4.8.png")
dbs <- dbscan(shapes, eps = 0.12, MinPts = 4)
plot(shapes,col = dbs$cluster + 1, pch = 20, asp = 1)

#scatterplot3d(x=shapes$x, y=shapes$y,color = dbs$cluster + 1, pch = 20, asp = 1)
