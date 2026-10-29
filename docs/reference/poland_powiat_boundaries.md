# Polish powiat boundaries

Boundaries of the 380 powiats (counties) in Poland, including cities
with powiat status, from the 2025 archive of the National Register of
Boundaries (Panstwowy Rejestr Granic, PRG).

## Usage

``` r
poland_powiat_boundaries
```

## Format

Simple features (SF) object containing 380 rows and 4 columns:

- jpt_kod_je:

  Source TERYT territorial unit code.

- jpt_nazwa:

  Powiat name in Polish.

- regon:

  Source REGON identifier, stored as text.

- geometry:

  Simple features multipolygon representing the powiat boundary.

Coordinates use ETRS89 (EPSG:4258), in decimal degrees.

This dataset is also available as a stand-alone file in GeoPackage
format at
<https://mpjashby.github.io/crimemappingdata/poland_powiat_boundaries.gpkg>.

Licence: the provider permits PRG data to be used free of charge for any
purpose. See the source page for the reuse statement. Credit GUGiK/PRG
when redistributing this processed extract.

## Source

Head Office of Geodesy and Cartography (GUGiK), National Register of
Boundaries (PRG), 2025 archive.
<https://www.geoportal.gov.pl/pl/dane/panstwowy-rejestr-granic-prg/>.

## See also

[`poland_population`](https://pkgs.lesscrime.info/crimemappingdata/reference/poland_population.md):
Population of Polish powiats, 2022–2024.
[`poland_property_crime_counts`](https://pkgs.lesscrime.info/crimemappingdata/reference/poland_property_crime_counts.md):
Property offences in Polish powiats, 2022–2024.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    poland_powiat_boundaries,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
