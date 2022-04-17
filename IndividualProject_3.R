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

pages = data.frame()

for (page_result in seq(from = 1, to = 51, by = 50)) {
  link = paste0("https://bookdown.org/yihui/blogdown/", 
                page_result, "&ref_=adv_nxt")
  page = read_html(link)
  
  print(paste("Page:", page_result))  
}
