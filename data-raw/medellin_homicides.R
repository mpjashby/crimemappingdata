library(janitor)
library(lubridate)
library(sf)
library(tidyverse)



# Homicides --------------------------------------------------------------------

# Source: http://medata.gov.co/dataset/homicidio/resource/4cec9df8-f60b-448f-977c-72256e752fce#{}
medellin_homicides <- read_delim("http://medata.gov.co/node/25803/download", delim = ";") |>
  filter(between(as_date(fecha_hecho), ym("2010-01"), ymd("2019-12-31"))) |>
  select(fecha_hecho, longitud, latitud, sexo, edad, modalidad) |>
  write_csv2(here::here("inst/extdata/medellin_homicides.csv")) |>
  glimpse()


# Metro lines ------------------------------------------------------------------

# Source: https://datosabiertos-metrodemedellin.opendata.arcgis.com/datasets/7359b376cd984cf1828bf296fc446112_1/about
medellin_metro_lines <- read_sf("https://utility.arcgis.com/usrsvcs/servers/7359b376cd984cf1828bf296fc446112/rest/services/OpenData/Movilidad/MapServer/1/query?outFields=*&where=1%3D1&f=geojson") |>
  clean_names() |>
  filter(sistema %in% c("Metro", "Cable")) |>
  select(-objectid, -st_length_shape) |>
  write_sf(str_glue("{tempdir()}/medellin_metro_lines.shp")) |>
  glimpse()

old_wd <- getwd()
setwd(tempdir())
zip(
  zipfile = here::here("inst/extdata/medellin_metro_lines.zip"),
  files = dir(tempdir(), pattern = "medellin_metro_lines")
)
setwd(old_wd)



# Metro stations ---------------------------------------------------------------

# Source: https://datosabiertos-metrodemedellin.opendata.arcgis.com/datasets/5e0ac28dbeca42218bca925682c962cc_0/about
medellin_stns <- read_sf("https://utility.arcgis.com/usrsvcs/servers/5e0ac28dbeca42218bca925682c962cc/rest/services/OpenData/Movilidad/MapServer/0/query?outFields=*&where=1%3D1&f=geojson") |>
  clean_names() |>
  filter(sistema %in% c("Metro", "Cable")) |>
  select(-objectid, -codigo_mpio, -tipo)

medellin_stn_coord <- medellin_stns |>
  st_coordinates(medellin_metro_stns) |>
  as_tibble() |>
  clean_names()

medellin_metro_stns <- medellin_stns |>
  bind_cols(medellin_stn_coord) |>
  st_drop_geometry() |>
  write_csv(here::here("inst/extdata/medellin_metro_stns.csv")) |>
  glimpse()



# Save R data ------------------------------------------------------------------

usethis::use_data(
  medellin_homicides,
  medellin_metro_lines,
  medellin_metro_stns,
  overwrite = TRUE
)
