delayedAssign("lancashire_districts", local({
  try(
    sf::read_sf(
      system.file("extdata/lancashire_districts.geojson", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
