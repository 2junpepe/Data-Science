setwd("Y:/4-1/데이터과학 00/과제/week4")

library(ggplot2)

rank = read.csv('./tashu_kor.csv', fileEncoding = "UTF-8", header=TRUE, sep=',')

rent <- rank$RENT_DATE
rent_hour <- substr(rent, 9, 10)
rent_hour <- as.integer(rent_hour)
hour <- table(rent_hour)

result <- as.data.frame(hour)
hour <- result$rent_hour
count <- result$Freq

qplot(hour, count, color=hour, size=count)