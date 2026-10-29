# Local government wards of Lancashire

Dataset of ward boundaries in Lancashire, England, in 2022.

## Usage

``` r
lancashire_wards
```

## Format

A simple features (SF) object with 271 rows and 3 columns:

- ward_code:

  Government Statistical Service code for each ward

- ward_name:

  Ward name

- geometry:

  SF polygon geometry

This dataset is also available as a stand-alone file in geopackage
format at
<https://mpjashby.github.io/crimemappingdata/lancashire_wards.gpkg>.

Licence: Open Government Licence

## Source

Office for National Statistics

## See also

[`lancashire_asb`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_asb.md):
Anti-social behaviour in Lancashire.
[`lancashire_districts`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_districts.md):
Local authority districts of Lancashire.
[`lancashire_ward_pop`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_ward_pop.md):
Lancashire ward population.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    lancashire_wards,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
