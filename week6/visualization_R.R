setwd("Y:/4-1/데이터과학 00/과제/week6")

library(rjson)
library(googleVis)

data <- fromJSON(file ="data_heart.json")

data_temp <- data$`activities-heart-intraday`
temp <- data_temp$dataset

len <- 24
value_vector <- rep(0, len)
hourCount_vector <- rep(0, len)
result_vector <- rep(0, len)
time_vector <- seq(1, len)

for(i in 1:length(temp))
{
  time = as.integer(substring(temp[i][[1]]$time, 0, 2))
  value = as.integer(temp[i][[1]]$value)
  value_vector[time] = value_vector[time] + value
  hourCount_vector[time] = hourCount_vector[time]+1
}

for(i in 1:24)
{
  result_vector[i] = value_vector[i]/hourCount_vector[i]
}

df = data.frame(time_vector, result_vector)

line <- gvisSteppedAreaChart(df, xvar="time_vector", yvar="result_vector", options=list(isStacked=TRUE))

plot(line)