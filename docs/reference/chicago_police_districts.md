# Chicago Police Department Districts

Boundaries of the geographic districts of the Chicago Police Department,
as of 2018.

## Usage

``` r
chicago_police_districts
```

## Format

A simple-features (SF) object containing 25 rows and three columns:

- Name:

  District number

- Description:

  District name

- geometry:

  SF polygon geometry

This dataset is also available as a stand-alone file in KML format at
<https://mpjashby.github.io/crimemappingdata/chicago_police_districts.kml>

Licence:
<https://www.chicago.gov/city/en/narr/foia/data_disclaimer.html>

This site provides applications using data that has been modified for
use from its original source, <http://www.cityofchicago.org/>, the
official website of the City of Chicago. The City of Chicago makes no
claims as to the content, accuracy, timeliness, or completeness of any
of the data provided at this site. The data provided at this site is
subject to change at any time. It is understood that the data provided
at this site is being used at one’s own risk.

## Source

City of Chicago

## See also

[`chicago_aggravated_assaults`](https://pkgs.lesscrime.info/crimemappingdata/reference/chicago_aggravated_assaults.md):
Aggravated assaults in Chicago, 2010 to 2019.

## Examples

``` r
# Basemap tiles require internet access unless already cached.
if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  sfhotspot::hotspot_map(
    chicago_police_districts,
    basemap_type = "cartolight",
    colour = "red2",
    fill = NA,
    size = 0.3
  )
}
```
