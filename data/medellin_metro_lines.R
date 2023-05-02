delayedAssign("medellin_metro_lines", local({
  try(
    sf::read_sf(
      system.file("extdata/medellin_metro_lines.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
