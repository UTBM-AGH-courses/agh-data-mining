#!/usr/bin/env Rscript
library(e1071)
library(purrr)
library(dplyr)
library(numbers)


set.seed(123)
x <- seq(0.1, 5, by = 0.5)
y <- dnorm(log10(x), sd = 0.3)
png(file = "normal_distribution.png")
plot(x,y, main = "Normal Distribution", col = "blue")

data_nd <- data.frame(x=x, y=y)
head(data_nd)

svmfit <- svm(y ~ x, data = data_nd, kernel = "sigmoid")
png(file = "svm_nd.png")
plot(svmfit, data=data_nd)