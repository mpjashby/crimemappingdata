delayedAssign("cdmx_alcaldias", local({
  try(
    sf::read_sf(
      system.file("extdata/cdmx_alcaldias.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
