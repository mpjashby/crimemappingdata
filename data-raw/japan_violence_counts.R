library(rvest)
library(tabulizer)
library(tidyverse)

# Note the terms of use for this dataset, which are stated at
# <https://www.stat.go.jp/english/info/riyou.html> to be compatible with the
# CC-BY licence

# !! THIS FUNCTION WILL OPEN A VIEWER WINDOW FOR SELECTING AN AREA ON THE PAGE
# Choose only the data in the table, not any of the header rows
# locate_areas(
#   file = "http://www.stat.go.jp/english/data/nenkan/pdf/yhyou28.pdf",
#   pages = 2
# )

# Extract crime data from table
pdf <- extract_tables(
  file = "http://www.stat.go.jp/english/data/nenkan/pdf/yhyou28.pdf",
  pages = 2,
  area = list(
    c(top = 173.7298, left = 20.2645, bottom = 669.9818, right = 482.4356)
  ),
  guess = FALSE
)

# Wrangle crime data
crime <- pdf |>
  chuck() |>
  as.data.frame() |>
  as_tibble(.name_repair = "minimal") |>
  set_names(c(
    "pref_number", "blank", "prefecture", "total_homicide_robbery_arson_rape",
    "violence_larceny", "intellectual", "moral_cleared_arrestees", "final"
  )) |>
  select(-pref_number, -blank, -final) |>
  separate(
    total_homicide_robbery_arson_rape,
    into = c("total", "homicide", "robbery", "arson", "rape"),
    sep = "\\s"
  ) |>
  separate(violence_larceny, into = c("violence", "larceny"), sep = "\\s") |>
  separate(
    moral_cleared_arrestees,
    into = c("moral", "cleared", "arrestees"),
    sep = "\\s"
  ) |>
  mutate(across(-prefecture, parse_number)) |>
  select(prefecture, homicide, robbery, rape, violence)

# Get population data
pop <- read_html("https://en.wikipedia.org/wiki/Prefectures_of_Japan") |>
  html_nodes(".wikitable") |>
  pluck(1) |>
  html_table() |>
  as_tibble(.name_repair = "universal") |>
  janitor::clean_names() |>
  select(prefecture = prefecture_1, population = population_december_2022) |>
  mutate(
    prefecture = recode(
      prefecture,
      "Hyōgo" = "Hyogo",
      "Kōchi" = "Kochi",
      "Ōita" = "Oita"
    ),
    population = parse_number(population)
  )

# Get GDP data
gdp <- read_html("https://en.wikipedia.org/wiki/List_of_Japanese_prefectures_by_GDP_per_capita") |>
  html_node(".wikitable") |>
  html_table() |>
  as_tibble() |>
  janitor::clean_names() |>
  select(prefecture, gdp_per_capita = x2018_gdp_per_capitain_jp) |>
  mutate(gdp_per_capita = parse_number(gdp_per_capita))

# Combine data
japan_violence_counts <- crime |>
  mutate(prefecture = recode(prefecture, "Gumma" = "Gunma")) |>
  full_join(gdp, by = "prefecture") |>
  full_join(pop, by = "prefecture") |>
  filter(prefecture != "Japan") |>
  mutate(
    gdp_per_capita = gdp_per_capita / 1000,
    population = population / 1000
  ) |>
  pivot_longer(-prefecture, names_to = "measure", values_to = "value") |>
  mutate(
    measure = recode(
      measure,
      "homicide" = "number of homicides",
      "robbery" = "number of robberies",
      "rape" = "number of rapes",
      "violence" = "number of violent crimes",
      "gdp_per_capita" = "GDP per capita (¥1000)",
      "population" = "population (thousands)"
    )
  ) |>
  write_rds(
    here::here("inst/extdata/japan_violence_counts.rds"),
    compress = "gz"
  ) |>
  glimpse()

usethis::use_data(japan_violence_counts, overwrite = TRUE)
