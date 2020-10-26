#!/usr/bin/env Rscript

# Duplicate
cars2 = cars

# Add attr with unit
attr(cars2, 'unit') <- c('m/s', 'm', 'km/h')

# Compute linear regression
linear_regression <- lm(cars$dist~cars$speed)

# Plot
png(file = "cars2.png")
plot(cars2)
abline(linear_regression)

# Add new colum for km/h
speed2 <- cars2$speed * 3.6
cars2$speed2 <- speed2