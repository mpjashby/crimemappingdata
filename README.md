
<!-- README.md is generated from README.Rmd. Please edit that file -->

# crimemappingdata

<!-- badges: start -->
<!-- badges: end -->

The crimemappingdata package contains a variety of datasets that are
useful in learning crime mapping. These datasets are used in the
[crimemapping package](https://github.com/mpjashby/crimemapping/) but
are also available for use by anyone else in accordance with the licence
shown in the documentation for each dataset.

## Installation

You can install the development version of crimemappingdata from
[GitHub](https://github.com/mpjashby/crimemappingdata/) with:

``` r
# install.packages("remotes")
remotes::install_github("mpjashby/crimemappingdata")
```

## Available datasets

The following datasets are available, both as:

- R data that can be called using the `data()` function,
  e.g. `data(aggravated_assaults)`, and
- stand-alone files that can be downloaded in the formats shown below.

See the manual page for each dataset (e.g. `?aggravated_assaults`) for
the stand-alone file URL for each dataset. Different stand-alone
datasets are provided in different file formats (including spatial and
non-spatial formats) to give the opportunity for students to practice
loading files of different types (e.g. using `readr::read_csv()` or
`readxl::read_excel()`).

| Dataset                    | Description                                       | Format    |
|:---------------------------|:--------------------------------------------------|:----------|
| aggravated_assaults        | Aggravated assaults in Austin in 2019             | `.xlsx`   |
| bronx_shootings            | Shootings in the Bronx in 2019                    | `.csv`    |
| cdmx_alcaldias             | Alcaldías (boroughs) of Mexico City               | `.gpkg`   |
| cdmx_car_jacking           | Car jackings in Mexico City                       | `.gpkg`   |
| czechia_collisions         | Drink/drug-related traffic collisions in Czechia  | `.gpkg`   |
| czechia_mcycle_thefts      | Motorcycle thefts in Czechia                      | `.gpkg`   |
| downtown_homicides         | Homicides in downtown Atlanta in 2019             | `.csv`    |
| downtown_homicides         | Homicides in downtown Atlanta in 2019             | `.gpkg`   |
| glenrose_heights_homicides | Homicides in Glenrose Heights in 2019             | `.csv`    |
| glenrose_heights_homicides | Homicides in Glenrose Heights in 2019             | `.gpkg`   |
| kansas_city_frauds         | Fraud offences in Kansas City in 2015             | `.csv.gz` |
| nyc_shootings              | Shootings in New York City in 2019                | `.csv`    |
| qld_police_divisions       | Queensland Police Service division boundaries     | `.gpkg`   |
| qld_population             | Population of Queensland Police Service divisions | `.csv.gz` |
| qld_stalking               | Stalking in Queensland from 2001 to 2022          | `.xlsx`   |
| san_francisco_robbery      | Personal robberies in San Francisco in 2019       | `.csv`    |
| uttar_pradesh_districts    | Districts of Uttar Pradesh                        | `.gpkg`   |
| uttar_pradesh_murders      | Murders in Uttar Pradesh                          | `.csv`    |
| uttar_pradesh_population   | Population of districts in Uttar Pradesh          | `.csv`    |
| vancouver_thefts           | Thefts in Vancouver in 2020                       | `.csv.gz` |

Note that gzipped CSV files (with the file extension `.csv.gz`) can be
opened using `readr::read_csv()` and functions from other packages, but
not `base::read.csv()`.

## Using the data in teaching

For suggestions on how to use the data in this package for teaching, as
well as details of each dataset, see the vignette
`vignette("teaching")`.
