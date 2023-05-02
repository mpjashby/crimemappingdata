delayedAssign("nyc_precincts", local({
  try(
    sf::read_sf(
      system.file("extdata/nyc_precincts.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
