#!/usr/bin/env Rscript

cloud.cover <- factor(c('overcast', 'overcast', 'scattered', 'broken', 'broken', 'overcast', 'scattered', 'overcast'))
precipitation <- factor(c('light', 'heavy', 'light', 'none', 'light', 'moderate', 'none', 'light'))
wind <- factor(c('strong', 'moderate', 'light', 'light', 'light', 'light', 'calm', 'calm'))
temperature <- factor(c('chilly', 'chilly', 'cold', 'cold', 'cold', 'chilly', 'chilly', 'normal'))

weather <- data.frame(cloud.cover, precipitation, wind, temperature)
print(weather)
print(levels(cloud.cover))

weather.binary <- data.frame()

# We need 14 attributes
result <- matrix(, nrow = 8, ncol = 14)
result_dist <- matrix(, nrow = 8, ncol = 8)

for(i in 1:nrow(weather)) {
    vector <- c()
    for(i2 in 1:length(levels(cloud.cover))) {
        if (weather[i, ]$cloud.cover == as.character(levels(cloud.cover)[i2])) {
            vector <- c(vector, 1)
        } else {
            vector <- c(vector, 0)
        }
    }
    for(i2 in 1:length(levels(precipitation))) {
        if (weather[i, ]$precipitation == as.character(levels(precipitation)[i2])) {
            vector <- c(vector, 1)
        } else {
            vector <- c(vector, 0)
        }
    }
    for(i2 in 1:length(levels(wind))) {
        if (weather[i, ]$wind == as.character(levels(wind)[i2])) {
            vector <- c(vector, 1)
        } else {
            vector <- c(vector, 0)
        }
    }
    for(i2 in 1:length(levels(temperature))) {
        if (weather[i, ]$temperature == as.character(levels(temperature)[i2])) {
            vector <- c(vector, 1)
        } else {
            vector <- c(vector, 0)
        }
    }
    result[i, ] <- vector
}


for(i in 1:nrow(result)) {
    for(i2 in 1:nrow(result)) {
        q <- 0
        r <- 0
        s <- 0
        for(i3 in 1:ncol(result)) {
            if (result[i, i3] == 1 && result[i2, i3] == 1) {
                q <- q + 1
            }
            if (result[i, i3] == 0 && result[i2, i3] == 1) {
                s <- s + 1
            }
            if (result[i, i3] == 1 && result[i2, i3] == 0) {
                r <- r + 1
            }
            dist <- (r+s)/(q+r+s)
        }
        if (i >= i2) {
            result_dist[i, i2] <- dist
        }
    }
}

print(result)
print("Computed Asymmetric binary dissimilarity : ")
print(result_dist)
