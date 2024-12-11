#' View a country's population.
#'
#' Displays a graph of a UN country's population from the years 1950 to 2020
#'
#' @param country A string containing the name of a UN country
#' @return A ggplot2 graph with a line showing the country's population over time.
#' @examples
#' CountryPopulation('Russian Federation' )
#' CountryPopulation( 'United States of America' )
#' @export



CountryPopulation <- function( country ){

  library( tidyverse )
  library( stringr )

  present <- str_equal( World_Population$CountryName, country )
  if( !any(present) ){
    return( 'Error: provided country name not found in UN database')
  }

  conpop <- World_Population %>%
    filter( CountryName==country ) %>%
    pivot_longer( !CountryName, names_to='Year', values_to='Population' )

  conpop$Population <- as.numeric( conpop$Population )
  conpop$Year <- as.numeric( conpop$Year )

  Graph <- conpop %>%
    ggplot( aes(x=Year, y=Population) ) +
    geom_line() +
    labs( title=str_c(country), x='Year', y='Population(in thousands)' )

  return( Graph )
}
