library(sf)
library(tidyverse)

# Source: https://data.cityofchicago.org/Public-Safety/Boundaries-Police-Beats-current-/aerh-rz74
chicago_districts <- read_sf("https://data.cityofchicago.org/api/geospatial/aerh-rz74?method=export&format=GeoJSON") |>
  st_transform("EPSG:26916") |>
  group_by(district) |>
  summarise() |>
  mutate(district = parse_number(district))

assaults <- crimedata::get_crime_data(
  years = 2010:2019,
  cities = "Chicago",
  type = "core"
) |>
  filter(offense_code == "13A", !is.na(date_single)) |>
  select(date = date_single, location_category, longitude, latitude)

chicago_aggravated_assaults <- assaults |>
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326, remove = FALSE) |>
  st_transform("EPSG:26916") |>
  st_join(chicago_districts) |>
  st_drop_geometry() |>
  drop_na(everything()) |>
  # Reduce the specificity of some of the data, to reduce the file size. This
  # shouldn't affect how the data is being loaded because it's being stored in
  # CSV format, so date-times are stored as characters and co-ordinates as
  # numbers.
  mutate(
    across(c(longitude, latitude), ~ round(., digits = 4)),
    date = str_sub(as.character(date), end = -4)
  ) |>
  rename(loc_cat = location_category) |>
  write_csv("inst/extdata/chicago_aggravated_assaults.csv.gz") |>
  glimpse()


usethis::use_data(chicago_aggravated_assaults, overwrite = TRUE)
