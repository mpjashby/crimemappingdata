# Shootings in New York City in 2019

Dataset of shootings in New York City recorded by the New York City
Police Department (NYPD) in 2019.

## Usage

``` r
nyc_shootings
```

## Format

A data frame with 967 rows and six columns:

- incident_key:

  Numeric reference number for each incident

- boro:

  Borough name

- occur_date:

  Date offence occurred

- murder:

  Whether the shooting was fatal or not (logical)

- longitude:

  Longitude

- latitude:

  Latitude

This dataset is also available as a stand-alone file in CSV format at
<https://mpjashby.github.io/crimemappingdata/nyc_shootings.csv>.

Licence: NYC Open Data Law

## Source

New York City Police Department
<https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Historic-/833y-fsy8>

## See also

[`bronx_shootings`](https://pkgs.lesscrime.info/crimemappingdata/reference/bronx_shootings.md):
Shootings in the Bronx in 2019.
[`nyc_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/nyc_homicides.md):
Homicides in New York City, 2016 to 2018.
[`nyc_precincts`](https://pkgs.lesscrime.info/crimemappingdata/reference/nyc_precincts.md):
New York City Police precinct boundaries.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    nyc_shootings,
    coords = c("longitude", "latitude"),
    crs = "EPSG:4326"
  )

  sfhotspot::hotspot_map(
    map_data,
    basemap_type = "cartolight",
    colour = "red2",
    size = 0.6
  )
}
```
