pacman::p_load(sf, tidyverse)

tempe_character_areas <- read_sf(
  "https://services.arcgis.com/lQySeXwbBg53XWDi/arcgis/rest/services/CharacterAreaBoundary/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"
) |>
  janitor::clean_names() |>
  select(area_number, area_name, geometry) |>
  write_sf(
    here::here("inst/extdata/tempe_character_areas.gml"),
    driver = "GML",
    dataset_options = c("FORMAT=GML3.2", "XSISCHEMA=OFF")
  )

usethis::use_data(tempe_character_areas, overwrite = TRUE, compress = "xz")
