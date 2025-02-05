
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
the corresponding stand-alone file URL. Different stand-alone datasets
are provided in different file formats (including spatial and
non-spatial formats) to give the opportunity for students to practice
loading files of different types (e.g. using `readr::read_csv()` or
`readxl::read_excel()`).

| Dataset | Description | Format |
|:---|:---|:---|
| [`aggravated_assaults`](https://pkgs.lesscrime.info/crimemappingdata/reference/aggravated_assaults.html) | Aggravated assaults in Austin in 2019 | `.xlsx` |
| [`bronx_shootings`](https://pkgs.lesscrime.info/crimemappingdata/reference/bronx_shootings.html) | Shootings in the Bronx in 2019 | `.csv` |
| [`cdmx_alcaldias`](https://pkgs.lesscrime.info/crimemappingdata/reference/cdmx_alcaldias.html) | Alcaldías (boroughs) of Mexico City | `.gpkg` |
| [`cdmx_car_jacking`](https://pkgs.lesscrime.info/crimemappingdata/reference/cdmx_car_jacking.html) | Car jackings in Mexico City | `.gpkg` |
| [`chicago_aggravated_assaults`](https://pkgs.lesscrime.info/crimemappingdata/reference/chicago_aggravated_assaults.html) | Aggravated assaults in Chicago, 2010 to 2019 | `.csv.gz` |
| [`chicago_police_districts`](https://pkgs.lesscrime.info/crimemappingdata/reference/chicago_police_districts.html) | Chicago Police Department Districts | `.kml` |
| [`cincinnati_burglary`](https://pkgs.lesscrime.info/crimemappingdata/reference/cincinnati_burglary.html) | Burglaries in Cincinnati, 2016 to 2018 | `.csv.gz` |
| [`czechia_collisions`](https://pkgs.lesscrime.info/crimemappingdata/reference/czechia_collisions.html) | Drink/drug-related traffic collisions in Czechia | `.gpkg` |
| [`czechia_mcycle_thefts`](https://pkgs.lesscrime.info/crimemappingdata/reference/czechia_mcycle_thefts.html) | Motorcycle thefts in Czechia | `.gpkg` |
| [`downtown_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/downtown_homicides.html) | Homicides in downtown Atlanta in 2019 | `.gpkg` |
| [`downtown_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/downtown_homicides.html) | Homicides in downtown Atlanta in 2019 | `.csv` |
| [`glenrose_heights_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/glenrose_heights_homicides.html) | Homicides in Glenrose Heights in 2019 | `.gpkg` |
| [`glenrose_heights_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/glenrose_heights_homicides.html) | Homicides in Glenrose Heights in 2019 | `.csv` |
| [`hungerford_shootings`](https://pkgs.lesscrime.info/crimemappingdata/reference/hungerford_shootings.html) | Shootings in the Hungerford Massacre | `.csv` |
| [`japan_violence_counts`](https://pkgs.lesscrime.info/crimemappingdata/reference/japan_violence_counts.html) | Counts of violent crime in Japan, 2012 | `.rds` |
| [`lancashire_asb`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_asb.html) | Anti-social behaviour in Lancashire | `.tab` |
| [`lancashire_districts`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_districts.html) | Local authority districts of Lancashire | `.geojson` |
| [`lancashire_ward_pop`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_ward_pop.html) | Lancashire ward population | `.xlsx` |
| [`lancashire_wards`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_wards.html) | Local government wards of Lancashire | `.gpkg` |
| [`london_attacks`](https://pkgs.lesscrime.info/crimemappingdata/reference/london_attacks.html) | Fatal terrorist attacks in London | `.csv` |
| [`london_crimes`](https://pkgs.lesscrime.info/crimemappingdata/reference/london_crimes.html) | Crimes in London | `.zip` |
| [`malaysia_violence_counts`](https://pkgs.lesscrime.info/crimemappingdata/reference/malaysia_violence_counts.html) | Violent crime counts in Malaysia, 2006 to 2017 | `.rds` |
| [`medellin_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/medellin_homicides.html) | Medellin homicides | `.csv` |
| [`medellin_metro_lines`](https://pkgs.lesscrime.info/crimemappingdata/reference/medellin_metro_lines.html) | Metro and cable-car lines in Medellin | `.zip` |
| [`medellin_metro_stns`](https://pkgs.lesscrime.info/crimemappingdata/reference/medellin_metro_stns.html) | Metro and cable-car stations in Medellin | `.csv` |
| [`northants_burglary_counts`](https://pkgs.lesscrime.info/crimemappingdata/reference/northants_burglary_counts.html) | Counts of burglary in Northamptonshire in 2020 | `.rds` |
| [`northumbria_asb`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_asb.html) | Anti-social behaviour in Northumbria | `.tab` |
| [`northumbria_districts`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_districts.html) | Local authority districts of Northumbria | `.geojson` |
| [`northumbria_ward_pop`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_ward_pop.html) | Northumbria ward population | `.xlsx` |
| [`northumbria_wards`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_wards.html) | Local government wards of Northumbria | `.gpkg` |
| [`nottingham_burglary`](https://pkgs.lesscrime.info/crimemappingdata/reference/nottingham_burglary.html) | Burglaries in Nottingham | `.csv.gz` |
| [`nottingham_robbery`](https://pkgs.lesscrime.info/crimemappingdata/reference/nottingham_robbery.html) | Robberies in Nottingham | `.csv.gz` |
| [`nottingham_wards`](https://pkgs.lesscrime.info/crimemappingdata/reference/nottingham_wards.html) | Local government wards of Nottingham | `.gpkg` |
| [`nyc_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/nyc_homicides.html) | Homicides in New York City, 2016 to 2018 | `.csv` |
| [`nyc_precincts`](https://pkgs.lesscrime.info/crimemappingdata/reference/nyc_precincts.html) | New York City Police precinct boundaries | `.gpkg` |
| [`nyc_shootings`](https://pkgs.lesscrime.info/crimemappingdata/reference/nyc_shootings.html) | Shootings in New York City in 2019 | `.csv` |
| [`qld_police_divisions`](https://pkgs.lesscrime.info/crimemappingdata/reference/qld_police_divisions.html) | Queensland Police Service division boundaries | `.gpkg` |
| [`qld_population`](https://pkgs.lesscrime.info/crimemappingdata/reference/qld_population.html) | Population of Queensland Police Service divisions | `.csv.gz` |
| [`qld_stalking`](https://pkgs.lesscrime.info/crimemappingdata/reference/qld_stalking.html) | Stalking in Queensland from 2001 to 2022 | `.xlsx` |
| [`san_francisco_robbery`](https://pkgs.lesscrime.info/crimemappingdata/reference/san_francisco_robbery.html) | Personal robberies in San Francisco in 2019 | `.csv` |
| [`sao_paulo_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/sao_paulo_homicides.html) | Homicides in the region of Sao Paulo | `.xlsx` |
| [`sao_paulo_muni`](https://pkgs.lesscrime.info/crimemappingdata/reference/sao_paulo_muni.html) | Sao Paolo municipality boundaries | `.geojson` |
| [`tempe_opioid_calls`](https://pkgs.lesscrime.info/crimemappingdata/reference/tempe_opioid_calls.html) | Calls to opioid overdoses in Tempe, Arizona | `.csv` |
| [`uttar_pradesh_districts`](https://pkgs.lesscrime.info/crimemappingdata/reference/uttar_pradesh_districts.html) | Districts of Uttar Pradesh | `.gpkg` |
| [`uttar_pradesh_murders`](https://pkgs.lesscrime.info/crimemappingdata/reference/uttar_pradesh_murders.html) | Murders in Uttar Pradesh | `.csv` |
| [`uttar_pradesh_population`](https://pkgs.lesscrime.info/crimemappingdata/reference/uttar_pradesh_population.html) | Population of districts in Uttar Pradesh | `.csv` |
| [`vancouver_thefts`](https://pkgs.lesscrime.info/crimemappingdata/reference/vancouver_thefts.html) | Thefts in Vancouver in 2020 | `.csv.gz` |

Note that gzipped CSV files (with the file extension `.csv.gz`) can be
opened using `readr::read_csv()` and functions from other packages, but
not `base::read.csv()`.

You can find more details about each dataset in the vignette
`vignette("dataset_summary")`.

## Using the data in teaching

For suggestions on how to use the data in this package for teaching, as
well as details of each dataset, see the vignette
`vignette("teaching")`.

## Data licences

This package is licensed under the MIT Licence, but the individual
datasets have been licensed by the data provider using a variety of
different open-data licences. Check the manual page for each dataset for
details of the relevant licence. Users are responsible for using the
data in accordance with the applicable licence for a dataset.
