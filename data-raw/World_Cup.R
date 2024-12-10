library( tidyverse )
library( rvest )
library( stringr )
library( readxl )

url = 'https://en.wikipedia.org/wiki/FIFA_World_Cup'

page <- read_html( url )

attendance <- page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=FALSE, fill=TRUE)

World_Cup <- attendance %>%
  rename( 'Year' = 'X1', 'Hosts' = 'X2', 'Totalattendance' = 'X4', 'Matches' = 'X5', 'Averageattendance' = 'X6' ) %>%
  select( 'Year', 'Hosts', 'Totalattendance', 'Matches', 'Averageattendance' ) %>%
  slice( 3:24 )

World_Cup$Totalattendance =
  str_replace_all( World_Cup$Totalattendance, ',', '' ) %>%
  as.numeric()

World_Cup$Averageattendance =
  str_replace_all( World_Cup$Averageattendance, ',', '' ) %>%
  as.numeric()

World_Cup %>% head()

World_Cup <- World_Cup %>%
  mutate( WorldCup = str_c(Hosts, Year, sep='') ) %>%
  select( 'Totalattendance', 'Averageattendance', 'Matches', 'WorldCup' )

# Save the data frame to the data/directory as World_Cup.rda
usethis::use_data( World_Cup )

