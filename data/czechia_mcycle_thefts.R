delayedAssign("czechia_mcycle_thefts", local({
  try(
    sf::read_sf(
      system.file("extdata/czechia_mcycle_thefts.gpkg", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
