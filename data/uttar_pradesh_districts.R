delayedAssign("uttar_pradesh_districts", local({
  try(
    sf::read_sf(
      system.file("extdata/uttar_pradesh_districts.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
