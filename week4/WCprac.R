setwd("Y:/4-1/데이터과학 00/과제/week4")

text <- file("./WCprac.txt", blocking=F, encoding = "UTF-8")
text2 <- readLines(text); head(text2)
close(text)

library(KoNLP)
library(wordcloud)
library(plyr)

useSejongDic()

mergeUserDic(data.frame(c('안철수', '박근혜', '노무현', '정규직'), c('nqpc')))   # 세종 사전에 없는 단어를 추가할때.

nouns <- sapply(text2, extractNoun, USE.NAMES = F)
head(nouns)

c <- unlist(nouns)
nouns <- Filter(function(x) {nchar(x) >=2}, c)
head(nouns)

nouns <- gsub(" |\\d+", "", nouns)
c <- unlist(nouns)
nouns <- Filter(function(x) {nchar(x) >=2}, c)

wordcount <- table(unlist(nouns))
head(sort(wordcount, descreasing=T), 30)

pal <- brewer.pal(12, "Set3")
pal <- pal[-c(1:2)]

wordcloud(names(wordcount), freq=wordcount, scale=c(7, 0.2), min.freq=4, random.order=F, random.color=F, rot.per=2, colors=pal)
