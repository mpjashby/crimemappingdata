# Motorcycle thefts in Czechia

Dataset of 9,464 thefts of two-wheeled motor vehicles in Czechia between
2020 and 2022.

## Usage

``` r
czechia_mcycle_thefts
```

## Format

An SF object containing 9,464 rows and 3 columns:

- id:

  Incident number

- date:

  Date-time of incident

- geometry:

  SF point geometry

This dataset is also available as a stand-alone file in geo-package
format at
<https://mpjashby.github.io/crimemappingdata/czechia_mcycle_thefts.gpkg>.

Licence: Bespoke licence, see <https://kriminalita.policie.cz/>

## Source

Police of the Czech Republic <https://kriminalita.policie.cz/>

## See also

[`czechia_collisions`](https://pkgs.lesscrime.info/crimemappingdata/reference/czechia_collisions.md):
Drink/drug-related traffic collisions in Czechia.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    czechia_mcycle_thefts,
    basemap_type = "cartolight",
    colour = "red2",
    size = 0.6
  )
}
```
