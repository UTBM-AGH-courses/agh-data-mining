#!/usr/bin/env Rscript

library(e1071)
library(purrr)
library(dplyr)

data("iris")

iris.x <- select(iris, -Species)
iris.y <- iris$Species

set.seed(123)
svmfit_linear_c3 <- svm(x = iris.x, y = iris.y, kernel = "linear", cost = 3, scale = FALSE)
svmfit_radial_c2 <- svm(x = iris.x, y = iris.y, kernel = "radial", cost = 2, scale = FALSE)
svmfit_sigmoid_c2 <- svm(x = iris.x, y = iris.y, kernel = "sigmoid", cost = 2, scale = FALSE)
print(svmfit_linear_c3)
print(svmfit_radial_c2)
print(svmfit_sigmoid_c2)

# svmfit_linear_c3 -> 20 vectors
# svmfit_radial_c2 -> 37 vectors
# svmfit_sigmoid_c2 -> 150 vectors