koen=T;data<-'번역'
library(RCurl)
library(RSelenium)
library(XML)
library(rvest)
pJS <- wdman::phantomjs(port = 4567L)
remDr <- remoteDriver(port=4567L, browserName = 'chrome')
remDr$open()

if(koen==T)remDr$navigate(paste0('https://translate.google.co.kr/?hl=#ko/en/'))else remDr$navigate(paste0('https://translate.google.co.kr/?hl=#en/ko/'))
tr<-remDr$findElement(using='css',value='textarea#source')
tr$sendKeysToElement(list(paste(data)))

source<-remDr$getPageSource()[[1]]
a<-read_html(source)%>%html_nodes(css='.short_text')%>%html_text()
a<-paste(a,collapse='')
remDr$goBack()

remDr$close()
pJS$stop()




