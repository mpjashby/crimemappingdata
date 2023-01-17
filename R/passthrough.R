# This script downloads data and saves it to a named local file. This is only
# used for datasets that do not require any wrangling before being saved.

library(tidyverse)

tribble(
  ~url, ~name,
  "https://opendata.vancouver.ca/explore/dataset/local-area-boundary/download/?format=geojson", "vancouver_neighbourhoods.geojson"
) |>
  pwalk(function(url, name) {
    local_file <- here::here(str_glue("inst/extdata/{name}"))
    if (!file.exists(local_file)) {
      download.file(url = url, destfile = local_file)
    }
  })
