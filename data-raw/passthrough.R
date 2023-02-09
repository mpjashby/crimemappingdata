# This script downloads data and saves it to a named local file. This is only
# used for datasets that do not require any wrangling before being saved.

library(tidyverse)

# Download files
tribble(
  ~url, ~name,
  "https://services1.arcgis.com/FZVaYraI7sEGQ6rF/arcgis/rest/services/catastro/FeatureServer/10/query?outFields=*&where=1%3D1&f=geojson", "medellin_comunas.geojson",
  "https://opendata.vancouver.ca/explore/dataset/local-area-boundary/download/?format=geojson", "vancouver_neighbourhoods.geojson"
) |>
  pwalk(function(url, name) {
    local_file <- here::here(str_glue("inst/extdata/{name}"))
    if (!file.exists(local_file)) {
      download.file(url = url, destfile = local_file)
    }
  })


# Transcode some files to geopackages to save space
walk(
  c("medellin_comunas.geojson"),
  function(name) {
    old_file <- here::here(str_glue("inst/extdata/{name}"))
    new_file <- str_replace(old_file, "geojson$", "gpkg")
    old_file |> read_sf() |> write_sf(new_file)
    file.remove(old_file)
  }
)
