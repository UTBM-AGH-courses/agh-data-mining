#!/usr/bin/env Rscript

# 1)
# 1->2
# 2->3       3->4      {3,2} -> 2     
# 3->4  ===> 2->3 ===> {3,5} -> 2 ===> {2,5} ===> STOP
# 4->1       5->3      {2,5} -> 3
# 5->3

# We can detect 3 rules

# 2)
# sup({3,2}) = sup({3,5}) = 2/4
# conf({3,2}) = conf({3,5}) = 2/3

# sup({2,5}) = 3/4
# conf({2,5}) = 1

# There are two values for the confident : 2/3 and 1

# 3)
# The confidence of 1-elemental is always equal to 1
