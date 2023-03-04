library(tidyverse)

# Load crime data
data_dir <- str_glue("{tempdir()}/crime_data")

unzip(
  zipfile = here::here("~/Downloads/2022-12.zip"),
  exdir = data_dir
)

northants_burglary_counts <- data_dir |>
  dir(
    pattern = "northamptonshire-street.csv",
    full.names = TRUE,
    recursive = TRUE
  ) |>
  map(read_csv, show_col_types = FALSE) |>
  bind_rows() |>
  janitor::clean_names() |>
  mutate(
    district = str_remove(lsoa_name, "\\s\\w{4}$"),
    year = as.numeric(str_sub(month, end = 4))
  ) |>
  filter(
    crime_type == "Burglary",
    district %in% c(
      "Corby", "Daventry", "East Northamptonshire", "Kettering", "Northampton",
      "South Northamptonshire", "Wellingborough"
    ),
    year == 2020
  ) |>
  select(district, lsoa = lsoa_name) |>
  count(district, lsoa, name = "count") |>
  write_rds(
    here::here("inst/extdata/northants_burglary_counts.rds"),
    compress = "gz"
  ) |>
  glimpse()

usethis::use_data(northants_burglary_counts, overwrite = TRUE)
