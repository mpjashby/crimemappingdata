delayedAssign("chicago_police_districts", local({
  try(
    sf::read_sf(
      system.file("extdata/chicago_police_districts.kml", package = "crimemappingdata")
    ),
    silent = TRUE
  )
}))
