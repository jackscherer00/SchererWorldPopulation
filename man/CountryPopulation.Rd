% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CountryPopulation.R
\name{CountryPopulation}
\alias{CountryPopulation}
\title{View a country's population.}
\usage{
CountryPopulation(country)
}
\arguments{
\item{country}{A string containing the name of a UN country}
}
\value{
A ggplot2 graph with a line showing the country's population over time.
}
\description{
Displays a graph of a UN country's population from the years 1950 to 2020
}
\examples{
CountryPopulation('Russian Federation' )
CountryPopulation( 'United States of America' )
}
