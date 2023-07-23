library(sf)
library(tidyverse)

# Note: this dataset is not exported as R data or documented

# Source: https://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/administrative-units-statistical-units/nuts
# Data are behind a web form, so we have to download manually and then load. The
# data used here are NUTS 2021 regions in geoJSON polygon format, to 1m
# resolution and EPSG:3857.

brno_boundary <- RCzechia::orp_polygony() |>
  janitor::clean_names() |>
  filter(str_detect(naz_orp, "Brno")) |>
  select(nuts_id = kod_orp, nuts_name = naz_orp, geometry) |>
  write_sf("inst/extdata/brno_boundary.shp") |>
  glimpse()

old_wd <- getwd()
setwd(here::here("inst/extdata/"))
brno_boundary_files <- dir(pattern = "^brno_boundary")
zip("brno_boundary.zip", files = brno_boundary_files)
file.remove(brno_boundary_files)
setwd(old_wd)
