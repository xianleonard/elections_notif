library(tidyverse)
library(rvest)

page <- read_html("https://results.lavote.gov/text-results/4269")

page_tables <- page %>%
  html_table() %>%
  unlist(recursive=F)

bad_frame <- do.call(rbind.data.frame,page_tables)

write_csv(bad_frame, "Output/notif.csv")
