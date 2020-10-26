#!/usr/bin/env Rscript

year <- c(1992, 1994, 1998, 2002, 2006, 2010)
city <- c('Albertville', 'Lillehammer', 'Nagano', 'Salt Lake City', 'Torino', 'Vancouver')
number_of_diciplines <- c(57, 61, 68, 78, 84, 86)
pres <- c('F. Mitterand', 'King Harald V', 'Emperor Akihito', 'President G.Bush', 'President C. Ciampi', 'Governor General M.Jean')


data <- data.frame(year, city, number_of_diciplines, pres)
data_pres <- data$pres

more_than_78_disiplines <- subset(data, number_of_diciplines > 78)
more_than_78_disiplines

more_than_mean_disiplines <- subset(data, number_of_diciplines > mean(data$number_of_diciplines))
more_than_mean_disiplines