library(sf)

read_sf("https://data.london.gov.uk/download/london_boroughs/9502cdec-5df0-46e3-8aa1-2b5c5233a31f/London_Boroughs.gpkg") |>
  write_sf(here::here("inst/extdata/london_boroughs.gpkg"))
