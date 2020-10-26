#!/usr/bin/env Rscript

florist <- read.table("florist.txt", header = T, sep = ",")

florist_by_week <- aggregate(florist$price, by = list(florist$bouquet, florist$week, florist$year), FUN = sum)
names(florist_by_week) <- c('bouquet', 'week', 'year', 'total')
florist_by_week <- florist_by_week[order(florist_by_week$year, florist_by_week$week),]
cut_florist_by_week <- cut(florist_by_week$total, labels=c("low_sale", "normal_sale", "high_sale", "extreme_sale"), breaks=c(0, 1000, 2000, 3000, 10000))
table_cut <- table(cut_florist_by_week)
summary(cut_florist_by_week)
png("hist_2.6.png")
plot(table_cut)