#!/usr/bin/env Rscript
library(arules)
library(arulesViz)

groceries <- read.transactions("groceries.txt", format=c("basket"), header = FALSE, sep = ",")

itemsets.fi <- apriori(groceries, parameter = list(support=0.01, target="frequent itemsets"))
inspect(subset(itemsets.fi, items %in% c("whole milk", "yogurt")))
inspect(subset(itemsets.fi, items %ain% c("whole milk", "yogurt")))
inspect(subset(itemsets.fi, items %oin% c("whole milk", "yogurt")))

itemsets.mfi <- apriori(groceries, parameter = list(support=0.01, target="maximally frequent itemsets"))
inspect(subset(itemsets.mfi, items %in% c("tropical fruit")))

itemsets.cfi <- apriori(groceries, parameter = list(support=0.01, target="closed frequent itemsets"))
inspect(subset(itemsets.cfi, items %in% c("tropical fruit")))

itemsets.r <- apriori(groceries, parameter = list(support = 0.01, confidence=0.25, target="rules"))
inspect(subset(itemsets.r, rhs %in% c("whole milk", "yogurt")))
inspect(subset(itemsets.r, lhs %in% c("whole milk", "yogurt")))
inspect(subset(itemsets.r, lhs %ain% c("whole milk", "yogurt")))
inspect(subset(itemsets.r, lhs %oin% c("whole milk", "yogurt")))