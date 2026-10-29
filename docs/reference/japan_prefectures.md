# Japanese prefecture boundaries, 2019

Dataset of boundaries of Japanese prefectures.

## Usage

``` r
japan_prefectures
```

## Format

Data frame of 47 rows and 6 columns:

- adm0_en:

  Top-level administrative unit name (English)

- adm0_ja:

  Top-level administrative unit name (Japanese)

- adm0_pcode:

  Top-level administrative unit code (English)

- adm1_en:

  Prefecture name (English)

- adm1_ja:

  Prefecture name (Japanese)

- adm1_pcode:

  Prefecture code (English)

This dataset is also available as a stand-alone file in Geopackage
(`.gpkg`) format at
<https://mpjashby.github.io/crimemappingdata/japan_prefectures.gpkg>.

Licence: Creative Commons Attribution for Intergovernmental
Organisations

## Source

United Nations Office for the Coordination of Humanitarian Affairs

## See also

[`japan_violence_counts`](https://pkgs.lesscrime.info/crimemappingdata/reference/japan_violence_counts.md):
Counts of violent crime in Japan, 2012.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    japan_prefectures,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
