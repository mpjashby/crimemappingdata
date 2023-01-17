# Load packages
library(lubridate)
library(tidyverse)

# Source: https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Historic-/833y-fsy8
nyc_shootings <- read_csv("https://data.cityofnewyork.us/api/views/833y-fsy8/rows.csv?accessType=DOWNLOAD") |>
  janitor::clean_names() |>
  mutate(occur_date = mdy(occur_date)) |>
  filter(year(occur_date) == 2019) |>
  select(
    incident_key,
    boro,
    occur_date,
    murder = statistical_murder_flag,
    longitude,
    latitude
  ) |>
  arrange(incident_key, occur_date) |>
  write_csv("inst/extdata/nyc_shootings.csv")

bronx_shootings <- shootings_nyc |>
  filter(boro == "BRONX") |>
  select(-boro) |>
  write_csv("inst/extdata/bronx_shootings.csv")

usethis::use_data(nyc_shootings, bronx_shootings)
