delayedAssign("czechia_collisions", local({
  try(
    sf::read_sf(
      system.file("extdata/czechia_collisions.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
