# Alcaldías (boroughs) of Mexico City

Spatial dataset of the boundaries of the alcaldías (boroughs) of Mexico
City.

## Usage

``` r
cdmx_alcaldias
```

## Format

Spatial dataset containing 16 rows and 3 columns:

- municip:

  Row number

- nomgeo:

  Name

- geometry:

  SF polygon geometry

This dataset is also available as a stand-alone file in geopackage
format at
<https://mpjashby.github.io/crimemappingdata/cdmx_alcaldias.gpkg>.

Licence: Creative Commons Attribution
<https://creativecommons.org/licenses/by/4.0/>

## Source

Government of Mexico City

## See also

[`cdmx_car_jacking`](https://pkgs.lesscrime.info/crimemappingdata/reference/cdmx_car_jacking.md):
Car jackings in Mexico City.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    cdmx_alcaldias,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
