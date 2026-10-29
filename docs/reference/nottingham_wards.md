# Local government wards of Nottingham

Dataset of ward boundaries in Nottingham, England, in 2022.

## Usage

``` r
nottingham_wards
```

## Format

A simple features (SF) object with 20 rows and 3 columns:

- ward_code:

  Government Statistical Service code for each ward

- ward_name:

  Ward name

- geometry:

  SF polygon geometry

This dataset is also available as a stand-alone file in geopackage
format at
<https://mpjashby.github.io/crimemappingdata/nottingham_wards.gpkg>.

Licence: Open Government Licence

## Source

Office for National Statistics

## See also

[`nottingham_burglary`](https://pkgs.lesscrime.info/crimemappingdata/reference/nottingham_burglary.md):
Burglaries in Nottingham.
[`nottingham_robbery`](https://pkgs.lesscrime.info/crimemappingdata/reference/nottingham_robbery.md):
Robberies in Nottingham.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    nottingham_wards,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
