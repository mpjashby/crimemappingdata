# Buenos Aires barrio boundaries

A dataset of barrio (neighbourhood) boundaries in the City of Buenos
Aires, Argentina.

## Usage

``` r
buenos_aires_barrios
```

## Format

A data frame with 48 rows and 5 columns.

- id:

  Polygon identifier

- nombre:

  Neighbourhood name

- comuna:

  Commune number

- area_metro:

  Area in square meters

- geometry:

  Polygon representing barrio boundary

This dataset is also available as a stand-alone file in geopackage
format at
<https://mpjashby.github.io/crimemappingdata/buenos_aires_barrios.gpkg>.

Licence: CC BY 2.5 Argentina
<https://creativecommons.org/licenses/by/2.5/ar/>.

## Source

City of Buenos Aires <https://data.buenosaires.gob.ar/dataset/barrios>.

## See also

[`buenos_aires_robbery`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_robbery.md):
Buenos Aires robberies in 2023.
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
  sfhotspot::hotspot_map(
    buenos_aires_barrios,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
