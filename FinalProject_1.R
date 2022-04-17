library("rvest")

url <- "https://investorplace.com/2017/12/10-best-of-the-best-stocks-to-buy-for-2018/"

webpage <- read_html(url)

stock_ticker_html <- html_nodes(webpage,".stock-ticker")

stock_ticker <- html_text(stock_ticker_html)

head(stock_ticker)
