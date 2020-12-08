#!/usr/bin/env Rscript
library(arules)

lotto <- read.table("lotto.txt", header = T, sep = ",")
head(lotto)

to_matrix <- function(lotto) {
    list <- list()
    for(i in 1:nrow(lotto)) {
        vector <- c()
        for(i2 in 2:ncol(lotto[i,])) {
            vector <- c(vector, toString(lotto[i,i2]))
        }
        list[[i]] <- vector
    }
    return(list)
}

lotto.list <- to_matrix(lotto)
trs <- as(lotto.list, "transactions")

rules <- apriori(trs, parameter = list(support = 0.5, target="frequent itemsets", minlen=1))

inspect(rules)