delayedAssign("lancashire_wards", local({
  try(
    sf::read_sf(
      system.file("extdata/lancashire_wards.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
