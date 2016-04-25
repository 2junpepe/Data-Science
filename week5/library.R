setwd("Y:/4-1/데이터과학 00/과제/week5")

library(ggmap)
library(ggplot2)

loc = read.csv('./encoding_library.csv', fileEncoding = "UTF-8", header=TRUE, sep=',')

head(loc)

kor <- get_map("seoul", zoom=11, maptype = "terrain")

kor.map <- ggmap(kor) + geom_point(data=loc, aes(x=LONGITUDE, y=LATITUDE), size=5, alpha=0.7)

kor.map + geom_text(data=loc, aes(x=LONGITUDE, y=LATITUDE+0.005, label=LIB_NM),size=2.25)