library(writexl)
library(sf)
library(tidyverse)

# Get Queensland stalking data
# Source: https://www.police.qld.gov.au/maps-and-statistics
# The first row of the data file has an empty column corresponding to a row ID
# in the last column of the data, which causes `read_csv()` to incorrectly read
# the data. This is dealt with by manually setting the column names and then
# removing the first row from the data.
qld_stalking <- read_csv(
  "https://open-crime-data.s3-ap-southeast-2.amazonaws.com/Crime%20Statistics/division_Reported_Offences_Number.csv",
  col_names = c(
    "Division", "Month Year", "Homicide (Murder)", "Other Homicide",
    "Attempted Murder", "Conspiracy to Murder",
    "Manslaughter (excl. by driving)",
    "Manslaughter Unlawful Striking Causing Death",
    "Driving Causing Death", "Assault", "Grievous Assault", "Serious Assault",
    "Serious Assault (Other)", "Common Assault'", "Sexual Offences",
    "Rape and Attempted Rape", "Other Sexual Offences", "Robbery",
    "Armed Robbery", "Unarmed Robbery", "Other Offences Against the Person",
    "Kidnapping & Abduction etc.", "Extortion", "Stalking",
    "Life Endangering Acts", "Offences Against the Person", "Unlawful Entry",
    "Unlawful Entry With Intent - Dwelling",
    "Unlawful Entry Without Violence - Dwelling",
    "Unlawful Entry With Violence - Dwelling",
    "Unlawful Entry With Intent - Shop", "Unlawful Entry With Intent - Other",
    "Arson", "Other Property Damage", "Unlawful Use of Motor Vehicle",
    "Other Theft (excl. Unlawful Entry)", "Stealing from Dwellings",
    "Shop Stealing", "Vehicles (steal from/enter with intent)",
    "Other Stealing", "Fraud", "Fraud by Computer", "Fraud by Cheque",
    "Fraud by Credit Card", "Identity Fraud", "Other Fraud",
    "Handling Stolen Goods", "Possess Property Suspected Stolen",
    "Receiving Stolen Property", "Possess etc. Tainted Property",
    "Other Handling Stolen Goods", "Offences Against Property", "Drug Offences",
    "Trafficking Drugs", "Possess Drugs", "Produce Drugs", "Sell Supply Drugs",
    "Other Drug Offences", "Prostitution Offences",
    "Found in Places Used for Purpose of Prostitution Offences",
    "Have Interest in Premises Used for Prostitution Offences",
    "Knowingly Participate in Provision Prostitution Offences",
    "Public Soliciting", "Procuring Prostitution",
    "Permit Minor to be at a Place Used for Prostitution Offences",
    "Advertising Prostitution", "Other Prostitution Offences",
    "Liquor (excl. Drunkenness)", "Gaming Racing & Betting Offences",
    "Breach Domestic Violence Protection Order", "Trespassing and Vagrancy",
    "Weapons Act Offences", "Unlawful Possess Concealable Firearm",
    "Unlawful Possess Firearm - Other", "Bomb Possess and/or use of",
    "Possess and/or use other weapons; restricted items",
    "Weapons Act Offences - Other", "Good Order Offences",
    "Disobey Move-on Direction", "Resist Incite Hinder Obstruct Police",
    "Fare Evasion", "Public Nuisance", "Stock Related Offences",
    "Traffic and Related Offences", "Dangerous Operation of a Vehicle",
    "Drink Driving", "Disqualified Driving",
    "Interfere with Mechanism of Motor Vehicle", "Miscellaneous Offences",
    "Other Offences", "row_id"
  ),
  skip = 1
) |>
  janitor::clean_names() |>
  mutate(
    date = parse_date(month_year, format = "%b%y"),
    year = lubridate::year(date),
    # merge Highfields into Toowoomba since the 2016 maps in the population
    # reports show that they were a combined Toowoomba division at that point
    division = recode(
      division,
      "Highfields" = "Toowoomba",
      "Logan Village Yarrabilba" = "Jimboomba",
      "Seaforth" = "Marian"
    )
  ) |>
  select(division, year, stalking) |>
  group_by(division, year) |>
  summarise(stalking = sum(stalking)) |>
  glimpse()

# Save stalking data
# This cannot be done in the pipe since `write_xlsx()` returns a file path, not
# the input data
write_xlsx(
  qld_stalking,
  "inst/extdata/qld_stalking.xlsx",
  format_headers = FALSE
)


# Get Queensland Police division boundaries
# Source: https://www.data.qld.gov.au/dataset/qps-divisions/resource/fa6a7917-43de-4036-a704-25f545c24093
temp_dir <- str_glue("{tempdir()}/qld_boundaries/")
dir.create(temp_dir)
download.file(
  "http://open-crime-data.s3-ap-southeast-2.amazonaws.com/document/QPS_DIVISIONS.zip",
  str_glue("{temp_dir}/boundaries.zip")
)
unzip(str_glue("{temp_dir}/boundaries.zip"), exdir = temp_dir)

# Prepare police divsion boundaries
qld_police_divisions <- str_glue("{temp_dir}/QPS_DIVISIONS.shp") |>
  read_sf() |>
  janitor::clean_names() |>
  mutate(division = str_to_title(division)) |>
  # Merge Highfields into Toowoomba since the 2016 maps in the population
  # reports show that they were a combined Toowoomba division at that point
  mutate(division = recode(
    division,
    "Highfields" = "Toowoomba",
    "Logan Village Yarrabilba" = "Jimboomba",
    "Seaforth" = "Marian"
  )) %>%
  group_by(division) |>
  summarise() |>
  write_sf("inst/extdata/qld_police_divisions.gpkg") |>
  glimpse()



# Load Queensland police division population
# Populations have been extracted manually from PDF reports called "POLSIS
# Profiles Resident". Since these numbers have already been extracted, this
# code just loads the resulting gzipped CSV file so it can be stored as a .Rda
# file. This is obviously a sub-optimal solution.
# Source: https://www.qld.gov.au/search?query=polsis+profiles+resident&num_ranks=10&tiers=off&collection=qld-gov
qld_population <- read_csv("inst/extdata/qld_population.csv.gz") |>
  glimpse()


# Write Rda files
usethis::use_data(
  qld_stalking,
  qld_police_divisions,
  qld_population,
  overwrite = TRUE
)
