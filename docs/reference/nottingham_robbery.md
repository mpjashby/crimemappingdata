# Robberies in Nottingham

Dataset of robberies (both personal and commercial) recorded by police
in Nottingham, England, in 2022.

## Usage

``` r
nottingham_robbery
```

## Format

A data frame of 555 rows and 5 columns:

- month:

  Date of the first day of the month of the incident

- longitude:

  Longitude

- latitude:

  Latitude

- location:

  Street name or point-of-interest category

- lsoa_code:

  Government Statistical Service code for the Lower Layer Super Output
  Area in which the incident occurred

This dataset is also available as a stand-alone file in gzipped CSV
format at
<https://mpjashby.github.io/crimemappingdata/nottingham_robbery.csv.gz>.

Licence: Open Government Licence

## Source

Home Office

## See also

[`nottingham_burglary`](https://pkgs.lesscrime.info/crimemappingdata/reference/nottingham_burglary.md):
Burglaries in Nottingham.
[`nottingham_wards`](https://pkgs.lesscrime.info/crimemappingdata/reference/nottingham_wards.md):
Local government wards of Nottingham.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    nottingham_robbery,
    coords = c("longitude", "latitude"),
    crs = "EPSG:4326"
  )

  sfhotspot::hotspot_map(
    map_data,
    basemap_type = "cartolight",
    colour = "red2",
    size = 0.6
  )
}
```
