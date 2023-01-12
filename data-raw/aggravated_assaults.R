# Load packages
library(writexl)
library(tidyverse)

# Load data
crimes <- crimedata::get_crime_data(
  years = 2019,
  cities = c("Austin", "Fort Worth", "Seattle"),
  type = "core"
)

# Create an Excel file of aggravated assault data, with a separate sheet for
# each city
aggravated_assaults_multi <- crimes |>
  filter(offense_code == "13A") |>
  group_by(city_name) |>
  select(
    city_name,
    date = date_single,
    longitude,
    latitude,
    location_type,
    location_category
  ) |>
  nest(data = -city_name) |>
  deframe()

# Save Excel file
write_xlsx(
  aggravated_assaults_multi,
  here::here("inst/extdata/aggravated_assaults.xlsx")
)

# The loaded data will only include crimes for Austin, so before saving the
# `.Rda` file we choose only the element representing Austin
aggravated_assaults <- pluck(aggravated_assaults_multi, "Austin")

usethis::use_data(aggravated_assaults, overwrite = TRUE)
