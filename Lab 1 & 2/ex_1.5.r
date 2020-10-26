#!/usr/bin/env Rscript

age <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30, 33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)

find_outliers <- function(vector) {
    sd <- sd(vector)*2
    for (value in vector) {
        if(value > mean(vector) + sd || value < mean(vector) - sd) {
            print(value)
        }
    }
}

# Age
find_outliers(age)

# Cars
find_outliers(cars$dist)
find_outliers(cars$speed)

# Iris
find_outliers(iris$Sepal.Length)
find_outliers(iris$Sepal.Width)
find_outliers(iris$Petal.Length)
find_outliers(iris$Petal.Width)