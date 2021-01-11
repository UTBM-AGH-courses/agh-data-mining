#!/usr/bin/env Rscript
library(ggplot2)

florist <- read.table("../Lab\ 3/florist.txt", header = T, sep = ",")

sub_florist <- florist[sample(nrow(florist), 20), ]
sub_florist
linear_reg_florist <- lm(month ~ bouquet, data = sub_florist)
summary(linear_reg_florist)
png(file = "florist_plot.png")
ggplot(data = sub_florist, mapping = aes(x = month, y = bouquet)) + geom_point(color="blue") + geom_smooth(method='lm', formula= y~x,  color="red")

usa <- data.frame(USArrests)
linear_reg_usa <- lm(Assault ~ Murder, data = usa)
summary(linear_reg_usa)
png(file = "usa_plot.png")
ggplot(data = usa, mapping = aes(x = Murder, y = Assault)) + geom_point(color="blue") + geom_smooth(method='lm', formula= y~x, color="red")

# Assault = Murder * 15.34 + 51.27