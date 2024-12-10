#Check if CountryPopulation() returns an error message if provided with a string that does not match a country in the database.
test_that( 'Error message is thrown appropriately', {
  expect_match( CountryPopulation('lkasdjfldsk'), 'Error: provided country name not found in UN database' )
  expect_match( CountryPopulation('America'), 'Error: provided country name not found in UN database' )
})
