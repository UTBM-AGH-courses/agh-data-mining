#!/usr/bin/env Rscript
lnLength <- c(3.87, 3.61, 4.33, 3.43, 3.82, 3.83, 3.46, 3.76, 3.50, 3.58)
lnWeigth <- c(4.87, 3.93, 6.46, 3.33, 4.38, 4.70, 3.50, 4.50, 3.58, 3.64)

alligator <- data.frame(lnLength, lnWeigth)

head(alligator)
linear_reg <- lm(lnWeigth ~ lnLength)

png(file = "alligator_plot.png")
layout(matrix(c(1,1,2,3),2,2,byrow=T))
plot(alligator)
abline(linear_reg)
# Residual
hist(linear_reg$resid, main="Histogram of Residuals",
 ylab="Residuals")
#Q-Q Plot
qqnorm(linear_reg$resid)
qqline(linear_reg$resid)

summary(linear_reg)

# We get an estimate coefficiant of 3.45. It means that each time
# lnLength grows by one, lnWeigth grows by 3.45
# lnWeigth = lnLength*3.45 - 8.54