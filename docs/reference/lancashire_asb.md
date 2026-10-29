# Anti-social behaviour in Lancashire

Dataset of incidents of anti-social behaviour reported to police in
Lancashire, England, in 2022.

## Usage

``` r
lancashire_asb
```

## Format

A data frame of 56,434 rows and 5 columns:

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

This dataset is also available as a stand-alone file in tab-separated
values format at
<https://mpjashby.github.io/crimemappingdata/lancashire_asb.tab>.

Licence: Open Government Licence

## Source

Home Office

## See also

[`lancashire_districts`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_districts.md):
Local authority districts of Lancashire.
[`lancashire_ward_pop`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_ward_pop.md):
Lancashire ward population.
[`lancashire_wards`](https://pkgs.lesscrime.info/crimemappingdata/reference/lancashire_wards.md):
Local government wards of Lancashire.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    lancashire_asb,
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
