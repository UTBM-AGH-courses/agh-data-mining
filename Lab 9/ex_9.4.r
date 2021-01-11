#!/usr/bin/env Rscript

library(e1071)
library(purrr)
library(dplyr)

data("iris")

iris.x <- select(iris, -Species)
iris.y <- iris$Species

set.seed(123)
svm_model_after_tune_polynomial <- svm(Species ~ ., data = iris, kernel = "polynomial", cost = 10^(-1:2), gamma=c(.5, 1, 2), scale = FALSE)
svm_model_after_tune_linear <- svm(x = iris.x, y = iris.y, kernel = "linear", cost = 2, scale = FALSE)
svm_model_after_tune_sigmoid <- svm(x = iris.x, y = iris.y, kernel = "sigmoid", cost = 2, scale = FALSE)
print(svm_model_after_tune_polynomial)
print(svm_model_after_tune_linear)
print(svm_model_after_tune_sigmoid)

# svm_model_after_tune_polynomial -> 16 vectors
# svm_model_after_tune_linear -> 23 vectors
# svm_model_after_tune_sigmoid -> 150 vectors