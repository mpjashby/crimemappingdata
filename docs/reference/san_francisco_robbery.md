# Personal robberies in San Francisco in 2019

Dataset of personal robberies in San Francisco in 2019.

## Usage

``` r
san_francisco_robbery
```

## Format

A data frame containing 951 rows and 5 columns:

- uid:

  Numeric reference number for each crime

- offense_type:

  Offence type (always "personal robbery")

- date_time:

  Date-time at which offence occurred

- longitude:

  Longitude

- latitude:

  Latitude

This dataset is also available as a stand-alone file in CSV format at
<https://mpjashby.github.io/crimemappingdata/san_francisco_robbery.csv>.

Licence: Open Data Commons Public Domain Dedication and License
<https://opendatacommons.org/licenses/pddl/1.0/>

## Source

San Francisco Police Department

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    san_francisco_robbery,
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
