#!/usr/bin/env Rscript

florist <- read.table("florist.txt", header = T, sep = ",")

bouquet_by_week <- aggregate(florist$price, by = list(florist$bouquet, florist$week, florist$year), FUN = length)
names(bouquet_by_week) <- c('bouquet', 'week', 'year', 'total')
bouquet_by_week <- bouquet_by_week[order(bouquet_by_week$year, bouquet_by_week$week),]

florist_by_week <- aggregate(florist$price, by = list(florist$bouquet, florist$week, florist$year), FUN = sum)
names(florist_by_week) <- c('bouquet', 'week', 'year', 'total')
florist_by_week <- florist_by_week[order(florist_by_week$year, florist_by_week$week),]

cut_bouquet_by_week <- cut(bouquet_by_week$total, labels=c("low_sale", "normal_sale", "high_sale", "extreme_sale"), breaks=c(0, 30, 100, 150, 300))
table_cut <- table(cut_bouquet_by_week)
summary(cut_bouquet_by_week)
png("hist_2.7.png")
plot(table_cut)
cor(data.frame(bouquet_by_week$total, florist_by_week$total), method = "pearson")

# Results are completly correlated