#!/usr/bin/env Rscript

cloud.cover <- factor(c('overcast', 'overcast', 'scattered', 'broken', 'broken', 'overcast', 'scattered', 'overcast'))
precipitation <- factor(c('light', 'heavy', 'light', 'none', 'light', 'moderate', 'none', 'light'))
wind <- factor(c(24, 14, 6, 5, 5, 6, 2, 3), ordered=TRUE)
temperature <- factor(c(9, 9, 5, 5, 7, 12, 8, 10), ordered=TRUE)
humidity <- factor(c(87, 81, 73, 76, 80, 85, 81, 88), ordered=TRUE)

weather <- data.frame(cloud.cover, precipitation, wind, temperature, humidity)

print(weather)

max_wind <- as.numeric(as.character(max(wind)))
min_wind <- as.numeric(as.character(min(wind)))
max_temperature <- as.numeric(as.character(max(temperature)))
min_temperature <- as.numeric(as.character(min(temperature)))
max_humidity <- as.numeric(as.character(max(humidity)))
min_humidity <- as.numeric(as.character(min(humidity)))

result <- matrix(, nrow = 8, ncol = 8)

for(i in 1:nrow(weather)) {
    for(i2 in 1:nrow(weather)) {
        if (weather[i, ]$cloud.cover != weather[i2, ]$cloud.cover) {
            dist_cloud <- 1
        } else {
            dist_cloud <- 0
        }
        if (weather[i, ]$precipitation != weather[i2, ]$precipitation) {
            dist_precipitation <- 1
        } else {
            dist_precipitation <- 0
        }
        dist_wind <- abs(as.numeric(as.character(weather[i, ]$wind)) - as.numeric(as.character(weather[i2, ]$wind))) / (max_wind - min_wind)
        dist_temperature <- abs(as.numeric(as.character(weather[i, ]$temperature)) - as.numeric(as.character(weather[i2, ]$temperature))) / (max_temperature - min_temperature)
        dist_humidity <- abs(as.numeric(as.character(weather[i, ]$humidity)) - as.numeric(as.character(weather[i2, ]$humidity))) / (max_humidity - min_humidity)
        total_dist <- (dist_cloud + dist_precipitation + dist_wind + dist_temperature + dist_humidity)/5
        if (i >= i2) {
            result[i, i2] <- total_dist
        }
    }
}
print(result)