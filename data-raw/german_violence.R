library(readxl)
library(rvest)
library(tidyverse)

# Download data
# Source: https://www.bka.de/DE/AktuelleInformationen/StatistikenLagebilder/PolizeilicheKriminalstatistik/PKS2019/PKSTabellen/LandFalltabellen/landFalltabellen.html?nn=130872
data_file <- tempfile(fileext = ".xlsx")
download.file(
  url = "https://www.bka.de/SharedDocs/Downloads/DE/Publikationen/PolizeilicheKriminalstatistik/2019/Land/Faelle/LA-F-01-T01-Laender-Faelle_xls.xlsx?__blob=publicationFile&v=5",
  destfile = data_file
)

# Extract population and GDP data
state_pop <- read_html("https://en.wikipedia.org/wiki/States_of_Germany") |>
  html_node(".wikitable") |>
  html_table() |>
  as_tibble() |>
  janitor::clean_names() |>
  select(
    state,
    population = pop_2020_7,
    gdp_per_capita = gdp_per_capita_2020_9
  ) |>
  mutate(
    across(c(population, gdp_per_capita), parse_number),
    gdp_per_capita = gdp_per_capita / 1000,
    state = recode(
      state,
      "Bavaria(Bayern)" = "Bayern",
      "Hesse(Hessen)" = "Hessen",
      "Lower Saxony(Niedersachsen)" = "Niedersachsen",
      "North Rhine-Westphalia(Nordrhein-Westfalen)" = "Nordrhein-Westfalen",
      "Rhineland-Palatinate(Rheinland-Pfalz)" = "Rheinland-Pfalz",
      "Saxony(Sachsen)" = "Sachsen",
      "Saxony-Anhalt(Sachsen-Anhalt)" = "Sachsen-Anhalt",
      "Thuringia(Thüringen)" = "Thüringen"
    )
  ) |>
  pivot_longer(cols = -state, names_to = "measure", values_to = "count") |>
  mutate(measure = recode(measure, gdp_per_capita = "GDP per capita (€1000)"))

# Load crime data
germany_violence_counts <- data_file |>
  # Skip header rows
  read_excel(skip = 3, na = "------") |>
  janitor::clean_names() |>
  # Skip blank rows below column names
  slice(5:n()) |>
  # Remove unnecessary columns and translate names
  select(
    offence_code = schlussel,
    offence_type = straftat,
    state = bundesland,
    count = erfasste_falle
  ) |>
  mutate(
    offence_type = str_squish(offence_type),
    type = recode(
      offence_type,
      "Straftaten gegen das Leben" = "number of homicides",
      "Vergewaltigung § 177 Abs. 6, 7, 8 StGB" = "number of rapes",
      "Raub, räuberische Erpressung und räuberischer Angriff auf Kraftfahrer §§ 249-252, 255, 316a StGB" = "number of robberies",
      .default = NA_character_
    )
  ) |>
  filter(!is.na(type), state != "Bundesrepublik Deutschland") |>
  select(state, measure = type, count) |>
  bind_rows(state_pop) |>
  arrange(state, measure) |>
  write_rds(here::here("inst/extdata/german_violence_counts.rds")) |>
  glimpse()

usethis::use_data(germany_violence_counts)
