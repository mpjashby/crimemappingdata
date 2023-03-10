library(sf)
library(tidyverse)

# Download crime data
download.file(
  "https://www.atlantapd.org/Home/ShowDocument?id=3051",
  destfile = str_glue("{tempdir()}/atlanta_crime.zip")
)

# Unzip crime data
unzip(str_glue("{tempdir()}/atlanta_crime.zip"), exdir = tempdir())

# Load crime data
crimes <- str_glue("{tempdir()}/COBRA-2009-2019.csv") |>
  read_csv() |>
  janitor::clean_names()

# Get Downtown homicides
downtown_homicides <- crimes |>
  filter(
    ucr_literal == "HOMICIDE",
    occur_date >= as.Date("2019-01-01"),
    neighborhood == "Downtown"
  ) |>
  mutate(
    occur_date = strftime(lubridate::ymd(occur_date), "%e %B"),
    occur_time = str_glue("{str_sub(occur_time, 0, 2)}:00"),
    label = str_glue("{location}\n{occur_date} @ {occur_time}")
  ) |>
  select(report_number, label, longitude, latitude) |>
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326, remove = FALSE) |>
  write_sf(here::here("inst/extdata/downtown_homicides.gpkg")) |>
  write_csv(here::here("inst/extdata/downtown_homicides.csv"))

usethis::use_data(downtown_homicides, overwrite = TRUE)

# Get Glenrose Heights homicides
glenrose_heights_homicides <- crimes |>
  filter(
    ucr_literal == "HOMICIDE",
    occur_date >= as.Date("2019-01-01"),
    neighborhood == "Glenrose Heights"
  ) |>
  mutate(
    occur_date = strftime(lubridate::ymd(occur_date), "%e %B"),
    occur_time = str_glue("{str_sub(occur_time, 0, 2)}:00"),
    label = str_glue("{location}\n{occur_date} @ {occur_time}")
  ) |>
  select(report_number, label, longitude, latitude) |>
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326, remove = FALSE) |>
  write_sf(here::here("inst/extdata/glenrose_heights_homicides.gpkg")) |>
  write_csv(here::here("inst/extdata/glenrose_heights_homicides.csv"))

usethis::use_data(glenrose_heights_homicides, overwrite = TRUE)
