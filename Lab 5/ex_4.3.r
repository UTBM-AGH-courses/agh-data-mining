#!/usr/bin/env Rscript
library(cluster)
library(factoextra)
library(BBmisc)
library(cluster)

set.seed(123)

accidents <- read.table("accidents.txt", header = T, sep = ",")
accidents2 <- normalize(accidents, "range", range=c(0,1))

head(accidents)
head(accidents2)
summary(accidents2)

pam_algo <- pam(accidents, 5)
pam2_algo <- pam(accidents2, 5)
print(pam_algo$medoids)
fviz_cluster(pam_algo)
fviz_cluster(pam2_algo)

