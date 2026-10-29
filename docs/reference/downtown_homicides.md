# Homicides in downtown Atlanta in 2019

Dataset of the four homicides that occurred in the downtown
neighbourhood of Atlanta, GA, in 2019.

## Usage

``` r
downtown_homicides
```

## Format

A data frame with four rows and four columns:

- report_number:

  A reference number

- label:

  A pre-formatted label giving address and date/time

- longitude:

  Longitude

- latitude:

  Latitude

This dataset is also available as a stand-alone file in two formats: in
CSV format at
<https://mpjashby.github.io/crimemappingdata/downtown_homicides.csv> and
in GeoPackage format at
<https://mpjashby.github.io/crimemappingdata/downtown_homicides.gpkg>.

Licence: public domain

## Source

Atlanta Police Department

## See also

[`glenrose_heights_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/glenrose_heights_homicides.md):
Homicides in Glenrose Heights in 2019.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    downtown_homicides,
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
