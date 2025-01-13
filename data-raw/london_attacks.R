library(tidyverse)

# Create object and save as CSV
london_attacks <- tribble(
  ~date, ~latitude, ~longitude, ~description,
  "2005-07-07", 51.5186, -0.0813, "Suicide bomb exploded on train, killing 7", # Liverpool St
  "2005-07-07", 51.5200, -0.1678, "Suicide bomb exploded on train, killing 6", # Edgware Road
  "2005-07-07", 51.5302, -0.1241, "Suicide bomb exploded on train, killing 26", # King's Cross
  "2005-07-07", 51.5250, -0.1291, "Suicide bomb exploded on bus, killing 13", # Tavistock Square
  "2013-05-22", 51.4883, 0.0623, "Soldier fatally stabbed", # Woolwich
  "2017-03-22", 51.5008, -0.1219, "Car driven at pedestrians and people stabbed, killing 5", # Westminster Bridge
  "2017-06-03", 51.5081, -0.0878, "Van driven at pedestrians and people stabbed, killing 8", # London Bridge
  "2017-06-19", 51.5630, -0.1083, "Van driven at pedestrians, killing 1" # Finsbury Park
) |>
  write_csv(here::here("inst/extdata/london_attacks.csv"))

# Save RData version
usethis::use_data(london_attacks, overwrite = TRUE)
