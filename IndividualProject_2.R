library(rvest)

url <- "https://bookdown.org/yihui/blogdown/"
webpage <- read_html(url)
print(webpage)

navlinks <- webpage|>
  html_elements(".chapter a")|>
  html_text()

navlinks

body_contents <- webpage|>
  html_elements("p")|>
  html_text()

body_contents
