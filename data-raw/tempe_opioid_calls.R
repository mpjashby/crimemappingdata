pacman::p_load(sf, tidyverse)

tempe_opioid_calls <- read_sf("https://services.arcgis.com/lQySeXwbBg53XWDi/arcgis/rest/services/Opioid_Calls/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson") |>
  janitor::clean_names() |>
  st_drop_geometry() |>
  filter(opioid_use == "Yes") |>
  mutate(
    incident_date = as_date(as_datetime(incident_date / 1000)),
    narcan_given = case_match(narcan_given, "Yes" ~ TRUE, "No" ~ FALSE)
  ) |>
  select(
    year,
    incident_date,
    narcan_given,
    latitude = latitude_random,
    longitude = longitude_random
  ) |>
  drop_na(latitude, longitude) |>
  write_csv(here::here("inst/extdata/tempe_opioid_calls.csv"))

usethis::use_data(tempe_opioid_calls, overwrite = TRUE)
