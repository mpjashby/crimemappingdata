# Anti-social behaviour in Northumbria

Dataset of incidents of anti-social behaviour reported to police in
Northumbria, England, in 2022.

## Usage

``` r
northumbria_asb
```

## Format

A data frame of 39,706 rows and 5 columns:

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
<https://mpjashby.github.io/crimemappingdata/northumbria_asb.tab>.

Licence: Open Government Licence

## Source

Home Office

## See also

[`northumbria_districts`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_districts.md):
Local authority districts of Northumbria.
[`northumbria_ward_pop`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_ward_pop.md):
Northumbria ward population.
[`northumbria_wards`](https://pkgs.lesscrime.info/crimemappingdata/reference/northumbria_wards.md):
Local government wards of Northumbria.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  map_data <- sf::st_as_sf(
    northumbria_asb,
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
