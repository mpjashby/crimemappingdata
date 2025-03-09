pacman::p_load(sf, tidyverse)

temp_dir <- str_glue("{tempdir()}/japan")
temp_file <- tempfile(fileext = ".zip")
if (!dir.exists(temp_dir)) dir.create(temp_dir)

# Source: https://data.humdata.org/dataset/cod-xa-jpn
download.file(
  "https://data.humdata.org/dataset/6ba099c6-350b-4711-9a65-d85a1c5e519c/resource/f82faadf-a608-42cf-ae15-75ce672d7e69/download/jpn_adm_2019_shp.zip",
  temp_file
)

unzip(temp_file, exdir = temp_dir)

japan_prefectures <- str_glue("{temp_dir}/jpn_admbnda_adm1_2019.shp") |>
  read_sf() |>
  janitor::clean_names() |>
  mutate(
    across(where(is.character), str_squish),
    adm1_en = stringi::stri_trans_general(adm1_en, id = "Latin-ASCII")
  ) |>
  st_transform("EPSG:6690") |>
  write_sf(here::here("inst/extdata/japan_prefectures.gpkg"))

usethis::use_data(japan_prefectures, overwrite = TRUE)

