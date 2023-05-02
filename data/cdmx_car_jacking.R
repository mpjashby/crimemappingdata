delayedAssign("cdmx_car_jacking", local({
  try(
    sf::read_sf(
      system.file("extdata/cdmx_car_jacking.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
