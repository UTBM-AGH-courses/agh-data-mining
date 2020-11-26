#!/usr/bin/env Rscript
library(cluster)

set.seed(123) 

usa <- data.frame(USArrests)

df <- scale(usa)
head(df)

df_20 <- df[sample(1:nrow(df), 20,replace=FALSE), ]
df_30 <- df[sample(1:nrow(df), 30,replace=FALSE), ]
df_40 <- df[sample(1:nrow(df), 40,replace=FALSE), ]

k_means_20 <- kmeans(df_20, 4)
k_means_30 <- kmeans(df_30, 4)
k_means_40 <- kmeans(df_40, 4)

str(k_means_20)
str(k_means_30)

png("km20plot_4.12.png")
clusplot(df_20, k_means_20$cluster, color=TRUE, shade=TRUE, labels=2, lines=2)
png("km30plot_4.12.png")
clusplot(df_30, k_means_30$cluster, color=TRUE, shade=TRUE, labels=2, lines=2)
png("km40plot_4.12.png")
clusplot(df_40, k_means_40$cluster, color=TRUE, shade=TRUE, labels=2, lines=2)