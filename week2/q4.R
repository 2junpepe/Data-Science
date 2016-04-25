library(MASS)
library(ggplot2)

ggplot(Cars93, aes(x=Type)) + geom_bar(fill="white", colour="black") + ggtitle("Bar Chart of Frequency by Car Type")
Cars93