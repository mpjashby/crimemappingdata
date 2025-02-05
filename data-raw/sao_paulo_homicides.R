pacman::p_load(janitor, readxl, sf, tidyverse)

# Source: https://www.ssp.sp.gov.br/estatistica/spvida
download.file(
  url = "https://www.ssp.sp.gov.br/assets/estatistica/transparencia/dadosInconsistentes/Homicidio_2017_2022.xlsx",
  destfile = temp_file <- tempfile(".xlsx")
)

# Get boundary of Sao Paulo immediate region
ir <- geobr::read_immediate_region("SP") |>
  filter(name_immediate == "São Paulo") |>
  st_transform("EPSG:4326")

sao_paulo_homicides <- temp_file |>
  excel_sheets() |>
  map(\(x) read_excel(temp_file, sheet = x, col_type = "text")) |>
  bind_rows() |>
  clean_names() |>
  select(
    year = ano_bo,
    date = datahora_registro_bo,
    municipality = municipio_circunscricao,
    location_type = desc_tipolocal,
    victim_sex = sexo_pessoa,
    longitude,
    latitude
  ) |>
  mutate(
    date = excel_numeric_to_date(parse_number(date)),
    across(c(latitude, longitude, year), parse_number)
  ) |>
  filter(between(year, 2017, 2022), latitude != 0, longitude != 0) |>
  drop_na(longitude, latitude) |>
  st_as_sf(coords = c("longitude", "latitude"), crs = "EPSG:4326", remove = FALSE) |>
  st_intersection(ir) |>
  st_drop_geometry() |>
  select(year, date, municipality, location_type, victim_sex, longitude, latitude) |>
  arrange(date) |>
  write_csv(here::here("inst/extdata/sao_paulo_homicides.xlsx"))

# Save RData version
usethis::use_data(sao_paulo_homicides, overwrite = TRUE)
