# Homicides in the region of Sao Paulo

Dataset of homicides recorded by police in the immediate region of Sao
Paulo from 2017 to 2022.

## Usage

``` r
sao_paulo_homicides
```

## Format

A data frame containing 6,214 rows and 7 columns:

- year:

  Year

- date:

  Homicide date

- municipality:

  Municipality

- location_type:

  Type of location

- victim_sex:

  Victim sex

- latitude:

  Latitude

- longitude:

  Longitude

A version of this dataset is also available as a stand-alone file at
<https://mpjashby.github.io/crimemappingdata/sao_paulo_homicides.xlsx>.

The original dataset has been cleaned to remove homicides with missing
co-ordinates.

Licence: public domain

## Source

State of Sao Paulo Public Security Secretariat

## See also

[`sao_paulo_muni`](https://pkgs.lesscrime.info/crimemappingdata/reference/sao_paulo_muni.md):
Municipality boundaries in São Paulo.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    sao_paulo_homicides,
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
