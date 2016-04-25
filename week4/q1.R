setwd("Y:/4-1/데이터과학 00/과제/week4")

library(ggplot2)

rent = read.csv('./tashu_kor.csv', header=TRUE, sep=',')

rent_tashu <- as.numeric(rent$RENT_STATION)
rent_tashu_table <- table(rent_tashu)
rent_tashu_table_sort <- sort(rent_tashu_table, decreasing = TRUE)
temp_count <- rent_tashu_table_sort[1:10]

result <- as.data.frame(temp_count)
result_count <- result$temp_count
temp_station <- attributes(result)$row.names
top_station <- as.integer(temp_station)

station_rent = read.csv('./station_kor.csv', fileEncoding = "UTF-8", header=TRUE, sep=',')

station_num <- as.numeric(station_rent$STATION)
station_name <- as.character(station_rent$NAME)

result_station <- (c(1:10))

for(i in 1:10){
  result_station[i] <- station_name[top_station[i]]
  print(station_name[top_station[i]])
}

graph <- data.frame(result_count, result_station)
station <- graph$result_station
count <- graph$result_count
  
print(station)
qplot(station, count, color=station)
