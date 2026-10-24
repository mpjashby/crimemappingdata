# This script creates an image file of a map of the locations covered by each
# **crime** dataset in the package. This map is loaded in the README.Rmd file,
# but the image is created here to avoid this package having `ggplot2`,
# `rnaturalearth` and `tibble` as dependencies.

library(sf)
library(tidyverse)

# Use one crime/incident dataset per location; supporting datasets and other
# crime datasets from the same place share its marker. In particular, group
# the Bronx with New York City, Retiro with Buenos Aires, and Glenrose Heights
# with Atlanta. Each dataset name must match a dataset provided by the package.
# Approximate representative coordinates are sufficient for this world map;
# store them here to keep the figure reproducible without online geocoding.
dataset_coords <- tribble(
  ~dataset                       , ~locality                 , ~long   , ~lat   ,
  "aggravated_assaults"          , "Austin, USA"             ,  -97.74 ,  30.27 ,
  "nyc_shootings"                , "New York City, USA"      ,  -74.01 ,  40.71 ,
  "buenos_aires_robbery"         , "Buenos Aires, Argentina" ,  -58.38 , -34.60 ,
  "cdmx_car_jacking"             , "Mexico City, Mexico"     ,  -99.13 ,  19.43 ,
  "chicago_aggravated_assaults"  , "Chicago, USA"            ,  -87.63 ,  41.88 ,
  "cincinnati_burglary"          , "Cincinnati, USA"         ,  -84.51 ,  39.10 ,
  "czechia_collisions"           , "Czechia"                 ,   15.47 ,  49.82 ,
  "downtown_homicides"           , "Atlanta, USA"            ,  -84.39 ,  33.75 ,
  "germany_violence_counts"      , "Germany"                 ,   10.45 ,  51.17 ,
  "hungerford_shootings"         , "Hungerford, UK"          ,   -1.51 ,  51.42 ,
  "japan_violence_counts"        , "Japan"                   ,  138.25 ,  36.20 ,
  "lancashire_asb"               , "Lancashire, UK"          ,   -2.61 ,  53.88 ,
  "london_crimes"                , "London, UK"              ,   -0.13 ,  51.51 ,
  "malaysia_violence_counts"     , "Malaysia"                ,  109.70 ,   4.21 ,
  "medellin_homicides"           , "Medellin, Colombia"      ,  -75.58 ,   6.24 ,
  "montreal_mefait"              , "Montreal, Canada"        ,  -73.57 ,  45.50 ,
  "northants_burglary_counts"    , "Northamptonshire, UK"    ,   -0.90 ,  52.27 ,
  "northumbria_asb"              , "Northumbria, UK"         ,   -1.61 ,  55.00 ,
  "nottingham_burglary"          , "Nottingham, UK"          ,   -1.15 ,  52.95 ,
  "poland_property_crime_counts" , "Poland"                  ,   19.15 ,  51.92 ,
  "qld_stalking"                 , "Queensland, Australia"   ,  144.00 , -22.00 ,
  "san_francisco_robbery"        , "San Francisco, USA"      , -122.42 ,  37.77 ,
  "sao_paulo_homicides"          , "Sao Paulo, Brazil"       ,  -46.63 , -23.55 ,
  "tempe_opioid_calls"           , "Tempe, USA"              , -111.94 ,  33.43 ,
  "uttar_pradesh_murders"        , "Uttar Pradesh, India"    ,   80.95 ,  26.85 ,
  "vancouver_thefts"             , "Vancouver, Canada"       , -123.12 ,  49.28
) |>
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

ggsave("man/figures/dataset_coords.png", width = 6, height = 4, dpi = 150)
