#!/usr/bin/env Rscript
library(arules)
library(arulesViz)

titanic_raw <- read.table("titanic.txt", header = T, sep = ",")
head(titanic_raw)

rules <- apriori(titanic_raw, parameter = list(support = 0.25, confidence=0.5, target="rules", minlen = 2))
rules_2 <- apriori(titanic_raw, appearance = list(rhs = c("Survived=No", "Survived=Yes"), default = "lhs"), parameter = list(support = 0.1, confidence=0.5, target="rules", minlen = 2))

inspect(head(sort(rules, by ="lift")))
inspect(head(sort(rules_2, by ="lift")))

png("rules_5.5.png")
plot(rules, measure = "support", shading = "lift")

png("rules2_5.5.png")
plot(rules_2, measure = "support", shading = "lift")