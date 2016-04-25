rm(list=ls())
setwd("C:/Users/Youngseok/Dropbox/R")

# adr <- file("56 안철수.txt", blocking=F, encoding = "UTF-8") #글씨 깨어진다면 encoding 바꾸어야 한다.
# adr <- file("56 박근혜.txt", blocking=F, encoding = "UTF-8") #글씨 깨어진다면 encoding 바꾸어야 한다.
adr <- file("56 노무현.txt", blocking=F, encoding = "UTF-8") #글씨 깨어진다면 encoding 바꾸어야 한다.
adr2 <- readLines(adr); head(adr2)
# adr2  <- readLines("56 노무현.txt", , FileEncoding = "UTF-8") 
close(adr)
# warnings()

library(KoNLP)
library(wordcloud)
library(plyr)
 
# ?useSejongDic
useSejongDic() #세종 사전을 사용. 한글 단어 사전이다.

# ?mergeUserDic 
#mergeUserDic(data.frame("안철수", "ncn")) # 세종 사전에 없는 단어를 추가할때.
mergeUserDic(data.frame(c('안철수', '박근혜', '노무현', '정규직'), c('nqpc')))   # 세종 사전에 없는 단어를 추가할때.
 
nouns <- sapply(adr2, extractNoun, USE.NAMES=F)   # 각 줄에서 명사만 추출해 낸다. KoNLP의 함수다
head(nouns)

# 불필요한 글자를 제거한다. 한 글자로 된 명사들은 분석에 불필요하다.
# nouns <- gsub("저|수|들","",nouns)  
# 또는 아래와 같이 아예 한 글자로 된 모든 단어를 제거 한다.
c <- unlist(nouns) # 필터링을 위해 unlist 작업을 해서 저장합니다.
nouns <- Filter(function(x) {nchar(x) >= 2} ,c) # 두 글자 이상 되는 것만 필터링하기
head(nouns)

nouns <- gsub(" |\\d+","", nouns) # 숫자 없애기 
c <- unlist(nouns) # 필터링을 위해 unlist 작업을 해서 저장합니다.
nouns <- Filter(function(x) {nchar(x) >= 2} ,c) # 두 글자 이상 되는 것만 필터링하기

wordcount <- table(unlist(nouns))
head(sort(wordcount, decreasing=T),30) # 그냥 확인해 보려고

pal <- brewer.pal(12,"Set3")
pal <- pal[-c(1:2)]
# 폰트 세팅
# windowsFonts(malgun=windowsFont("맑은 고딕")) 
# 윈도우즈 폰트데이터베이스에서 찾을 수 없는 폰트페밀리입니다 
# 라는 오류가 나타나면 설정한다.
wordcloud(names(wordcount), freq=wordcount, scale=c(7, 0.2), min.freq=4, random.order=F,  random.color=F, rot.per=.2,
          colors=pal) 
# warnings()
