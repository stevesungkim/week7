library(stringr)
library(janeaustenr)
library(dplyr)
library(tidytext)
library(ggplot2)
install.packages("ggwordcloud")
library(ggwordcloud)

AllBooksContent <- readLines('/Users/stevesungkim/Documents/DESC620/week7/AllBooksContent.csv', encoding = 'UTF-8')
head(AllBooksContent)
str(AllBooksContent)

AllBooksContent <- as_tibble(AllBooksContent)
head(AllBooksContent)



AllBooksContent_rev <- AllBooksContent %>% 
  unnest_tokens(input = value,
                output = word,
                token = 'words') %>%
  filter(
    !str_detect(word, pattern = "\\d"),
    !str_detect(word, pattern = "you’re")
  )


data(stop_words)

AllBooksContent_rev <- AllBooksContent_rev %>% anti_join(stop_words, by = "word")
AllBooksContent_rev


print(AllBooksContent_rev)

AllBooksContent_rev <- AllBooksContent_rev %>% 
  count(word, sort = T)
head(AllBooksContent_rev)


AllBooksContent_rev <- AllBooksContent_rev %>% 
  filter(str_count(word) > 1)


top20 <- AllBooksContent_rev %>% head(20)
print(top20)


ggplot(top20, aes(x = reorder(word, n), y = n)) + geom_col() +
  coord_flip() + geom_text(aes(label = n), hjust = -0.3) +
  labs(title = 'All books Contents Word Frequency', 
       x = NULL, y = NULL) + 
  theme(title = element_text(size = 11))


# ggplot(AllBooksContent_rev, aes(label = word, size = n, col = n)) +
#   geom_text_wordcloud(seed = 143) + 
#   scale_radius(limits = c(3, NA), 
#                range = c(3, 30)) + 
#   scale_color_gradient(low = '#66aaf2', 
#                        high = '#004EA1') +
#   theme_minimal()

