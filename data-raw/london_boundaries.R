# This script saves several boundary files that are needed for the SECU0005
# Crime Mapping final assessment. Students were previously asked to find the
# data themselves but this proved too challenging. The data should be provided
# in a variety of formats and does not need to be provided as R data files.



# Load packages ----
library(here)
library(readxl)
library(sf)
library(tidyverse)



# London borough boundaries ----
# Source: https://data.london.gov.uk/dataset/london_boroughs
read_sf("https://data.london.gov.uk/download/london_boroughs/9502cdec-5df0-46e3-8aa1-2b5c5233a31f/London_Boroughs.gpkg") |>
  write_sf(here("inst/extdata/london_boroughs.gpkg"))



# London ward boundaries ----
# Source: https://data.london.gov.uk/dataset/statistical-gis-boundary-files-london

# Download
download.file(
  url = "https://data.london.gov.uk/download/statistical-gis-boundary-files-london/b381c92b-9120-45c6-b97e-0f7adc567dd2/London-wards-2014.zip",
  destfile = wards_file <- tempfile(".zip")
)

# Unzip
unzip(
  wards_file,
  files = pull(
    filter(unzip(wards_file, list = TRUE), str_detect(Name, "ESRI")),
    "Name"
  ),
  exdir = tempdir()
)

# Load
dir.create(wards_dir <- file.path(tempdir(), "wards"))
tempdir() |>
  file.path("London-wards-2014 (1)/London-wards-2014_ESRI/London_Ward.shp") |>
  read_sf() |>
  write_sf(file.path(wards_dir, "London_Ward_Boundaries.shp"))

# Zip
withr::with_dir(
  wards_dir,
  zip(here("inst/extdata/london_wards.zip"), files = dir())
)



# London LSOA boundaries ----
# Note we want 2011 boundaries for use with IMD 2019 data
boundr::bounds(
  lookup_level = "lsoa",
  within_level = "rgn",
  within_names = "London",
  within_year = 2011
) |>
  write_sf(here("inst/extdata/london_lsoa_boundaries.geojson"))



# London ward population data ----
# Source: https://data.london.gov.uk/dataset/land-area-and-population-density-ward-and-borough
ward_pop <- read_csv("https://data.london.gov.uk/download/land-area-and-population-density-ward-and-borough/d961f13b-6726-4fa8-823f-03b379429b72/housing-density-ward.csv") |>
  write_csv(here("inst/extdata/london_ward_pop.csv.gz"))



# London LSOA deprivation data ----
# Source: https://data.london.gov.uk/dataset/indices-of-deprivation

# Download
download.file(
  url = "https://data.london.gov.uk/download/indices-of-deprivation/9ee0cf66-e6f9-4e38-8eec-79c1d897e248/ID%202019%20for%20London.xlsx",
  destfile = temp_file <- tempfile(fileext = ".xlsx")
)

# Create new file
openxlsx::write.xlsx(
  list(
    "Notes" = read_excel(temp_file, sheet = "Notes"),
    "IMD 2019" = read_excel(temp_file, sheet = "IMD 2019"),
    "Population figures" = read_excel(temp_file, sheet = "Population figures")
  ),
  file = here("inst/extdata/london_lsoa_deprivation.xlsx")
)
