# https://investorplace.com/2017/12/10-best-of-the-best-stocks-to-buy-for-2018/ 
# Gather stock symbols,
# write program that scrapes Yahoo finance for specific financial statistics related to your set of stock symbols.
# ALGN, COHR, ANET, ABMD, TREX, WLK, PAYC, PPC, FIVE, NVDA

library("rvest")
library("dplyr")

stockprice <- "https://investorplace.com/2017/12/10-best-of-the-best-stocks-to-buy-for-2018/"
read_html(stockprice)

