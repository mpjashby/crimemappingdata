library(sf)
library(tidyverse)

# Source: https://data.cityofnewyork.us/Public-Safety/Police-Precincts/78dh-3ptz
st_read("https://opendata.arcgis.com/datasets/c35786feb0ac4d1b964f41f874f151c1_0.geojson") |>
  st_write("inst/extdata/nyc_precincts.gpkg")
