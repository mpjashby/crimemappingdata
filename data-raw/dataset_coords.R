# This script creates an image file of a map of the locations covered by each
# **crime** datasaet in the package. This map is loaded in the README.Rmd file,
# but the image is created here to avoid this package having `ggplot2`,
# `rnaturalearth`, `tibble` and `tidygeocoder` as dependencies.

library(sf)
library(tidygeocoder)
library(tidyverse)

# NOTE: `dataset` must exactly match the dataset name
dataset_coords <- tribble(
  ~dataset, ~locality,
  "aggravated_assaults", "Chicago, USA",
  "bronx_shootings", "New York City, USA",
  "cdmx_car_jackings", "Mexico City, Mexico",
  "czechia_collisions", "Czechia",
  "czechia_mcycle_thefts", "Czechia",
  "downtown_homicides", "Atlanta, GA",
  "glenrose_heights_homicides", "Atlanta, GA",
  "japan_violence_counts", "Japan",
  "kansas_city_frauds", "Kansas City, USA",
  "london_crimes_2021", "London, UK",
  "malaysia_violence_counts", "Malaysia",
  "medellin_homicides", "Medellin, Colombia",
  "northumbria_asb", "Northumbria, UK",
  "nottingham_burglary", "Nottingham, UK",
  "nyc_shootings", "New York City, USA",
  "qld_stalking", "Queensland, Australia",
  "san_francisco_robbery", "San Francisco, USA",
  "south_africa_vehicle_thefts", "South Africa",
  "uttar_pradesh_murders", "Uttar Pradesh, India",
  "vancouver_thefts", "Vancouver, Canada"
) |>
  geocode(address = locality) |>
  st_as_sf(coords = c("long", "lat"), crs = "EPSG:4326")

world <- rnaturalearth::countries110 |>
  st_as_sf() |>
  st_transform("ESRI:54030")

world_bg <- st_graticule() |>
  st_transform("ESRI:54030") |>
  st_convex_hull() |>
  summarise(geometry = st_union(geometry)) |>
  st_convex_hull()

ggplot() +
  geom_sf(data = world_bg, colour = NA, fill = "#C6ECFF") +
  geom_sf(data = st_graticule(), colour = "grey70", linewidth = 0.1) +
  geom_sf(data = world, colour = "grey60", fill = "#FEFEE9") +
  geom_sf(data = dataset_coords, colour = "#CC0000", size = 2) +
  theme_void()
