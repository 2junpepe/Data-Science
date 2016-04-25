setwd("Y:/4-1/데이터과학 00/과제/week4")

library(ggplot2)

rank = read.csv('./station_kor.csv', fileEncoding = "UTF-8", header=TRUE, sep=',')

rent_station <- rank$DISTRICT

rent_station_table <- table(rent_station)

result <- as.data.frame(rent_station_table)
station <- result$rent_station
count <- result$Freq

qplot(station, count, color=station, size=count)
