# Metro and cable-car stations in Medellin

Locations of metro and cable-car stations in Medellin, Colombia, as of
early 2023.

## Usage

``` r
medellin_metro_stns
```

## Format

Data frame with 48 rows and 6 columns:

- linea:

  Line letter

- nombre:

  Station name

- municipio:

  Municipality name

- sistema:

  Metro or Cable

- x:

  Longitude

- y:

  Latitude

This dataset is also available as a stand-alone file in CSV format at
<https://mpjashby.github.io/crimemappingdata/medellin_metro_stns.csv>.

## Source

Metro de Medellin

## See also

[`medellin_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/medellin_homicides.md):
Medellin homicides.
[`medellin_metro_lines`](https://pkgs.lesscrime.info/crimemappingdata/reference/medellin_metro_lines.md):
Metro and cable-car lines in Medellin.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    medellin_metro_stns,
    coords = c("x", "y"),
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
