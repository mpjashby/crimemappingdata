# Load packages
library(tidyverse)
library(sf)


# STATIONS ---------------------------------------------------------------------

# Download data to a temporary file
request(
  "https://cdn.buenosaires.gob.ar/datosabiertos/datasets/sbase/subte-estaciones/estaciones_de_subte.geojson"
) |>
  req_perform(path = data_file <- tempfile(fileext = ".geojson"))

# Load and process data
buenos_aires_subte_stations <- read_sf(data_file) |>
  st_transform("EPSG:5348") |>
  # Write version for access via URL
  write_sf("inst/extdata/buenos_aires_subte_stations.geojson")

# Save version for package
usethis::use_data(buenos_aires_subte_stations)


# LINES ------------------------------------------------------------------------

# Download data to a temporary file
request(
  "https://cdn.buenosaires.gob.ar/datosabiertos/datasets/sbase/subte-estaciones/red_subte.geojson"
) |>
  req_perform(path = data_file <- tempfile(fileext = ".geojson"))

buenos_aires_subte_lines <- read_sf(data_file) |>
  st_transform("EPSG:5348") |>
  # Write version for access via URL
  write_sf("inst/extdata/buenos_aires_subte_lines.gpkg")

# Save version for package
usethis::use_data(buenos_aires_subte_lines)
