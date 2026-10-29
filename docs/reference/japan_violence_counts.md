# Counts of violent crime in Japan, 2012

Dataset of counts of homicides, rapes, robberies and total violent
crimes in each prefecture in Japan in 2012, together with GDP per capita
and population.

## Usage

``` r
japan_violence_counts
```

## Format

Data frame of 300 rows and 3 columns:

- prefecture:

  Prefecture name

- measure:

  Type of data

- value:

  Numeric value

The values of `measure` are "number of homicides", "number of
robberies", "number of rapes", "number of violent crimes", "GDP per
capita (¥1000)", "population (thousands)".

This dataset is also available as a stand-alone file in `.rds` format at
<https://mpjashby.github.io/crimemappingdata/japan_violence_counts.rds>.

Licence: Creative Commons Attribution

## Source

Statistics Bureau of Japan

## See also

[`japan_prefectures`](https://pkgs.lesscrime.info/crimemappingdata/reference/japan_prefectures.md):
Japanese prefecture boundaries, 2019.
