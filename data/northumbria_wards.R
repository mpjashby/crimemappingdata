delayedAssign("northumbria_wards", local({
  try(
    sf::read_sf(
      system.file("extdata/northumbria_wards.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
