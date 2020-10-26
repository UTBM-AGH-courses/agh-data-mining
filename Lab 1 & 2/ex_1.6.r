#!/usr/bin/env Rscript

age <- c(57, 61, 57, 57, 58, 57, 61, 54, 68, 51, 49, 64, 50, 48, 65, 52, 56, 46, 54, 49, 51, 47, 55, 55, 54, 42, 51, 56, 55, 51, 54, 51, 60, 61, 43, 55, 56, 61, 52, 69, 64, 46, 54, 47)
pres.age <- age

find_outliers <- function(vector) {
    sd <- sd(vector)*2
    for (value in vector) {
        if(value > mean(vector) + sd || 
            value < mean(vector) - sd) {
            print(value)
        }
    }
}

# Histogram
png("histogram_1.6.png")
hist(pres.age)

# Outliers
find_outliers(pres.age)

# Boxplot
png("boxplot_1.6.png")
boxplot(pres.age)