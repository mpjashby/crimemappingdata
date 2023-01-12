# Load packages
library(tidyverse)

# Load data
# Source: https://geodash.vpd.ca/opendata/
# Data can only be downloaded via a web form, so the following file is crime for
# all neighbourhoods for 2020
unzip(
  here::here("data-raw/raw/vancouver_crimes_2020.zip"),
  exdir = str_glue("{tempdir()}/vpd/")
)

crimes <- tempdir() |>
  str_glue("/vpd/crimedata_csv_AllNeighbourhoods_2020.csv") |>
  read_csv()

vancouver_thefts <- crimes |>
  filter(YEAR %in% 2020, str_detect(TYPE, "Theft")) |>
  arrange(YEAR, MONTH, DAY, HOUR) |>
  write_csv(here::here("inst/extdata/vancouver_thefts.csv.gz"))

usethis::use_data(vancouver_thefts, overwrite = TRUE)
