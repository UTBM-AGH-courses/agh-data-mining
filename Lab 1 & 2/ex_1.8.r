#!/usr/bin/env Rscript

number_of_diciplines <- c(57, 61, 68, 78, 84, 86)

N1 <- function(vector) {
    (vector - mean(vector))/100
}

N2 <- function(vector) {
    (vector - mean(vector)) * (max(vector) - min(vector))/1000
}

N3 <- function(vector) {
    mid_range <- (max(vector) + min(vector))/2
    sd <- sd(vector)
    (vector - sd)/mid_range
}

N1(number_of_diciplines)
N2(number_of_diciplines)
N3(number_of_diciplines)