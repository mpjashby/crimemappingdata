# Local government wards of Northumbria

Dataset of ward boundaries in Northumbria, England, in 2022.

## Usage

``` r
northumbria_wards
```

## Format

A simple features (SF) object with 177 rows and 3 columns:

- ward_code:

  Government Statistical Service code for each ward

- ward_name:

  Ward name

- geometry:

  SF polygon geometry

This dataset is also available as a stand-alone file in geopackage
format at
<https://mpjashby.github.io/crimemappingdata/northumbria_wards.gpkg>.

Licence: Open Government Licence

## Source

Office for National Statistics

## See also

[`northumbria_asb`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_asb.md):
Anti-social behaviour in Northumbria.
[`northumbria_districts`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_districts.md):
Local authority districts of Northumbria.
[`northumbria_ward_pop`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_ward_pop.md):
Northumbria ward population.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    northumbria_wards,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
