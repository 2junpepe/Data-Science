setwd("Y:/4-1/데이터과학 00/과제/week6")

library(googleVis)

data <- read.csv("./visual_R.csv", fileEncoding = "UTF-8", header=TRUE)
head(data)

result <- gvisColumnChart(data)

plot(result)
