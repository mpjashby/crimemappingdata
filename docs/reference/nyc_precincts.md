# New York City Police precinct boundaries

Dataset of the boundaries of each precinct of the New York City Police
Department (NYPD), 2022.

## Usage

``` r
nyc_precincts
```

## Format

Simple features (SF) object containing 77 rows and 3 columns:

- OBJECTID:

  Row identifier

- Precinct:

  Precinct number

- geometry:

  SF polygons of the outline of each precinct

This dataset is also available as a stand-alone file in geopackage
format at
<https://mpjashby.github.io/crimemappingdata/nyc_precincts.gpkg>.

Licence: Creative Commons Attribution
<https://creativecommons.org/licenses/by/3.0/au/>

## Source

City of New York
<https://data.cityofnewyork.us/Public-Safety/Police-Precincts/78dh-3ptz>

## See also

[`bronx_shootings`](https://pkgs.lesscrime.info/crimemappingdata/reference/bronx_shootings.md):
Shootings in the Bronx in 2019.
[`nyc_homicides`](https://pkgs.lesscrime.info/crimemappingdata/reference/nyc_homicides.md):
Homicides in New York City, 2016 to 2018.
[`nyc_shootings`](https://pkgs.lesscrime.info/crimemappingdata/reference/nyc_shootings.md):
Shootings in New York City in 2019.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    nyc_precincts,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
