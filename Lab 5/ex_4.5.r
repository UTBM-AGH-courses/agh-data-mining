#!/usr/bin/env Rscript
library(BBmisc)
library(factoextra)
library(cluster)


florist <- read.table("../Lab\ 3/florist.txt", header = T, sep = ",")

florist_2014 <- subset(florist, year == 2014)
bouquets_by_province <- aggregate(florist_2014$price, by = list(florist_2014$sender_province), FUN = sum)
names(bouquets_by_province) <- c('province', 'total')

bouquets_by_province <- normalize(bouquets_by_province, "range", range = c(0,1))
bouquets_by_province$province <- as.factor(bouquets_by_province$province)
head(bouquets_by_province)

dist_mat <- dist(bouquets_by_province$total, method = 'euclidean')
dxy <- daisy(bouquets_by_province, metric = c("euclidean"))

hclust_single <- hclust(dist_mat, method = 'single')
cph_single <- cophenetic(hclust_single)
hclust_complete <- hclust(dist_mat, method = 'complete')
cph_complete <- cophenetic(hclust_complete)
hclust_avg <- hclust(dist_mat, method = 'average')
cph_avg <- cophenetic(hclust_avg)
hclust_centroid <- hclust(dist_mat, method = 'centroid')
cph_centroid <- cophenetic(hclust_centroid)

summary(hclust_avg)

plot(hclust_avg)
plot(hclust_single)
plot(hclust_complete)
plot(hclust_centroid)

cor(cph_avg,dxy)
cor(cph_single,dxy)
cor(cph_complete,dxy)
cor(cph_centroid,dxy)

#Best method ===> Average distance