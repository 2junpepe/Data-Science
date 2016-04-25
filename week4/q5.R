setwd("Y:/4-1/데이터과학 00/과제/week4")

library(ggplot2)

rank = read.csv('./tashu_kor.csv', fileEncoding = "UTF-8", header=TRUE, sep=',')

rent <- rank$RENT_DATE

rent_week <- substr(rent, 1, 8)
rent_week <- as.character.Date(rent_week)

temp_week <- as.Date(rent_week, format = "%Y%m%d")
week <- weekdays(temp_week)

rent_week_table <- table(week)

result <- as.data.frame(rent_week_table)
weekday <- result$week
count <- result$Freq

qplot(weekday, count, color=weekday, size=count)