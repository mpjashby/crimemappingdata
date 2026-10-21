# Load packages
library(httr2)
library(tidyverse)

# Download data to a temporary file
request(
  "https://cdn.buenosaires.gob.ar/datosabiertos/datasets/ministerio-de-justicia-y-seguridad/delitos/delitos_2023.csv"
) |>
  req_perform(path = data_file <- tempfile(fileext = ".csv"))

buenos_aires_robbery <- data_file |>
  read_csv(na = c("", "NA", "NULL")) |>
  janitor::clean_names() |>
  filter(tipo == "Robo") |>
  mutate(
    fecha = make_datetime(year(fecha), month(fecha), mday(fecha), franja)
  ) |>
  drop_na(latitud, longitud) |>
  select(id_mapa, fecha, subtipo, barrio, longitud, latitud) |>
  arrange(fecha) |>
  # Save version for access via URL
  write_csv2("inst/extdata/buenos_aires_robbery.csv")

# Save version for package
usethis::use_data(buenos_aires_robbery)
