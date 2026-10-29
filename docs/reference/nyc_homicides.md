# Homicides in New York City, 2016 to 2018

Dataset of homicides recorded by police in New York City between 2016
and 2018.

## Usage

``` r
nyc_homicides
```

## Format

Data frame with 904 rows and 4 columns:

- uid:

  Unique numeric identifier

- offense_date:

  Offense date

- longitude:

  Longitude

- latitude:

  Latitude

This dataset is also available as a stand-alone file in comma-separated
values (CSV) format at
<https://mpjashby.github.io/crimemappingdata/nyc_homicides.csv>

Licence: NYC Open Data Law

## Source

City of New York

## See also

[`bronx_shootings`](https://pkgs.lesscrime.info/crimemappingdata/reference/bronx_shootings.md):
Shootings in the Bronx in 2019.
[`nyc_precincts`](https://pkgs.lesscrime.info/crimemappingdata/reference/nyc_precincts.md):
New York City Police precinct boundaries.
[`nyc_shootings`](https://pkgs.lesscrime.info/crimemappingdata/reference/nyc_shootings.md):
Shootings in New York City in 2019.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    nyc_homicides,
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
