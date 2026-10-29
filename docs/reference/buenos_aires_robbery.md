# Buenos Aires robberies in 2023

Robberies in Buenos Aires in 2023.

## Usage

``` r
buenos_aires_robbery
```

## Format

A data frame with 64,983 rows and 6 columns.

- id_mapa:

  Source record identifier

- fecha:

  Recorded event date and time (to the nearest hour)

- subtipo:

  Type of robbery

- barrio:

  Neighbourhood name

- longitud:

  Longitude in decimal degrees

- latitud:

  Latitude in decimal degrees

A version of this dataset is available as a stand-alone file at
<https://mpjashby.github.io/crimemappingdata/buenos_aires_robbery.csv>.
Note that since this is a Spanish-language dataset the file uses semi
colons as delimiters.

Licence: Creative Commons Attribution

## Source

Direccion General de Estadistica Criminal y Mapa del Delito, City of
Buenos Aires <https://data.buenosaires.gob.ar/dataset/delitos>.

## See also

[`buenos_aires_barrios`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_barrios.md):
Buenos Aires barrio boundaries.
[`buenos_aires_subte_lines`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_subte_lines.md):
Buenos Aires Subte (metro) lines.
[`buenos_aires_subte_stations`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_subte_stations.md):
Buenos Aires Subte (metro) stations.
[`retiro_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/retiro_homicides.md):
Retiro homicides in 2023.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    buenos_aires_robbery,
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
