# 정원혁 2014 R 기초
rm(list=ls())

setwd("E:/1.MyDoc/bigData/wonhyukR01")
setwd("/media/h3data/1.MyDoc/bigData/wonhyukR01")


# install.packages("ggmap")
library(ggmap)

# 아래 둘 중 되는 것으로 한다. 유닉스/ 윈도우의 차이. 
loc <- read.csv("지역별장애인도서관정보.csv",header=T)
loc <- read.csv("지역별장애인도서관정보.csv",header=T, fileEncoding="UTF-8") 
# 저 csv 파일에 들어가는 위도 경도, 그리고 "자치구명" 정도의 데이터만 있으면 내가 원하는 정보를 지도에 그릴 수 있다.

head(loc)

kor <- get_map("seoul", zoom=11, maptype = "roadmap") # 지도를 가져온다.
# zoom = 7 이면 전국 지도(남한), 11이면 한 도시 표현에 적합하다.

kor.map <- ggmap(kor)+geom_point(data=loc, aes(x=LON, y=LAT),size=5,alpha=0.7) # 지도에 좌표를 그린다.
# data = loc에서 loc에 읽어온 데이터를 사용함을 지시한다.
# LON, LAT는 loc에 있던 컬럼(변수) 이름이다. 각각 위도, 경도를 가지고 있다.

kor.map + geom_text(data=loc, aes(x = LON, y = LAT+0.01, label=자치구명),size=3) # 지도에 레이블을 출력하고 실제로 화면에 그린다.


# ggsave("g:/temp/r_temp/lib.png",dpi=500)
