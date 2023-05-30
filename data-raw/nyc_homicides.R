# Load packages
library(tidyverse)

nyc_homicides <- crimedata::get_crime_data(
  years = 2016:2018,
  cities = "New York",
  type = "core"
) |>
  filter(offense_code == "09A") |>
  select(uid, offense_date = date_single, longitude, latitude) |>
  write_csv(here::here("inst/extdata/nyc_homicides.csv")) |>
  glimpse()

usethis::use_data(nyc_homicides)
