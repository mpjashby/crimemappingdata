# Buenos Aires Subte (metro) lines

Buenos Aires Subte (metro) lines

## Usage

``` r
buenos_aires_subte_lines
```

## Format

A data frame with 98 rows and 3 columns.

- segment_id:

  Line segment identifier

- line:

  Subte line name

- geometry:

  SF line geometry

A version of this dataset is available as a stand-alone file at
<https://mpjashby.github.io/crimemappingdata/buenos_aires_subte_lines.gpkg>.

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
[`buenos_aires_subte_stations`](https://pkgs.lesscrime.info/crimemappingdata/reference/buenos_aires_subte_stations.md):
Buenos Aires Subte (metro) stations.
[`retiro_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/retiro_homicides.md):
Retiro homicides in 2023.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    buenos_aires_subte_lines,
    basemap_type = "cartolight",
    colour = "red2",
    size = 0.3
  )
}
```
