setwd("Y:/4-1/데이터과학 00/과제/week4")

library(ggplot2)

rank = read.csv('./tashu_kor.csv', fileEncoding = "UTF-8", header=TRUE, sep=',')

rent <- rank$RENT_DATE
rent_month <- substr(rent, 5, 6)
month <- table(rent_month)

result <- as.data.frame(month)

qplot(month, count, color=month, size=count)