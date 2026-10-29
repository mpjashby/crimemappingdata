# Load packages
library(httr2)
library(tidyverse)

# Download data to a temporary file
request(
  "https://cdn.buenosaires.gob.ar/datosabiertos/datasets/ministerio-de-justicia-y-seguridad/delitos/delitos_2023.csv"
) |>
  req_perform(path = data_file <- tempfile(fileext = ".csv"))

# Load data and process
retiro_homicides <- read_csv(data_file, na = c("", "NA", "NULL")) |>
  janitor::clean_names() |>
  filter(barrio == "RETIRO", tipo == "Homicidios") |>
  mutate(
    fecha = make_datetime(year(fecha), month(fecha), mday(fecha), franja)
  ) |>
  drop_na(latitud, longitud) |>
  select(id_mapa, fecha, longitud, latitud) |>
  arrange(fecha) |>
  # Save version for access via URL
  write_csv("inst/extdata/retiro_homicides.csv")

# Save version for package
usethis::use_data(retiro_homicides, compress = "xz")
