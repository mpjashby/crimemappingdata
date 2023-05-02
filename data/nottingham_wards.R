delayedAssign("nottingham_wards", local({
  try(
    sf::read_sf(
      system.file("extdata/nottingham_wards.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
