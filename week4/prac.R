setwd("Y:/4-1/데이터과학 00/과제/week4")

library(ggplot2)

rent = read.csv('./tashu_kor.csv', header=TRUE, sep=',')

rent_tashu <- as.numeric(rent$RENT_STATION)
rent_tashu_table <- table(rent_tashu)
rent_tashu_table_sort <- sort(rent_tashu_table, decreasing = TRUE)

temp_count <- rent_tashu_table_sort[1:10]
temp_count
