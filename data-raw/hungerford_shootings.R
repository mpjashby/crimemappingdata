library(tidyverse)

hungerford_shootings <- tribble(
  ~latitude, ~longitude, ~victims,
  51.4078, -1.6683, "Susan GODFREY†",
  51.4094, -1.5779, "Kakaub DEAN",
  51.4116, -1.5147, "Roland MASON†\nSheila MASON†\nMarjorie JACKSON\nLisa MILDENHALL",
  51.4112, -1.5119, "Kenneth CLEMENTS†",
  51.4115, -1.5140, "Roger BRERETON†\nLinda CHAPMAN\nAlison CHAPMAN",
  51.4116, -1.5151, "Abdur KHAN†\nAlan LEPETIT\nHazel HASLETT\nGeorge WHITE†\nDorothy RYAN†\nIvor JACKSON",
  51.4103, -1.5132, "Betty TOLLADAY",
  51.4081, -1.5132, "Francis BUTLER†",
  51.4079, -1.5144, "Marcus BARNARD†",
  51.4080, -1.5150, "Ann HONEYBONE",
  51.4098, -1.5156, "John STORMS",
  51.4102, -1.5156, "Douglas WAINWRIGHT†\nKathleen WAINWRIGHT\nKevin LANCE\nEric VARDY†",
  51.4088, -1.5173, "Sandra HILL†",
  51.4076, -1.5174, "Victor GIBBS†\nMyrtle GIBBS†\nMichael JENNINGS\nMyra GEATER",
  51.4065, -1.5175, "Ian PLAYLE†",
  51.4062, -1.5152, "George NOON"
) |>
  mutate(
    coords = ggspatial::xy_transform(
      longitude,
      latitude,
      from = "EPSG:4326",
      to = "EPSG:27700"
    ),
    order = row_number()
  ) |>
  unnest(cols = "coords") |>
  mutate(across(c(x, y), round)) |>
  select(victims, order, easting = x, northing = y) |>
  write_csv(here::here("inst/extdata/hungerford_shootings.csv")) |>
  glimpse()

usethis::use_data(hungerford_shootings, overwrite = TRUE)
