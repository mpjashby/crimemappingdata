# This script generates counts of vehicle thefts in municipalities in South
# Africa, based on counts of crimes for each police-station area (of which there
# are several in each municipality)

# NOTE: this dataset is not documented or exported

# Load packages
library(httr)
library(readxl)
library(sf)
library(tidyverse)



# Download data ----------------------------------------------------------------


## Crime data ----
# Source: https://www.saps.gov.za/services/crimestats.php
crime_file <- tempfile(fileext = ".xlsx")
GET(
  "https://www.saps.gov.za/services/Crime-Statistics-2019_2020.xlsx",
  write_disk(crime_file, overwrite = TRUE),
  timeout(60 * 10),
  progress()
)
crimes <- crime_file  |>
  read_excel(sheet = "station data 2020") |>
  janitor::clean_names() |>
  pivot_longer(starts_with("x20"), names_to = "year", values_to = "count")


## Police station locations ----
# Source: https://hub.arcgis.com/datasets/esriza::south-african-police-station/about
police_stations <- read_sf("https://services.arcgis.com/k7HsiFEIdlPzZNnP/arcgis/rest/services/South_African_police_station/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson") |>
  janitor::clean_names() |>
  select(station = compnt_nm) |>
  st_transform("EPSG:32734") |>
  st_centroid()


## Municipality boundaries ----
municipalities <- read_sf("https://opendata.arcgis.com/datasets/27bbdd5b041b4ba6b5707dfed5aa3923_0.geojson") |>
  janitor::clean_names() |>
  st_transform("EPSG:32734") |>
  select(municipality = municname)


## Vehicle counts ----
# I have no idea where this dataset came from and I cannot find it again despite
# substantial searching
vehicles <- read_tsv(here::here("data-raw/raw/sa_municipality_vehicles.tsv")) |>
  janitor::clean_names() |>
  mutate(municipality = str_to_title(municipality)) |>
  select(municipality, vehicles = yes)



# Wrangle data -----------------------------------------------------------------

# Identify which stations are in which municipalities
stations_in_mun <- police_stations |>
  st_join(municipalities) |>
  st_drop_geometry() |>
  mutate(mun_match = str_to_upper(municipality))

# Join data
crimes |>
  left_join(stations_in_mun, by = "station") |>
  mutate(
    crime_category = str_remove(crime_category, " and motorcycle$"),
    province_station = str_replace_all(province_station, "_", " "),
    across(c(province_station, station), str_to_title),
    province_station = recode(
      province_station,
      "Kwazulu Natal" = "Kwazulu-Natal"
    )
  ) |>
  filter(
    # Extract only correct year
    year == "x2018_2019",
    # Extract only vehicle crime
    str_detect(crime_category, "\\bvehicle\\b"),
    # Remove provincial summary rows
    province_station != station,
    # Remove national summary rows
    station != "Republic Of South Africa"
  ) |>
  count(
    province_station,
    municipality,
    crime_category,
    wt = count,
    name = "count"
  ) |>
  left_join(vehicles, by = "municipality") |>
  filter(!is.na(vehicles)) |>
  mutate(theft_rate = count / (vehicles / 1000)) |>
  select(
    province = province_station,
    municipality,
    crime_category,
    theft_rate
  ) |>
  write_rds(
    here::here("inst/extdata/south_africa_vehicle_theft.rds"),
    compress = "gz"
  ) |>
  glimpse()
