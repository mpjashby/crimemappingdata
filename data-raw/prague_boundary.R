library(sf)
library(tidyverse)

# Note: this dataset is not exported as R data or documented

# Source: https://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/administrative-units-statistical-units/nuts
# Data are behind a web form, so we have to download manually and then load. The
# data used here are NUTS 2021 regions in geoJSON polygon format, to 1m
# resolution and EPSG:3857.

praha_boundary <- read_sf("~/Downloads/NUTS_RG_01M_2021_3857.geojson") |>
  janitor::clean_names() |>
  filter(nuts_id == "CZ01") |>
  select(nuts_id, nuts_name, geometry) |>
  write_sf("inst/extdata/praha_boundary.shp") |>
  glimpse()

old_wd <- getwd()
setwd(here::here("inst/extdata/"))
praha_boundary_files <- dir(pattern = "^praha_boundary")
zip("praha_boundary.zip", files = praha_boundary_files)
file.remove(praha_boundary_files)
setwd(old_wd)
