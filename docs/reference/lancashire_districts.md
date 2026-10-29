# Local authority districts of Lancashire

Dataset of the boundaries of the local authority districts in
Lancashire, England, in 2022.

## Usage

``` r
lancashire_districts
```

## Format

A simple features (SF) object with 14 rows and 3 columns:

- objectid:

  Government Statistical Service code for each district

- district:

  District name

- geometry:

  SF polygon geometry

This dataset is also available as a stand-alone file in geoJSON format
at
<https://mpjashby.github.io/crimemappingdata/lancashire_districts.geojson>.

Licence: Open Government Licence

## Source

Office for National Statistics

## See also

[`lancashire_asb`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_asb.md):
Anti-social behaviour in Lancashire.
[`lancashire_ward_pop`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_ward_pop.md):
Lancashire ward population.
[`lancashire_wards`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_wards.md):
Local government wards of Lancashire.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    lancashire_districts,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
