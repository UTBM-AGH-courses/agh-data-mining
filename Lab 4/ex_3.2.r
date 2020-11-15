#!/usr/bin/env Rscript


v1 <- c(1,2,3,4,5,6)
v2 <- c(-4,-5,-6,-6,6,7)

euclidian_metric <- function(v1, v2) {
    sum <- 0
    for (index in 1:min(length(v1), length(v2))) {
        sum <- sum + (v1[index] - v2[index])**2
    }
    return(sqrt(sum))
}

canberra_metric <- function(v1, v2) {
    sum <- 0
    for (index in 1:min(length(v1), length(v2))) {
        sum <- sum + (abs(v1[index] - v2[index]) / (abs(v1[index]) + abs(v2[index])))
    }
    return(sum)
}

minkowski_metric <- function(v1, v2, p) {
    sum <- 0
    for (index in 1:min(length(v1), length(v2))) {
        sum <- sum + abs(v1[index] - v2[index])**p
    }
    return((sum)**(1/p))
}

manhattan_metric <- function(v1, v2) {
    sum <- 0
    for (index in 1:min(length(v1), length(v2))) {
        sum <- sum + (abs(v1[index] - v2[index]))
    }
    return(sum)
}

tchebychev_metric <- function(v1, v2) {
    max <- 0
    for (index in 1:min(length(v1), length(v2))) {
        current_max <- (abs(v1[index] - v2[index]))
        if (current_max > max) {
            max <- current_max
        }
    }
    return(max)
}

print(euclidian_metric(v1, v2))
print(canberra_metric(v1, v2))
print(minkowski_metric(v1, v2, 1))
print(minkowski_metric(v1, v2, 2))
print(minkowski_metric(v1, v2, 3))
print(manhattan_metric(v1, v2))
print(tchebychev_metric(v1, v2))


# When we compute the Minkowski metric with p=2, 
# it is equivalent to the Euclidian distance because power(1/2) = square_root

# When we compute the Minkowski metric with p=1, 
# it is equivalent to the Manhattan distance because n_power(1/1) = n

# R-computation is feasible even if the length of vectors is different because we use the min function to get
# the length of the smallest vector