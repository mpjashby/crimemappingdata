# Crimes in London

Dataset of crimes recorded by police in London in 2022. Includes a small
number of crimes that occurred outside London, to provide an opportunity
to remove rows from datasets based on location.

## Usage

``` r
london_crimes
```

## Format

A data frame containing 849,409 rows and 5 columns:

- month:

  Month in which crime occurred

- type:

  Offence type

- location_type:

  Location type

- longitude:

  Longitude

- latitude:

  Latitude

This dataset is also available as a stand-alone file in zipped CSV
format at
<https://mpjashby.github.io/crimemappingdata/london_crimes.zip>.

Licence: Open Government Licence
<https://www.nationalarchives.gov.uk/doc/open-government-licence/>

## Source

Home Office <https://data.police.uk/>

## See also

[`london_attacks`](https://pkgs.lesscrime.info/crimemappingdata/reference/london_attacks.md):
Fatal terrorist attacks in London.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    london_crimes,
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
