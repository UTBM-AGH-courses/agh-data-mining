#!/usr/bin/env Rscript

age <- c(23, 23, 27, 27, 39, 41, 47, 49, 50, 52, 54, 54, 56, 57, 58, 58, 60, 61)
percent_fat <- c(9.5, 26.5, 7.8, 17.8, 31.4, 25.9, 27.4, 27.2, 31.2, 34.6, 42.5, 28.8, 33.4, 30.2, 34.1, 32.9, 41.2, 35.7)

data <- data.frame(age, percent_fat)
data

# Mean
mean_age <- mean(age)
mean_age
mean_percent_fat <- mean(percent_fat)
mean_percent_fat

# Median
median_age <- median(age)
median_age
median_percent_fat <- median(percent_fat)
median_percent_fat

# Standard deviation
sd_age = sd(age)
sd_age
sd_percent_fat = sd(percent_fat)
sd_percent_fat

# Boxplot
png(file = "boxplot_1.4.png")
boxplot(data)

# Plot
png(file = "plot_1.4.png")
plot(data)

# Corralation
cor(data, method = "pearson")

# They are very correlated