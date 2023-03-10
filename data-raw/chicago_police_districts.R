library(sf)
library(tidyverse)

chicago_police_districts <- read_sf("https://data.cityofchicago.org/api/geospatial/fthy-xz3r?method=export&format=GeoJSON") |>
  # KML files only save columns in the data with specific names, so we have to
  # change the names to `Name` and `Description`
  select(Name = dist_num, geometry) |>
  mutate(Description = str_glue("District {Name}")) |>
  write_sf("inst/extdata/chicago_police_districts.kml") |>
  glimpse()

usethis::use_data(chicago_police_districts, overwrite = TRUE)
