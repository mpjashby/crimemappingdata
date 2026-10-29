# Load packages
library(httr2)
library(tidyverse)

source_file <- here::here(
  "data-raw",
  "raw",
  "new_sources",
  "montreal_crimes.csv"
)

# Download data
request(
  "https://donnees.montreal.ca/dataset/5829b5b0-ea6f-476f-be94-bc2b8797769a/resource/c6f482bf-bf0f-4960-8b2f-9982c211addd/download/actes-criminels.csv"
) |>
  req_perform(path = source_file)

# Process data
montreal_mefait <- read_csv(source_file) |>
  janitor::clean_names() |>
  filter(
    categorie == "Méfait",
    between(date, ymd("2016-01-01"), ymd("2025-12-31"))
  ) |>
  drop_na(x, y) |>
  select(categorie, date, quart, x, y) |>
  write_csv(here::here("inst", "extdata", "montreal_mefait.csv.gz"))

usethis::use_data(montreal_mefait, overwrite = TRUE, compress = "xz")
