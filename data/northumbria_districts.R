delayedAssign("northumbria_districts", local({
  try(
    sf::read_sf(
      system.file("extdata/northumbria_districts.geojson", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
