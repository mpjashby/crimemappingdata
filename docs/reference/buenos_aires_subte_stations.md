# Buenos Aires Subte (metro) stations

Buenos Aires Subte (metro) stations

## Usage

``` r
buenos_aires_subte_stations
```

## Format

A data frame with 90 rows and 4 columns.

- station_id:

  Source station identifier

- station:

  Station name

- line:

  Metro line letter

- geometry:

  SF point geometry

A version of this dataset is available as a stand-alone file at
<https://mpjashby.github.io/crimemappingdata/buenos_aires_subte_stations.gpkg>.

Licence: CC BY 2.5 Argentina
<https://creativecommons.org/licenses/by/2.5/ar/>.

## Source

Subterraneos de Buenos Aires (SBASE), City of Buenos Aires
<https://data.buenosaires.gob.ar/dataset/subte-estaciones>.

## See also

[`buenos_aires_barrios`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_barrios.md):
Buenos Aires barrio boundaries.
[`buenos_aires_robbery`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_robbery.md):
Buenos Aires robberies in 2023.
[`buenos_aires_subte_lines`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_subte_lines.md):
Buenos Aires Subte (metro) lines.
[`retiro_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/retiro_homicides.md):
Retiro homicides in 2023.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    buenos_aires_subte_stations,
    basemap_type = "cartolight",
    colour = "red2",
    size = 0.6
  )
}
```
