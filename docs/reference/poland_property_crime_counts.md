# Property offences in Polish powiats, 2022–2024

Counts of property offences ascertained by the police in completed
preparatory proceedings in each powiat (county) in Poland from 2022 to
2024.

## Usage

``` r
poland_property_crime_counts
```

## Format

Data frame containing 1,140 rows and 5 columns:

- kod_bdl:

  Twelve-character BDL territorial unit identifier.

- kod_teryt:

  Four-character TERYT powiat code, stored as text to preserve leading
  zeroes.

- nazwa:

  Powiat name in Polish, including cities with powiat status.

- rok:

  Year of observation: 2022, 2023 or 2024.

- przestepstwa_przeciwko_mieniu:

  Number of property offences.

## Source

Statistics Poland, Bank Danych Lokalnych (Local Data Bank).
<https://api.stat.gov.pl/home/bdlapi>.

## Details

Each row represents one powiat in one year.

This dataset is also available as a stand-alone file in Excel format at
<https://mpjashby.github.io/crimemappingdata/poland_property_crime_counts.xlsx>.

Licence: Creative Commons Attribution 4.0 International (CC BY 4.0)
<https://creativecommons.org/licenses/by/4.0/>.

## See also

[`poland_population`](https://pkgs.lesscrime.info/crimemappingdata/reference/poland_population.md):
Population of Polish powiats, 2022–2024.
[`poland_powiat_boundaries`](https://pkgs.lesscrime.info/crimemappingdata/reference/poland_powiat_boundaries.md):
Polish powiat boundaries.
