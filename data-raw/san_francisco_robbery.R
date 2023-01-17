library(tidyverse)

san_francisco_robbery <- crimedata::get_crime_data(
  years = 2019,
  cities = "San Francisco",
  type = "core"
) |>
  filter(offense_type == "personal robbery") |>
  select(uid, offense_type, date_time = date_single, longitude, latitude) |>
  write_csv("inst/extdata/san_francisco_robbery.csv")

usethis::use_data(san_francisco_robbery)
