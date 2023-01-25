library(rvest)
library(sf)
library(tidyverse)

# District names vary across sources due to transliteration



# Crime data -------------------------------------------------------------------
# The data is stored behind a web form that asks for information about usage,
# etc., and then produces a very long URL that might be attached to a
# time-limited session ID
# Source: https://data.gov.in/resources/district-wise-crime-under-various-sections-indian-penal-code-ipc-crimes-during-2014

uttar_pradesh_murders <- read_csv("https://data.gov.in/backend/dms/v1/ogdp/resource/file/download/681341/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJkYXRhLmdvdi5pbiIsImF1ZCI6ImRhdGEuZ292LmluIiwiaWF0IjoxNjc0NjAzMDEyLCJleHAiOjE2NzQ2MDMzMTIsImRhdGEiOnsibmlkIjoiNjgxMzQxIn19.L8HSbVV8YCa3ZM_hujOKh3YMTxCf34gQR1ett9s9AsQ") |>
  janitor::clean_names() |>
  select(state = states_u_ts, district, murder) |>
  mutate(across(c(state, district), str_to_title)) |>
  filter(state == "Uttar Pradesh", !district %in% c("Total", "G. R. P.")) |>
  mutate(district = recode(
    district,
    # "Ambedkar Nagar" = "Ambedkarnagar",
    "Badaun" = "Budaun",
    # "Barabanki" = "Bara Banki",
    "Bulandshahar" = "Bulandshahr",
    "Chandoli" = "Chandauli",
    "Fatehgarh" = "Farrukhabad",
    "Gautambudh Nagar" = "Gautam Buddha Nagar",
    "Khiri" = "Lakhimpur Kheri",
    "Kushi Nagar" = "Kushinagar",
    "Raibareilly" = "Rae Bareli",
    "Sant Kabirnagar" = "Sant Kabir Nagar",
    "Sidharthnagar" = "Siddharth Nagar",
    "St.ravidasnagar" = "Sant Ravi Das Nagar(Bhadohi)"
  )) |>
  select(district, murder) |>
  write_csv("inst/extdata/uttar_pradesh_murders.csv") |>
  glimpse()



# District boundaries ----------------------------------------------------------
# Source: https://github.com/HindustanTimesLabs/shapefiles/tree/master/state_ut/uttarpradesh/district

uttar_pradesh_districts <- read_sf("https://github.com/HindustanTimesLabs/shapefiles/raw/master/state_ut/uttarpradesh/district/uttarpradesh_district.json") %>%
  # Two of the districts have invalid geometries in the data, so make these
  # valid first
  st_make_valid() |>
  select(state = state, district_name = district) |>
  mutate(across(c(state, district_name), str_to_title)) |>
  mutate(district_name = recode(
    district_name,
    "Mahamaya Nagar" = "Hathras"
  )) |>
  write_sf("inst/extdata/uttar_pradesh_districts.gpkg") |>
  glimpse()


# Population data --------------------------------------------------------------
uttar_pradesh_population <- read_html("https://en.wikipedia.org/wiki/List_of_districts_of_Uttar_Pradesh") |>
  html_table() |>
  pluck(3) |>
  janitor::clean_names() |>
  rename_with(~ str_remove(., "_\\d$")) |>
  mutate(
    across(c(population, area), parse_number),
    district = recode(
      district,
      "Badaun" = "Budaun",
      "Bagpat" = "Baghpat",
      "Chandauli (Varanasi Dehat)" = "Chandauli",
      "Sant Ravidas Nagar" = "Sant Ravi Das Nagar(Bhadohi)",
      "Shravasti" = "Shrawasti",
      "Siddharthnagar" = "Siddharth Nagar",
      "Varanasi (Kashi)" = "Varanasi"
    )
  ) |>
  select(-map, -police_station) |>
  write_csv("inst/extdata/uttar_pradesh_population.csv") |>
  glimpse()

usethis::use_data(
  uttar_pradesh_murders,
  uttar_pradesh_districts,
  uttar_pradesh_population,
  overwrite = TRUE
)
