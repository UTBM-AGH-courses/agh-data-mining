#!/usr/bin/env Rscript
library(cluster)

A1 <- c(2,10)
A2 <- c(2,5)
A3 <- c(8,4)
B1 <- c(5,8)
B2 <- c(7,5)
B3 <- c(6,4)
C1 <- c(1,2)
C2 <- c(4,9)

points <- list()
centers <- list()

points[[1]] <- A2
points[[2]] <- A3
points[[3]] <- B2
points[[4]] <- B3
points[[5]] <- C2

centers[[1]] <- A1
centers[[2]] <- B1
centers[[3]] <- C1

points_df <- data.frame(x=c(2,2,8,5,7,6,1,4),y=c(10,5,4,8,5,4,2,9))

euclidian_metric <- function(v1, v2) {
    sum <- 0
    for (index in 1:min(length(v1), length(v2))) {
        sum <- sum + (v1[index] - v2[index])**2
    }
    return(sqrt(sum))
}

for (index2 in 1:length(centers)) {
    min_dist <- 100000
    min_vec <- c()
    for (index3 in 1:length(points)) {
        dist <- euclidian_metric(points[[index3]], centers[[index2]])
        if (dist < min_dist) {
            min_dist <- dist
            min_vec <- points[[index3]]
        }
        
    }
}

#The 3 centers after the first iteration are :
#(3,19/2) for A1 cluster
#(6,13/2) for B1 cluster
#(3/2,7/2) for C1 cluster

#The 3 final clusters are :
#A1,C2
#B1,B2,A3
#C1,A2,B3
print(points_df)


k_means <- kmeans(points_df, rbind(A1,B1,C1))
clusplot(points_df, k_means$cluster, color=TRUE, shade=TRUE, labels=2, lines=2)




