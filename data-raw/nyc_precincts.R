# Source: https://data.cityofnewyork.us/Public-Safety/Police-Precincts/78dh-3ptz
nyc_precincts <- sf::st_read("https://opendata.arcgis.com/datasets/c35786feb0ac4d1b964f41f874f151c1_0.geojson") |>
  dplyr::select(OBJECTID, Precinct, geometry) |>
  sf::st_write("inst/extdata/nyc_precincts.gpkg")

usethis::use_data(nyc_precincts)
