library(readxl)
library(tidyverse)

# Source: https://www.sciencedirect.com/science/article/pii/S2352340919308042
data_file <- tempfile(fileext = ".xlsx")
download.file(
  "https://ars.els-cdn.com/content/image/1-s2.0-S2352340919308042-mmc1.xlsx",
  destfile = data_file
)

# Extract state names from the top of each Excel sheet
# (these are used for list-element names further down)
states <- data_file |>
  excel_sheets() |>
  map(function (x) {
    data_file |>
      read_excel(sheet = x, skip = 1, n_max = 1) |>
      names() |>
      str_remove("The total number of violence cases in ") |>
      str_remove("Number of violent crime in ") |>
      str_remove(coll(" (2006-2017)")) |>
      str_remove(" from 2006-2017")
  })

malaysia_violence_counts <- data_file |>
  excel_sheets() |>
  set_names(states) |>
  map(~ read_excel(data_file, sheet = ., skip = 3)) |>
  bind_rows(.id = "state") |>
  rename(year = `...1`) |>
  pivot_longer(-c(state, year), names_to = "crime_type", values_to = "count") |>
  mutate(
    crime_type = recode(
      str_to_lower(crime_type),
      "voluntarily causing hurt" = "aggravated assault",
      "unarmed gang robbery" = "unarmed robbery",
      "armed gang robbery" = "armed robbery"
    ),
    region = ifelse(
      state %in% c("Labuan", "Sabah", "Sarawak"),
      "East Malaysia",
      "West Malaysia"
    )
  ) |>
  filter(state != "Malaysia", crime_type != "total cases", year != "Total") |>
  count(region, state, year, crime_type, wt = count, name = "count") |>
  mutate(year = as.numeric(year)) |>
  write_rds(
    here::here("inst/extdata/malaysia_violence_counts.rds"),
    compress = "gz"
  ) |>
  glimpse()

usethis::use_data(malaysia_violence_counts, overwrite = TRUE)
