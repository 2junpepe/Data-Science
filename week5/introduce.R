setwd("Y:/4-1/데이터과학 00/과제/week5")

library(KoNLP)
library(wordcloud)
library(rJava)
library(RColorBrewer)

txt <- readLines("./introduce.txt", encoding="UTF-8")

place <- sapply(txt, extractNoun, USE.NAMES = F)

head(unlist(place), 30)
c <- unlist(place)

place <- Filter(function(x) {nchar(x) >=2}, c)

write(unlist(place), "introduce_2.txt")
rev <- read.table("introduce_2.txt")

nrow(rev)

wordcount <- table(rev)

head(sort(wordcount, decreasing=T),30)

palete <- brewer.pal(9,"Set1") 

wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.7,min.freq=1, random.order=F,random.color=T,colors=palete)
