# Load packages
library(httr2)
library(rvest)
library(sf)
library(writexl)
library(tidyverse)

# Polish powiats, including cities with powiat status, for a crime-rate exercise.
#
# Crime: police-ascertained property offences in completed preparatory
# proceedings, calendar years 2022–2024 (BDL variable 58564, not the published rate).
# Population: total population on 31 December in each of 2022–2024 (BDL variable 72305).
# This is an end-of-year denominator, not an annual average population.
# Boundaries: archived PRG 2025 release. The same polygons are supplied for
# all three years; matching codes alone does not establish unchanged geographic
# extents. Consider boundary changes when comparing annual rates.
#
# Sources and redistribution terms:
# - Statistics Poland, Bank Danych Lokalnych (BDL): CC BY 4.0.
#   https://api.stat.gov.pl/home/bdlapi
#   https://bdl.stat.gov.pl/bdl/metadane/cechy/2290
# - GUGiK, Panstwowy Rejestr Granic (PRG): free for any purpose.
#   https://www.geoportal.gov.pl/pl/dane/panstwowy-rejestr-granic-prg/
# Credit both providers when distributing the outputs, link to their terms,
# and identify the extraction, column cleaning and code conversion as changes.
# The package's MIT licence does not replace these source-specific terms.
#
# Outputs in inst/extdata/: crime counts (.xlsx), population (.tsv), and
# boundaries (.gpkg). The three matching R objects are also saved for the
# package, following data-raw/README.md. Rates are left for students to compute.
# Output field labels are Polish (or source identifiers), in snake_case.
# Imported boundary fields are cleaned with janitor::clean_names(); Polish
# place names are retained without translation.

# Download statistical data ----------------------------------------------------

# The JSON API uses English structural keys even when lang = "pl". Assign
# Polish snake_case field labels directly when extracting the table.
# Keep BDL's value-attribute identifier so provisional/suppressed values can
# be investigated against https://bdl.stat.gov.pl/api/v1/attributes?lang=pl.
# Missing values must never be silently converted into zero offences.
read_bdl <- function(variable_id, value_name) {
  # BDL numbers result pages from zero; collect each page in a list.
  page <- 0L
  pages <- list()

  # Fetch successive pages until all reported records have been downloaded.
  repeat {
    # Request 2022–2024 powiat-level data, with Polish names, in batches of 100.
    response <- request(str_c(
      "https://bdl.stat.gov.pl/api/v1/data/by-variable/",
      variable_id
    )) |>
      req_url_query(
        format = "json",
        lang = "pl",
        year = 2022:2024,
        .multi = "explode",
        `unit-level` = 5L,
        `page-size` = 100L,
        page = page
      ) |>
      # Stay below the anonymous API limit of five requests per second.
      req_throttle(rate = 4) |>
      # Allow two minutes per request and retry temporary HTTP failures.
      req_timeout(120) |>
      req_retry(max_tries = 3) |>
      req_perform() |>
      # Keep nested JSON records as lists for the extraction below.
      resp_body_json(simplifyVector = FALSE)

    # Extract the identifier, name and annual values for every returned unit.
    # R list indices start at one, so store API page zero in list element one.
    pages[[page + 1L]] <- map(response$results, function(unit) {
      # Turn each nested annual observation into a row with Polish labels.
      map(unit$values, function(value) {
        tibble(
          kod_bdl = as.character(unit$id),
          nazwa = unit$name,
          rok = as.integer(value$year),
          # Preserve missing observations and absent flags as typed NA values.
          wartosc = if (is.null(value$val)) NA_real_ else value$val,
          id_atrybutu = if (is.null(value$attrId)) {
            NA_integer_
          } else {
            as.integer(value$attrId)
          }
        )
      }) |>
        list_rbind()
    }) |>
      list_rbind()

    # Finish after the last batch; otherwise request the next page.
    if ((page + 1L) * 100L >= response$totalRecords) {
      break
    }
    page <- page + 1L
  }

  # The 12-character BDL code is MM WW R SS PP GGT. A powiat's four-digit
  # TERYT code is WW + PP, not the first four characters of the BDL code.
  # Keep it as text in all outputs to preserve leading zeroes.
  # Stack the downloaded pages and add the common geographic identifier.
  list_rbind(pages) |>
    mutate(
      kod_teryt = str_c(str_sub(kod_bdl, 3, 4), str_sub(kod_bdl, 8, 9)),
      .after = kod_bdl
    ) |>
    # Give the numeric field its Polish snake_case measure name.
    rename_with(~value_name, wartosc) |>
    # Put records in geographic-code order for easier interactive review.
    arrange(kod_teryt, rok)
}

# Download the number of property offences, retaining the source value flags.
poland_property_crime_counts <- read_bdl(
  variable_id = 58564L,
  value_name = "przestepstwa_przeciwko_mieniu"
) |>
  select(-id_atrybutu)

# Download total resident population for the same year and geographic level.
poland_population <- read_bdl(
  variable_id = 72305L,
  value_name = "ludnosc"
) |>
  select(-id_atrybutu)


# Download archived boundaries -------------------------------------------------

# Resolve the labelled archive link from the official source page rather than
# using the live WFS, which would silently change geography on later runs.
# Extract all links so their visible labels can identify the annual archive.
boundary_links <- read_html(
  "https://www.geoportal.gov.pl/pl/dane/panstwowy-rejestr-granic-prg/"
) |>
  html_elements("a")

# Allocate temporary storage for the archive and its extracted shapefiles.
boundary_zip <- tempfile(fileext = ".zip")
boundary_dir <- tempfile(pattern = "poland_prg_")
dir.create(boundary_dir)

# Pair each link label with its address and select the 2025 archive URL.
tibble(
  nazwa = html_text2(boundary_links),
  url = html_attr(boundary_links, "href")
) |>
  filter(nazwa == "PRG jednostki administracyjne 2025") |>
  distinct(url) |>
  pull(url) |>
  # Download the archive, allowing ten minutes for the transfer.
  request() |>
  req_timeout(600) |>
  req_retry(max_tries = 3) |>
  req_perform(path = boundary_zip)

# Extract the shapefile and its required companion files into one directory.
unzip(boundary_zip, exdir = boundary_dir)

# PRG archives include multiple administrative levels. Select only powiats,
# retaining source attributes and the source CRS rather than selecting gminas
# or dissolving current boundaries into an assumed historical geography.
poland_powiat_boundaries <- list.files(
  boundary_dir,
  pattern = "powiat.*\\.shp$",
  full.names = TRUE,
  recursive = TRUE,
  ignore.case = TRUE
) |>
  # Read the powiat layer, clean source fields and repair invalid geometry.
  read_sf() |>
  janitor::clean_names() |>
  st_make_valid() |>
  select(jpt_kod_je, jpt_nazwa, regon, geometry) |>
  arrange(jpt_kod_je)


# Save tutorial files and package datasets -------------------------------------

# Write crime counts to a single-sheet Excel workbook.
write_xlsx(
  list(przestepstwa = poland_property_crime_counts),
  here::here("inst/extdata/poland_property_crime_counts.xlsx")
)

write_tsv(
  poland_population,
  here::here("inst/extdata/poland_population.tsv"),
  na = "NA"
)

# Write boundaries and their attributes to a single-file GeoPackage.
poland_powiat_boundaries |>
  write_sf(
    here::here("inst/extdata/poland_powiat_boundaries.gpkg"),
    layer = "powiaty"
  )

# Save the same three datasets as compressed package data objects.
usethis::use_data(
  poland_property_crime_counts,
  poland_population,
  poland_powiat_boundaries,
  overwrite = TRUE,
  compress = "xz"
)

# Remove temporary downloads and extracted files after saving the outputs.
unlink(boundary_zip)
unlink(boundary_dir, recursive = TRUE)
