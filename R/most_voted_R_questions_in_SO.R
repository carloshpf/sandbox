# Most voted R questions in SO
#   https://stackoverflow.com/questions/tagged/r?sort=votes

# How to sort a dataframe by column(s)
# Sort by column z (descending) then by column b (ascending)

dd <- data.frame(b = factor(c("Hi", "Med", "Hi", "Low"), levels = c("Low", "Med", "Hi"), ordered = TRUE),
                 x = c("A", "D", "A", "C"), y = c(8, 3, 9, 9), z = c(1, 1, 1, 2))

# Solution 1
ordered <- dd[with(dd, order(-z, b)), ]

# Solution 2
ordered2 <- dd[order(-dd[, 4], dd[, 1]), ]

# Solution using data.table package
library(data.table)
ordered3 <- setorder(dd, -z, b)