# Metro and cable-car lines in Medellin

Routes of metro and cable-car lines in Medellin, Colombia, as of early
2023.

## Usage

``` r
medellin_metro_lines
```

## Format

Simple features (SF) object with 9 rows and 4 columns:

- linea:

  Line letter

- itinerario:

  Terminus stations

- sistema:

  Metro or Cable

- geometry:

  SF line object

This dataset is also available as a stand-alone file in shape-file
format at
<https://mpjashby.github.io/crimemappingdata/medellin_metro_lines.zip>.
Note the components of the shape file are contained in a zip archive.

## Source

Metro de Medellin

## See also

[`medellin_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/medellin_homicides.md):
Medellin homicides.
[`medellin_metro_stns`](https://pkgs.lesscrime.info/crimemappingdata/reference/medellin_metro_stns.md):
Metro and cable-car stations in Medellin.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    medellin_metro_lines,
    basemap_type = "cartolight",
    colour = "red2",
    size = 0.3
  )
}
```
