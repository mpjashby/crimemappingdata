delayedAssign("qld_police_divisions", local({
  try(
    sf::read_sf(
      system.file("extdata/qld_police_divisions.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
