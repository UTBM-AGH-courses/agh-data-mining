#!/usr/bin/env Rscript

library(e1071)
library(purrr)
library(dplyr)

data("iris")
glimpse(iris)

iris.x <- select(iris, -Species)
iris.y <- iris$Species

set.seed(123)
svmfit <- svm(x = iris.x, y = iris.y, kernel = "linear", cost = 10, scale = FALSE)
print(svmfit)
svmfit_2 <- svm(Species ~ ., data = iris, kernel = "linear", cost = 10, scale = FALSE)
summary(svmfit_2)
svm_model_after_tune <- svm(Species ~ ., data = iris, kernel = "radial", cost = 10^(-1:2), gamma=c(.5, 1, 2), scale = FALSE)
summary(svm_model_after_tune)
png(file = "svm_iris.png")
plot(svmfit_2, data = iris, formula = Sepal.Width ~ Petal.Width)
png(file = "svm_iris_after_tune.png")
plot(svm_model_after_tune, data = iris, formula = Sepal.Width ~ Petal.Width)

# 17 vectors against 96 after tunning