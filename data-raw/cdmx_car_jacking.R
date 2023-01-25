library(sf)
library(tidyverse)


# Crime data ----
# Source: https://datos.cdmx.gob.mx/dataset/carpetas-de-investigacion-fgj-de-la-ciudad-de-mexico

cdmx_car_jacking <- read_csv(
  "https://archivo.datos.cdmx.gob.mx/fiscalia-general-de-justicia/carpetas-de-investigacion-fgj-de-la-ciudad-de-mexico/carpetas_2019-2021.csv",
  col_types = cols(.default = col_character())
) |>
  filter(
    ao_hechos == "2019",
    delito == "ROBO DE VEHICULO DE SERVICIO PARTICULAR CON VIOLENCIA"
  ) |>
  mutate(
    across(c("longitud", "latitud"), as.numeric),
    fecha_hechos = parse_datetime(str_glue("{fecha_hechos} {hora_hechos}"))
  ) |>
  select(fecha_hechos, longitud, latitud) |>
  st_as_sf(
    coords = c("longitud", "latitud"),
    crs = "EPSG:4326",
    remove = FALSE
  ) |>
  write_sf("inst/extdata/cdmx_car_jacking.gpkg") |>
  glimpse()



# Borough boundaries ----
# Source: https://datos.cdmx.gob.mx/dataset/alcaldias

cdmx_boroughs_file <- tempfile(fileext = ".zip")
download.file(
  url = "https://datos.cdmx.gob.mx/dataset/bae265a8-d1f6-4614-b399-4184bc93e027/resource/8648431b-4f34-4f1a-a4b1-19142f944300/download/alcaldias_cdmx.zip",
  destfile = cdmx_boroughs_file
)
unzip(cdmx_boroughs_file, exdir = tempdir())

cdmx_alcaldias <- str_glue("{tempdir()}/alcaldías_cdmx/alcaldias_cdmx.shp") |>
  st_read() |>
  as_tibble() |>
  st_as_sf() |>
  select(municip, nomgeo, geometry) |>
  mutate(nomgeo = str_to_title(nomgeo)) |>
  write_sf("inst/extdata/cdmx_alcaldias.gpkg") |>
  glimpse()



# Write Rda files ----
usethis::use_data(cdmx_car_jacking, cdmx_alcaldias, overwrite = TRUE)
