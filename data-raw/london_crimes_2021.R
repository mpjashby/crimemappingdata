library(httr)
library(tidyverse)

# The only persistent URLs for police.uk data are for national archives, so we
# have to download data for the whole country and then filter
temp_data_file <- tempfile(fileext = ".zip")
temp_data_dir <- str_glue("{tempdir()}/crime_data")
GET(
  "https://data.police.uk/data/archive/2021-12.zip",
  write_disk(temp_data_file),
  progress()
)
unzip(zipfile = temp_data_file, exdir = temp_data_dir)

london_crimes_2021 <- temp_data_dir |>
  dir(pattern = "street.csv$", full.names = TRUE, recursive = TRUE) |>
  map(read_csv, show_col_types = FALSE) |>
  bind_rows() |>
  janitor::clean_names() |>
  filter(
    falls_within %in% c(
      "British Transport Police",
      "City of London Police",
      "Metropolitan Police Service"
    )
  ) |>
  separate(month, into = c("year", "month"), sep = "-", convert = TRUE) |>
  filter(year == 2021) |>
  mutate(
    across(c(longitude, latitude), round, digits = 4),
    borough = str_remove(str_remove(lsoa_name, "\\s\\w{4}$"), " upon Thames$"),
    crime_type = recode(
      str_to_lower(crime_type),
      "criminal damage and arson" = "criminal damage/arson",
      "possession of weapons" = "weapon possession",
      "theft from the person" = "theft from person",
      "violence and sexual offences" = "violent/sexual offence",
      "other crime" = "other"
    ),
    location = location |>
      str_remove("^On or near ") |>
      str_replace(coll(" (Dlr)"), " DLR Station") |>
      str_replace(coll(" (Lu Station)"), " LU Station") |>
      str_replace(coll(" (Station)"), " Rail Station"),
    month = month(make_date(month = month), label = TRUE),
    random = runif(n())
  ) |>
  arrange(month, random) |>
  filter(
    borough %in% c(
      "Westminster", "Tower Hamlets", "Camden", "Southwark", "Lambeth",
      "Newham", "Hackney", "Ealing", "Croydon", "Haringey", "Brent", "Barnet",
      "Hillingdon", "Islington", "Enfield", "Lewisham", "Greenwich", "Hounslow",
      "Wandsworth", "Waltham Forest", "Bromley", "Redbridge",
      "Kensington and Chelsea", "Hammersmith and Fulham",
      "Barking and Dagenham", "Havering", "Harrow", "Bexley", "Merton",
      "Sutton", "Richmond", "Kingston", "City of London"
    )
  ) |>
  select(
    month, type = crime_type, location, lsoa = lsoa_code, borough, longitude,
    latitude
  ) |>
  write_csv("inst/extdata/london_crimes_2021.csv.gz")

usethis::use_data(london_crimes_2021, overwrite = TRUE)
