library(tidyverse)

# Source: https://data.cincinnati-oh.gov/safety/PDI-Police-Data-Initiative-Crime-Incidents/k59e-2pvf
cincinnati_burglary <- read_csv("https://data.cincinnati-oh.gov/api/views/k59e-2pvf/rows.csv?accessType=DOWNLOAD") |>
  janitor::clean_names() |>
  mutate(
    across(
      starts_with("date_"),
      \(x) parse_date_time(x, "%m/%d/%Y %I:%M:%S %p")
    )
  ) |>
  filter(
    between(as_date(date_to), ym("2016-01"), ymd("2018-12-31")),
    str_detect(offense, "BURGLARY")
  ) |>
  select(incident_no, date = date_to, offense, longitude_x, latitude_x) |>
  write_csv("inst/extdata/cincinnati_burglary.csv.gz") |>
  glimpse()
