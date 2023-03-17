library(httr)
library(sf)
library(tidyverse)

# Download crime data
# Source: https://data.police.uk/data/archive/
GET(
  "https://data.police.uk/data/archive/2022-12.zip",
  write_disk(crime_data_file <- tempfile()),
  progress(),
  timeout(60 * 60)
)

# Unzip crime data to temporary directory
crime_data_dir <- str_glue("{tempdir()}/crime_data")
dir.create(crime_data_dir)
unzip(crime_data_file, exdir = crime_data_dir)

# Load London boundary
london_boundary <- read_sf("https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Regions_December_2022_EN_BFE/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson") |>
  filter(RGN22NM == "London") |>
  select(geometry)

# Load location categories
# Source: https://data.police.uk/about/#location-anonymisation
locations <- c(
  "Sports/Recreation Area", "Parking Area", "Park/Open Space", "Supermarket",
  "Petrol Station", "Pedestrian Subway", "Shopping Area",
  "Further/Higher Educational Building", "Police Station", "Hospital",
  "Nightclub", "Bus/Coach Station", "Theatre/Concert Hall",
  "Conference/Exhibition Centre", "Airport/Airfield", "Ferry Terminal",
  "Theme/Adventure Park", "Prison", "Race Track", "Motorway Service Area"
)

# Load crime data
all_crimes <- crime_data_dir |>
  dir(pattern = "-street.csv$", full.names = TRUE, recursive = TRUE) |>
  map(read_csv, show_col_types = FALSE) |>
  bind_rows() |>
  janitor::clean_names() |>
  drop_na("longitude", "latitude") |>
  filter(
    crime_type != "Anti-social behaviour",
    str_sub(month, end = 4) == "2022"
  ) |>
  mutate(
    across(c(longitude, latitude), \(x) round(x, digits = 4)),
    crime_type = recode(
      str_to_lower(crime_type),
      "criminal damage and arson" = "criminal damage or arson",
      "possession of weapons" = "weapon possession",
      "theft from the person" = "theft from person",
      "violence and sexual offences" = "violent or sexual",
      "other crime" = "other"
    ),
    location = str_squish(str_remove(location, "^On or near")),
    location_type = case_when(
      location %in% locations ~ location,
      str_detect(location, "(Lu Station)") ~ "LU Station",
      str_detect(location, "(Dlr)") ~ "DLR Station",
      str_detect(location, "(Station)") ~ "Rail Station",
      TRUE ~ NA_character_
    ),
    month = as.numeric(str_sub(month, start = 6))
  )

# Extract 100 crimes at random from the counties surrounding London
se_crimes <- all_crimes |>
  filter(
    falls_within %in% c(
      "Essex Police",
      "Hertfordshire Constabulary",
      "Kent Police",
      "Surrey Police",
      "Sussex Police",
      "Thames Valley Police"
    )
  ) |>
  sample_n(100)

# Extract crimes in London and add the sample from surrounding counties
london_crimes <- all_crimes |>
  filter(
    falls_within %in% c(
      "British Transport Police",
      "City of London Police",
      "Metropolitan Police Service"
    )
  ) |>
  # Exclude crimes outside the boundary of London
  st_as_sf(
    coords = c("longitude", "latitude"),
    crs = "EPSG:4326",
    remove = FALSE
  ) |>
  st_intersection(london_boundary) |>
  st_drop_geometry() |>
  # Add crimes from surrounding counties
  bind_rows(se_crimes) |>
  # Randomise order of crimes within each month
  mutate(random = runif(n())) |>
  arrange(month, random) |>
  select(month, type = crime_type, location_type, longitude, latitude) |>
  glimpse()

# Create ZIP file
setwd("inst/extdata")
write_csv(london_crimes, "london_crimes.csv")
zip("london_crimes.zip", "london_crimes.csv")
file.remove("london_crimes.csv")
setwd(here::here())

# Write R data
usethis::use_data(london_crimes, overwrite = TRUE)
