# Damage to property in Montreal, 2016 to 2025

Recorded incidents of damage to property (French: méfait) in the City of
Montreal, Quebec, Canada. The source data are displaced in space and
time to protect privacy.

## Usage

``` r
montreal_mefait
```

## Format

A data frame with 54,040 rows and 5 columns.

- categorie:

  Always "méfait"

- date:

  Date of offence

- quart:

  Whether the crime occurred in the daytime (jour), evening (soir) or at
  night (nuit)

- x:

  Easting in EPSG:2950, metres

- y:

  Northing in EPSG:2950, metres

This dataset is also available as a stand-alone file in gzipped CSV
format at
<https://mpjashby.github.io/crimemappingdata/montreal_mefait.csv.gz>.

Licence: CC BY 4.0 <https://creativecommons.org/licenses/by/4.0/>.

## Source

: Service de police de la Ville de Montreal
<https://donnees.montreal.ca/dataset/actes-criminels>.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    montreal_mefait,
    coords = c("x", "y"),
    crs = "EPSG:2950"
  )

  sfhotspot::hotspot_map(
    map_data,
    basemap_type = "cartolight",
    colour = "red2",
    size = 0.6
  )
}
```
