# Retiro homicides in 2023

Homicides in the Retiro neighbourhood of Buenos Aires in 2023.

## Usage

``` r
retiro_homicides
```

## Format

A data frame with 13 rows and 4 columns.

- id_mapa:

  Source record identifier

- fecha:

  Recorded event date and time (to the nearest hour)

- longitud:

  Longitude in decimal degrees

- latitud:

  Latitude in decimal degrees

A version of this dataset is available as a stand-alone file at
<https://mpjashby.github.io/crimemappingdata/retiro_homicides.csv>. Note
that while this is a Spanish-language dataset the file uses commas as
delimiters.

Licence: Creative Commons Attribution

## Source

Direccion General de Estadistica Criminal y Mapa del Delito, City of
Buenos Aires <https://data.buenosaires.gob.ar/dataset/delitos>.

## See also

[`buenos_aires_barrios`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_barrios.md):
Buenos Aires barrio boundaries.
[`buenos_aires_robbery`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_robbery.md):
Buenos Aires robberies in 2023.
[`buenos_aires_subte_lines`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_subte_lines.md):
Buenos Aires Subte (metro) lines.
[`buenos_aires_subte_stations`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_subte_stations.md):
Buenos Aires Subte (metro) stations.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    retiro_homicides,
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
