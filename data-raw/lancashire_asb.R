library(httr)
library(janitor)
library(readxl)
library(sf)
library(writexl)
library(tidyverse)

# Note: all ONS datasets should be the 'BGC' variants so the boundaries are
# clipped to mean high water on the coast



# Local authority boundaries ---------------------------------------------------

# Remove existing file, if present
# This is needed because otherwise the rows will be appended
if (file.exists("inst/extdata/lancashire_districts.geojson")) {
  file.remove("inst/extdata/lancashire_districts.geojson")
}

# Source: https://geoportal.statistics.gov.uk/datasets/ons::local-authority-districts-december-2022-boundaries-uk-bfc/explore?location=55.189426%2C-3.316939%2C7.69
lancashire_districts <- read_sf("https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Local_Authority_Districts_December_2022_Boundaries_UK_BGC/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json") |>
  clean_names() |>
  select(objectid = lad22cd, district = lad22nm, geometry) |>
  filter(
    district %in% c(
      "Blackburn with Darwen",
      "Blackpool",
      "Burnley",
      "Chorley",
      "Fylde",
      "Hyndburn",
      "Lancaster",
      "Pendle",
      "Preston",
      "Ribble Valley",
      "Rossendale",
      "South Ribble",
      "West Lancashire",
      "Wyre"
    )
  ) |>
  write_sf("inst/extdata/lancashire_districts.geojson")



# ASB data ---------------------------------------------------------------------

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

lancashire_asb <- temp_data_dir |>
  dir("lancashire-street.csv$", full.names = TRUE, recursive = TRUE) |>
  map(read_csv, show_col_types = FALSE) |>
  bind_rows() |>
  janitor::clean_names() |>
  separate(month, into = c("year", "month"), sep = "-", convert = TRUE) |>
  filter(
    crime_type == "Anti-social behaviour",
    falls_within == "Lancashire Constabulary",
    year == 2022
  ) |>
  mutate(
    across(c(longitude, latitude), \(x) round(x, digits = 4)),
    location = str_remove(location, "^On or near "),
    month = as.Date(str_glue("{year}-{month}-01"))
  ) |>
  remove_missing(vars = c("longitude", "latitude")) |>
  st_as_sf(
    coords = c("longitude", "latitude"),
    crs = "EPSG:4326",
    remove = FALSE
  ) |>
  st_intersection(select(lancashire_districts, geometry)) |>
  st_drop_geometry() |>
  select(month, longitude, latitude, location, lsoa_code) |>
  write_tsv("inst/extdata/lancashire_asb.tab") |>
  glimpse()



# Local authority ward boundaries ----------------------------------------------

# Source:
lancashire_wards <- read_sf("https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Wards_December_2022_Boundaries_GB_BGC/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson", quiet = FALSE) |>
  clean_names() |>
  filter(
    lad22nm %in% c(
      "Blackburn with Darwen",
      "Blackpool",
      "Burnley",
      "Chorley",
      "Fylde",
      "Hyndburn",
      "Lancaster",
      "Pendle",
      "Preston",
      "Ribble Valley",
      "Rossendale",
      "South Ribble",
      "West Lancashire",
      "Wyre"
    )
  ) |>
  select(ward_code = wd22cd, ward_name = wd22nm, geometry) |>
  # Transform the data to make the exercise slightly harder
  st_transform("EPSG:27700") |>
  write_sf("inst/extdata/lancashire_wards.gpkg") |>
  glimpse()



# Ward population data ---------------------------------------------------------

# Source: https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/wardlevelmidyearpopulationestimatesexperimental
ward_pop_file <- str_glue("{tempdir()}/ward_populations.xlsx")
GET(
  "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/wardlevelmidyearpopulationestimatesexperimental/mid2020sape23dt8a/sape23dt8amid2020ward2020on2021lasyoaestimatesunformattedcorrection.xlsx",
  write_disk(ward_pop_file),
  progress(),
  timeout(600)
)

lancashire_ward_pop <- ward_pop_file |>
  read_excel(sheet = "Mid-2020 Persons", skip = 3) |>
  clean_names() |>
  filter(
    la_name_2021_boundaries %in% c(
      "Blackburn with Darwen",
      "Blackpool",
      "Burnley",
      "Chorley",
      "Fylde",
      "Hyndburn",
      "Lancaster",
      "Pendle",
      "Preston",
      "Ribble Valley",
      "Rossendale",
      "South Ribble",
      "West Lancashire",
      "Wyre"
    )
  ) |>
  select(gss_code = ward_code_1, ward = ward_name_1, population = all_ages) |>
  glimpse()

# `write_xlsx()` does not silently return a copy of the data, so we save it
# separately
write_xlsx(
  lancashire_ward_pop,
  "inst/extdata/lancashire_ward_pop.xlsx",
  format_headers = FALSE
)



# Save R data ------------------------------------------------------------------

usethis::use_data(
  lancashire_asb,
  lancashire_ward_pop,
  overwrite = TRUE
)
