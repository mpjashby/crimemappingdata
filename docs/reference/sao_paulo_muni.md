# Sao Paolo municipality boundaries

Dataset of municipality boundaries in the immediate region of Sao Paulo,
2010.

## Usage

``` r
sao_paulo_muni
```

## Format

A data frame containing 60 rows and 3 columns:

- code_muni:

  Statistical code for municipality

- name_muni:

  Municipality name

- geom:

  Feature geometry

A version of this dataset is also available as a stand-alone file at
<https://mpjashby.github.io/crimemappingdata/sao_paulo_muni.geojson>.

Licence: public domain

## Source

Institute for Applied Economic Research

## See also

[`sao_paulo_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/sao_paulo_homicides.md):
Homicides in the region of Sao Paulo.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    sao_paulo_muni,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
