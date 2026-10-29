# Local authority districts of Northumbria

Dataset of the boundaries of the local authority districts in
Northumbria, England, in 2022.

## Usage

``` r
northumbria_districts
```

## Format

A simple features (SF) object with 5 rows and 3 columns:

- objectid:

  Government Statistical Service code for each district

- district:

  District name

- geometry:

  SF polygon geometry

This dataset is also available as a stand-alone file in geoJSON format
at
<https://mpjashby.github.io/crimemappingdata/northumbria_districts.geojson>.

Licence: Open Government Licence

## Source

Office for National Statistics

## See also

[`northumbria_asb`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_asb.md):
Anti-social behaviour in Northumbria.
[`northumbria_ward_pop`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_ward_pop.md):
Northumbria ward population.
[`northumbria_wards`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_wards.md):
Local government wards of Northumbria.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    northumbria_districts,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
