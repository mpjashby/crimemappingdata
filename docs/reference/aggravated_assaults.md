# Aggravated assaults in Austin in 2019

Dataset of aggravated assaults in Austin, TX, in 2019.

## Usage

``` r
aggravated_assaults
```

## Format

A data frame containing 8,696 rows and 5 columns:

- date:

  A date-time

- longitude:

  Longitude

- latitude:

  Latitude

- location_type:

  Type of place

- location_category:

  More-detailed type of place

A version of this dataset is also available as a stand-alone file at
<https://mpjashby.github.io/crimemappingdata/aggravated_assaults.xlsx>
but the contents of the stand-alone file differ from the contents of the
package dataset. The stand-alone file is an Excel (`.xlsx`) file
containing three sheets: one each containing data (in the same format as
above) for Austin, TX (the data in the package dataset), Fort Worth, TX,
and Seattle, WA.

Licence: Creative Commons Attribution
<https://creativecommons.org/licenses/by/4.0/>

## Source

`crimedata` package <http://pkgs.lesscrime.info/crimedata/>

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    aggravated_assaults,
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
