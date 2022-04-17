install.packages("XML")

library("rvest")
library("dplyr")
library("data.table")
library("tidyr")
library("tidyverse")
library("XML")
library("xml2")
library("rvest")
library("httr")
stocks <- c("ALGN","COHR","ANET","ABMD","TREX","WLK","PAYC","PPC","FIVE","NVDA")

for (s in stocks) {
  url <- paste0("https://finance.yahoo.com/quote/", s)
  webpage <- readLines(url)
  html <- htmlTreeParse(webpage, useInternalNodes = TRUE, asText = TRUE)
  tableNodes <- getNodeSet(html, "//table")
  
  
  # ASSIGN TO STOCK NAMED DFS
  assign(s, readHTMLTable(tableNodes[[6]],
                          header= c("earningEstimates", "revenueEstimates", "earningHistory", "epsTrend", "epsRevisions", "growthEst")))
  
  # ADD COLUMN TO IDENTIFY STOCK 
  df <- get(s)
  df['stock'] <- s
  assign(s, df)
}

# COMBINE ALL STOCK DATA 
stockdatalist <- cbind(mget(stocks))
stockdata <- do.call(rbind, stockdatalist)

# MOVE STOCK ID TO FIRST COLUMN
stockdata <- stockdata[, c(ncol(stockdata), 1:ncol(stockdata)-1)]
