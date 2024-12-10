library(readxl)
library(tidyverse)

World_Population <- read_excel( 'C:/Users/jacks/Grad School/Coursework/STA445/SchererWorldPopulation/data-raw/World_Population.xlsx', sheet='ESTIMATES' )

#Remove all the unnecessary formatting in the first 11 rows
World_Population <- World_Population %>%
  slice( 12:301 )

#Turn the first row values into the column names
colnames( World_Population ) <- World_Population[1,]

#Remove first row, filter for rows that describe countries, select the columns that describe years or the country identifier, rename the country identifier column
World_Population <- World_Population %>%
  rename( 'CountryName' = 'Region, subregion, country or area *' ) %>%
  filter( Index!='Index' ) %>%
  filter( Type=='Country/Area' ) %>%
  select( CountryName, starts_with('19'), starts_with('20') )

# Save the data frame to the data/directory as World_Population.rda
usethis::use_data( World_Population )

