pacman::p_load(geobr, sf, tidyverse)

# Get boundary of Sao Paulo immediate region
ir <- read_immediate_region("SP") |>
  filter(name_immediate == "São Paulo")

# Get boundary of Sao Paulo municipalities
sao_paulo_muni <- read_municipality("SP") |>
  st_intersection(ir) |>
  select(code_muni, name_muni, geom) |>
  write_sf(here::here("inst/extdata/sao_paulo_muni.geojson"))

# Save RData version
usethis::use_data(sao_paulo_muni, overwrite = TRUE)
