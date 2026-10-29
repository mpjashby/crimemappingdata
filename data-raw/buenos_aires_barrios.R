# Load packages
library(tidyverse)
library(sf)

# Download data to a temporary file
request(
  "https://cdn.buenosaires.gob.ar/datosabiertos/datasets/innovacion-transformacion-digital/barrios/barrios.geojson"
) |>
  req_timeout(600) |>
  req_perform(path = data_file <- tempfile(fileext = ".geojson"))

buenos_aires_barrios <- data_file |>
  sf::read_sf() |>
  janitor::clean_names() |>
  select(id, nombre, comuna, area_metro, geometry) |>
  sf::st_make_valid() |>
  # Save version for access via URL
  sf::write_sf("inst/extdata/buenos_aires_barrios.gpkg")

# Save version for package
usethis::use_data(buenos_aires_barrios, overwrite = TRUE, compress = "xz")
