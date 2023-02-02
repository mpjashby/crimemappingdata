# This code downloads police data for Czechia for 2020--2022 and extracts:
#   * collisions involving drink or drugs
#   * theft of powered two wheelers

library(httr)
library(lubridate)
library(sf)
library(tidyverse)

# General notes ----
# Source: https://kriminalita.policie.cz/download
# `read_json()` cannot read from a URL, so we have to download the files first.

# Download crime data ----
cz_data_dir <- str_glue("{tempdir()}/cz_data")
dir.create(cz_data_dir)
walk(
  seq(ym("2020-01"), ym("2022-12"), by = "month"),
  function(month) {
    month_pad <- format(month, '%Y%m')
    GET(
      url = str_glue(
        "https://kriminalita.policie.cz/api/v2/downloads/{month_pad}.geojson"
      ),
      write_disk(str_glue("{cz_data_dir}/data_{month_pad}.geojson")),
      progress(),
      timeout(600)
    )
  })

cz_data <- cz_data_dir |>
  dir(pattern = ".geojson$", full.names = TRUE) |>
  map(read_sf) |>
  bind_rows()

# Extract collisions
czechia_collisions <- cz_data |>
  # Rows can contain more than one type code, if more than one thing happened
  # during an incident. `types == 79` is for traffic collisions, `types == 80`
  # is for any type of drug addiction and 112:116 are for alcohol.
  # `relevance == 4` chooses rows where the location represents the incident
  # location, rather than reporting or other location. `state %in% 1:4` chooses
  # incidents that were not unfounded, etc.
  mutate(
    is_collision = map_lgl(types, ~ 79 %in% .),
    is_drinkdrug = map_lgl(types, ~ any(c(80, 112:116) %in% .))
  ) |>
  filter(is_collision, is_drinkdrug, relevance %in% 1:4, state %in% 1:4) |>
  select(id, date, geometry) |>
  write_sf("inst/extdata/czechia_collisions.gpkg") |>
  glimpse()

czechia_mcycle_thefts <- cz_data |>
  mutate(is_mcycle_theft = map_lgl(types, ~ 37 %in% .)) |>
  filter(is_mcycle_theft, relevance %in% 1:4, state %in% 1:4) |>
  select(id, date, geometry) |>
  write_sf("inst/extdata/czechia_mcycle_thefts.gpkg") |>
  glimpse()

# Write package data
usethis::use_data(czechia_collisions, czechia_mcycle_thefts, overwrite = TRUE)



# Load type codes ---
# Type codes are published in JSON format, in which the top level contains a
# list that contains another list for each type, containing (among other
# things) a code, a category and a description/type. Note this code is protected
# so it doesn't run, but is left here because if needed it's easier than working
# out the structure of the JSON object again.
if (FALSE) {
  cz_types_file <- tempfile(fileext = ".json")
  download.file(
    url = "https://kriminalita.policie.cz/api/v2/downloads/types.json",
    destfile = cz_types_file
  )
  cz_types <- cz_types_file |>
    jsonlite::read_json() |>
    pluck("polozky") |>
    map(
      function(x) {
        tibble(
          code = pluck(x, "kod"),
          category = pluck(x, "nazev", "cs"),
          type = pluck(x, "popis", "cs")
        )
      }) |>
    bind_rows()
}

