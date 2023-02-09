# Load packages
library(janitor)
library(sf)
library(tidyverse)

# Note: all ONS datasets should be the 'BGC' variants so the boundaries are
# clipped to mean high water on the coast



# Districts --------------------------------------------------------------------

# Source: https://geoportal.statistics.gov.uk/datasets/ons::local-authority-districts-december-2022-boundaries-uk-bgc/about
notts_districts <- read_sf("https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Local_Authority_Districts_December_2022_Boundaries_UK_BGC/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson") |>
  clean_names() |>
  select(district_code = lad22cd, district_name = lad22nm) |>
  filter(district_name %in% c(
    "Ashfield", "Bassetlaw", "Broxtowe", "Gedling", "Mansfield",
    "Newark and Sherwood", "Nottingham", "Rushcliffe"
  )) |>
  write_sf("inst/extdata/nottinghamshire_districts.gpkg") |>
  glimpse()



# Wards ------------------------------------------------------------------------

# Source: https://geoportal.statistics.gov.uk/datasets/ons::wards-december-2022-boundaries-gb-bgc/about
nottingham_wards <- read_sf("https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Wards_December_2022_Boundaries_GB_BGC/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json") |>
  clean_names() |>
  filter(wd22cd %in% c(
    "E05012270", "E05012271", "E05012272", "E05012273", "E05012274",
    "E05012275", "E05012276", "E05012277", "E05012278", "E05012279",
    "E05012280", "E05012281", "E05012282", "E05012283", "E05012284",
    "E05012285", "E05012286", "E05012287", "E05012288", "E05012289"
  )) |>
  select(ward_code = wd22cd, ward_name = wd22nm) |>
  write_sf("inst/extdata/nottingham_wards.gpkg") |>
  glimpse()



# Crime data -------------------------------------------------------------------

# The only persistent URLs for police.uk data are for national archives, so we
# have to download data for the whole country and then filter
temp_data_file <- tempfile(fileext = ".zip")
temp_data_dir <- str_glue("{tempdir()}/crime_data")
GET(
  "https://data.police.uk/data/archive/2022-12.zip",
  write_disk(temp_data_file),
  progress(),
  timeout(6000)
)
unzip(zipfile = temp_data_file, exdir = temp_data_dir)

# We need multiple crime types, so we will do all the other processing first
# then filter by crime type into separate objects
notts_crimes <- temp_data_dir |>
  dir("nottinghamshire-street.csv$", full.names = TRUE, recursive = TRUE) |>
  map(read_csv, show_col_types = FALSE) |>
  bind_rows() |>
  clean_names() |>
  separate(month, into = c("year", "month"), sep = "-", convert = TRUE) |>
  filter(
    falls_within == "Nottinghamshire Police",
    year == 2022
  ) |>
  mutate(
    across(c(longitude, latitude), round, digits = 4),
    location = str_remove(location, "^On or near "),
    month = as.Date(str_glue("{year}-{month}-01"))
  ) |>
  remove_missing(vars = c("longitude", "latitude")) |>
  st_as_sf(
    coords = c("longitude", "latitude"),
    crs = "EPSG:4326",
    remove = FALSE
  ) |>
  st_intersection(
    select(notts_districts, district = district_name, geometry)
  ) |>
  st_drop_geometry() |>
  select(month, crime_type, longitude, latitude, location, lsoa_code, district)


## Burglary ----
nottingham_burglary <- notts_crimes |>
  filter(
    district == "Nottingham",
    crime_type == "Burglary"
  ) |>
  select(-crime_type, -district) |>
  write_csv("inst/extdata/nottingham_burglary.csv.gz") |>
  glimpse()


## Robbery ----
nottingham_robbery <- notts_crimes |>
  filter(
    district == "Nottingham",
    crime_type == "Robbery"
  ) |>
  select(-crime_type, -district) |>
  write_csv("inst/extdata/nottingham_robbery.csv.gz") |>
  glimpse()



usethis::use_data(
  nottingham_burglary,
  nottingham_robbery,
  nottingham_wards,
  overwrite = TRUE
)
