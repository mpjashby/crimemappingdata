# Medellin homicides

Dataset of homicides in Medellin, Colombia, from 2010 to 2019.

## Usage

``` r
medellin_homicides
```

## Format

A data frame of 9,360 rows and 6 columns:

- fecha_hecho:

  Date-time of the incident

- longitud:

  Longitude

- latitud:

  Latitude

- sexo:

  Sex of victim

- edad:

  Age of victim in years

- modalidad:

  Method of homicide

This dataset is also available as a stand-alone file in CSV format at
<https://mpjashby.github.io/crimemappingdata/medellin_homicides.csv>.
Note that the CSV file uses semi colons as column delimiters and commas
as decimal separators in numbers. This file can be read with functions
such as
[`readr::read_csv2()`](https://readr.tidyverse.org/reference/read_delim.html).

Licence: Creative Commons Attribution Share-Alike
<https://opendefinition.org/licenses/cc-by-sa/>

## See also

[`medellin_metro_lines`](https://pkgs.lesscrime.info/crimemappingdata/reference/medellin_metro_lines.md):
Metro and cable-car lines in Medellin.
[`medellin_metro_stns`](https://pkgs.lesscrime.info/crimemappingdata/reference/medellin_metro_stns.md):
Metro and cable-car stations in Medellin.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  # Some incidents have no recorded coordinates.
  map_data <- subset(medellin_homicides, !is.na(longitud) & !is.na(latitud))
  map_data <- sf::st_as_sf(
    map_data,
    coords = c("longitud", "latitud"),
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
