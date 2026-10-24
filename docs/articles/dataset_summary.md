# Summary of available datasets

The `crimemappindata` package contains 56 datasets that are designed to
be used in teaching crime mapping and crime analysis more generally.
There are several different types of data available:

- Point-level crime data.
- Area-level crime counts.
- Supporting data, such as population data and spatial boundaries.

The `crimemappingdata` package is licensed under the MIT Licence, but
the individual datasets have been licensed by the data provider using a
variety of different open-data licences. Check the manual page for each
dataset for details of the relevant licence. Users are responsible for
using the data in accordance with the applicable licence for a dataset.

## Point-level crime data

### `aggravated_assaults`

Dataset of 8,696 aggravated assaults in Austin, TX, in 2019.

| date                | longitude | latitude | location_type | location_category |
|:--------------------|----------:|---------:|:--------------|:------------------|
| 2019-01-01 00:00:00 | -97.71635 | 30.28631 | residence     | residence         |
| 2019-01-01 00:00:00 | -97.76135 | 30.24640 | residence     | residence         |
| 2019-01-01 00:01:00 | -97.73918 | 30.26679 | NA            | NA                |
| 2019-01-01 00:15:00 | -97.74007 | 30.26761 | NA            | NA                |
| 2019-01-01 00:27:00 | -97.83802 | 30.18048 | residence     | residence         |
| 2019-01-01 00:30:00 | -97.73909 | 30.26735 | NA            | NA                |
| 2019-01-01 00:51:00 | -97.69433 | 30.32696 | NA            | NA                |
| 2019-01-01 01:00:00 | -97.66867 | 30.43380 | residence     | residence         |
| 2019-01-01 01:00:00 | -97.70329 | 30.31954 | NA            | NA                |
| 2019-01-01 01:12:00 | -97.72503 | 30.32115 | residence     | residence         |

The stand-alone version of this dataset is different from the package
version. The stand-alone version is an Excel file containing three
sheets. Each sheet has aggravated-assault data for 2019 for a different
city: Austin, TX; Fort Worth, TX; and Seattle, WA. Students can get the
same data as is in the package version of the dataset by loading the
`Austin` sheet from the Excel file using the [readxl
package](https://readxl.tidyverse.org/).

### `bronx_shootings`

Dataset of 967 shootings in NYC in 2019 and separately of the 267 of
those shootings that occurred in the Bronx.

| incident_key | boro          | occur_date | murder | longitude | latitude |
|-------------:|:--------------|:-----------|:-------|----------:|---------:|
|    191709964 | BROOKLYN      | 2019-01-01 | TRUE   | -73.86616 | 40.66568 |
|    191739125 | BROOKLYN      | 2019-01-01 | FALSE  | -73.97513 | 40.69514 |
|    191739126 | BRONX         | 2019-01-01 | FALSE  | -73.89581 | 40.85633 |
|    191790873 | BROOKLYN      | 2019-01-02 | FALSE  | -73.94445 | 40.69817 |
|    191851037 | BRONX         | 2019-01-03 | FALSE  | -73.85457 | 40.87122 |
|    191851038 | STATEN ISLAND | 2019-01-03 | FALSE  | -74.16281 | 40.62472 |
|    191853461 | BROOKLYN      | 2019-01-04 | FALSE  | -73.99288 | 40.57376 |
|    191949899 | BROOKLYN      | 2019-01-04 | FALSE  | -73.94099 | 40.59836 |
|    191949900 | BRONX         | 2019-01-06 | FALSE  | -73.89287 | 40.82174 |
|    191949902 | BRONX         | 2019-01-05 | FALSE  | -73.85087 | 40.83122 |

The stand-alone version of these datasets are CSV files.

### `buenos_aires_robbery`

Dataset of 64,813 robberies in Buenos Aires, Argentina, in 2023.

| id_mapa | fecha               | subtipo    | barrio           |  longitud |   latitud |
|--------:|:--------------------|:-----------|:-----------------|----------:|----------:|
| 1301234 | 2023-01-01 00:00:00 | Robo total | COLEGIALES       | -58.44643 | -34.58065 |
| 1303129 | 2023-01-01 00:00:00 | Robo total | BARRACAS         | -58.39952 | -34.65638 |
| 1388370 | 2023-01-01 00:00:00 | Robo total | CONSTITUCION     | -58.38285 | -34.62696 |
| 1390799 | 2023-01-01 00:00:00 | Robo total | FLORESTA         | -58.47671 | -34.63405 |
| 1396636 | 2023-01-01 00:00:00 | Robo total | PARQUE CHACABUCO | -58.44852 | -34.63801 |
| 1275336 | 2023-01-01 01:00:00 | Robo total | PALERMO          | -58.40638 | -34.57552 |
| 1286898 | 2023-01-01 01:00:00 | Robo total | PARQUE CHACABUCO | -58.43653 | -34.63128 |
| 1286909 | 2023-01-01 01:00:00 | Robo total | PARQUE CHACABUCO | -58.43943 | -34.62900 |
| 1298147 | 2023-01-01 01:00:00 | Robo total | SAN NICOLAS      | -58.38923 | -34.60438 |
| 1314883 | 2023-01-01 01:00:00 | Robo total | LINIERS          | -58.50767 | -34.64835 |

The stand-alone version of this dataset is a CSV file.

### `cdmx_car_jacking`

Dataset of 2,811 car jacking offences in Mexico City in 2019.

| fecha_hechos        |  longitud |  latitud | geom                       |
|:--------------------|----------:|---------:|:---------------------------|
| 2019-05-17 17:00:00 | -99.10880 | 19.39638 | POINT (-99.1088 19.39638)  |
| 2019-05-17 23:50:00 | -99.22413 | 19.29605 | POINT (-99.22413 19.29605) |
| 2019-05-09 22:00:00 | -99.19087 | 19.40981 | POINT (-99.19087 19.40981) |
| 2019-05-17 17:00:00 | -99.14227 | 19.45565 | POINT (-99.14227 19.45565) |
| 2019-05-17 21:30:00 | -99.04177 | 19.38836 | POINT (-99.04177 19.38836) |
| 2019-05-18 09:00:00 | -99.10008 | 19.32609 | POINT (-99.10008 19.32609) |
| 2019-05-20 08:30:00 | -99.10022 | 19.44002 | POINT (-99.10022 19.44002) |
| 2019-05-20 21:45:00 | -99.18412 | 19.49114 | POINT (-99.18412 19.49114) |
| 2019-05-20 23:00:00 | -99.16180 | 19.43733 | POINT (-99.1618 19.43733)  |
| 2019-05-21 14:30:00 | -99.18892 | 19.38602 | POINT (-99.18892 19.38602) |

The stand-alone version of this dataset is a geopackage file.

### `chicago_aggravated_assaults`

Dataset of 148,636 aggravated assaults in Chicago between 2010 and 2019.

| date                | loc_cat   | longitude | latitude | district |
|:--------------------|:----------|----------:|---------:|---------:|
| 2010-01-01 00:05:00 | residence |  -87.6277 |  41.7922 |        2 |
| 2010-01-01 00:12:00 | street    |  -87.6683 |  41.7513 |        6 |
| 2010-01-01 00:30:00 | hotel     |  -87.6242 |  41.8727 |        1 |
| 2010-01-01 00:30:00 | street    |  -87.6478 |  41.7536 |        6 |
| 2010-01-01 00:54:00 | street    |  -87.6446 |  41.7720 |        7 |
| 2010-01-01 01:15:00 | street    |  -87.7311 |  41.8984 |       11 |
| 2010-01-01 01:45:00 | street    |  -87.6450 |  41.9228 |       18 |
| 2010-01-01 01:45:00 | street    |  -87.6106 |  41.7726 |        3 |
| 2010-01-01 01:48:00 | hotel     |  -87.6242 |  41.8727 |        1 |
| 2010-01-01 01:56:00 | residence |  -87.6265 |  41.6916 |        5 |

The stand-alone version of this dataset is a gzipped CSV file.

### `cincinnati_burglary`

Dataset of 8,723 burglaries in Cincinnati, Ohio, between 2016 and 2018.

| incident_no | offense_date        | offense  | longitude | latitude |
|:------------|:--------------------|:---------|----------:|---------:|
| 219027252   | 2017-05-25 00:00:00 | BURGLARY | -84.48973 | 39.14319 |
| 219027252   | 2017-05-25 00:00:00 | BURGLARY | -84.48881 | 39.14260 |
| 209003013   | 2018-10-19 12:00:00 | BURGLARY | -84.52658 | 39.12951 |
| 199004112   | 2018-02-27 16:10:00 | BURGLARY | -84.57675 | 39.19290 |
| 189027753   | 2018-10-10 11:00:00 | BURGLARY | -84.55841 | 39.12668 |
| 189027722   | 2018-10-12 08:00:00 | BURGLARY | -84.49692 | 39.10908 |
| 189027719   | 2018-10-15 12:45:31 | BURGLARY | -84.56619 | 39.10291 |
| 189026756   | 2018-10-04 02:45:00 | BURGLARY | -84.52020 | 39.14478 |
| 189026786   | 2018-10-04 03:00:00 | BURGLARY | -84.48522 | 39.12775 |
| 189026740   | 2018-10-03 19:10:00 | BURGLARY | -84.59645 | 39.15254 |

The stand-alone version of this dataset is a gzipped CSV file.

### `czechia_collisions` and `czechia_mcycle_thefts`

Datasets of 5,020 traffic collisions related to alcohol or drugs and
separately of 9,464 thefts of two-wheeled motor vehicles in Czechia
between 2020 and 2022.

|       id | date                | geom                      |
|---------:|:--------------------|:--------------------------|
| 13115324 | 2020-01-01 00:20:00 | POINT (13.61072 50.13135) |
| 13115389 | 2020-01-01 00:50:00 | POINT (17.3977 50.12565)  |
| 13115431 | 2020-01-01 00:59:00 | POINT (14.51836 48.91475) |
| 13115509 | 2020-01-01 02:00:00 | POINT (12.72899 49.85815) |
| 13115524 | 2020-01-01 02:01:00 | POINT (17.08994 49.47261) |
| 13115595 | 2020-01-01 03:09:00 | POINT (13.89387 50.15709) |
| 13115660 | 2020-01-01 02:45:00 | POINT (14.479 50.99283)   |
| 13115688 | 2020-01-01 03:00:00 | POINT (17.04471 49.7781)  |
| 13115696 | 2020-01-01 01:53:00 | POINT (17.11241 49.58678) |
| 13115701 | 2020-01-01 04:30:00 | POINT (13.79386 50.66278) |

`czechia_collisions` {.table}

|       id | date                | geom                      |
|---------:|:--------------------|:--------------------------|
| 13115077 | 2020-01-01 02:00:00 | POINT (16.63238 49.18592) |
| 13115659 | 2020-01-01 04:21:00 | POINT (15.43107 50.68324) |
| 13115857 | 2020-01-01 10:45:00 | POINT (14.54159 50.0986)  |
| 13117263 | 2020-01-01 22:58:00 | POINT (13.38625 49.72525) |
| 13117417 | 2020-01-02 04:28:00 | POINT (14.50531 50.12157) |
| 13117582 | 2020-01-02 08:24:00 | POINT (16.53362 49.26413) |
| 13117630 | 2020-01-02 08:29:00 | POINT (17.64119 49.22275) |
| 13118598 | 2020-01-02 04:30:00 | POINT (14.51453 50.13658) |
| 13119320 | 2020-01-03 09:24:00 | POINT (14.29876 50.06083) |
| 13119872 | 2020-01-02 14:35:00 | POINT (14.5243 50.09214)  |

`czechia_mcycle_thefts` {.table}

The stand-alone version of these datasets are geopackage files.

### `downtown_homicides` and `glenrose_heights_homicides`

Two datasets of homicides in the Downtown and Glenrose Heights
neighbourhoods of Atlanta, GA, in 2019. There are four rows in each
dataset. The `label` column contains a pre-formatted label suitable for
using in plotting the points on a map.

[TABLE]

`downtown_homicides` {.table}

[TABLE]

`glenrose_heights_homicides` {.table}

The stand-alone versions of these datasets are available as both CSV and
geopackage files.

### `hungerford_shootings`

Dataset of the locations of 16 shootings during the [Hungerford
massacre](https://en.wikipedia.org/wiki/Hungerford_massacre) in 1987.
This can be used for teaching mapping of crime series.

| victims        | order | easting | northing |
|:---------------|------:|--------:|---------:|
| Susan GODFREY† |     1 |  423168 |   167694 |
| Kakaub DEAN    |     2 |  429455 |   167904 |
| Roland MASON†  |       |         |          |

Sheila MASON† Marjorie JACKSON Lisa MILDENHALL \| 3\| 433849\| 168176\|
\|Kenneth CLEMENTS† \| 4\| 434044\| 168133\| \|Roger BRERETON† Linda
CHAPMAN Alison CHAPMAN \| 5\| 433897\| 168165\| \|Abdur KHAN† Alan
LEPETIT Hazel HASLETT George WHITE† Dorothy RYAN† Ivor JACKSON \| 6\|
433821\| 168176\| \|Betty TOLLADAY \| 7\| 433954\| 168032\| \|Francis
BUTLER† \| 8\| 433956\| 167787\| \|Marcus BARNARD† \| 9\| 433872\|
167765\| \|Ann HONEYBONE \| 10\| 433830\| 167775\|

The stand-alone version of this dataset is a CSV file.

### `lancashire_asb` and `northumbria_asb`

Datasets of 56,434 anti-social behaviour incidents in Lancashire and
39,706 incidents in Northumbria, England, in 2022.

| month      | longitude | latitude | location         | lsoa_code |
|:-----------|----------:|---------:|:-----------------|:----------|
| 2022-01-01 |   -2.4646 |  53.7655 | Hazelwood Close  | E01012607 |
| 2022-01-01 |   -2.4747 |  53.7702 | Peridot Close    | E01012608 |
| 2022-01-01 |   -2.4747 |  53.7702 | Peridot Close    | E01012608 |
| 2022-01-01 |   -2.4762 |  53.7684 | Jasper Street    | E01012608 |
| 2022-01-01 |   -2.4668 |  53.7641 | Lilac Road       | E01012608 |
| 2022-01-01 |   -2.4668 |  53.7641 | Lilac Road       | E01012608 |
| 2022-01-01 |   -2.4747 |  53.7702 | Peridot Close    | E01012608 |
| 2022-01-01 |   -2.4785 |  53.7706 | Ruby Street      | E01012633 |
| 2022-01-01 |   -2.4796 |  53.7677 | Pemberton Street | E01012634 |
| 2022-01-01 |   -2.4793 |  53.7652 | Cranshaw Drive   | E01012634 |

`lancashire_asb` {.table}

| month      | longitude | latitude | location            | lsoa_code |
|:-----------|----------:|---------:|:--------------------|:----------|
| 2022-01-01 |   -2.0020 |  55.7663 | Palace Green        | E01027377 |
| 2022-01-01 |   -2.0016 |  55.7712 | Parade              | E01027377 |
| 2022-01-01 |   -2.0002 |  55.7675 | Ness Street         | E01027377 |
| 2022-01-01 |   -2.0030 |  55.7668 | Palace Street       | E01027377 |
| 2022-01-01 |   -2.0103 |  55.7586 | Shopping Area       | E01027385 |
| 2022-01-01 |   -2.0134 |  55.7566 | Grove Gardens South | E01027385 |
| 2022-01-01 |   -2.0085 |  55.7581 | Northumberland Road | E01027385 |
| 2022-01-01 |   -2.0103 |  55.7586 | Shopping Area       | E01027385 |
| 2022-01-01 |   -2.0012 |  55.7566 | Adams Drive         | E01027388 |
| 2022-01-01 |   -2.0055 |  55.7582 | Billendean Terrace  | E01027388 |

`northumbria_asb` {.table}

The stand-alone version of these datasets are tab-separated values
(`.tab`) files. The data in these file can be used together with the
`lancashire_districts`/`northumbria_districts`,
`lancashire_wards`/`northumbria_wards` and
`lancashire_ward_pop`/`northumbria_ward_pop` datasets to calculate
area-level incidence rates.

### `london_attacks`

Dataset of 8 fatal terrorist attacks in London from 2010 to 2018.

| date | latitude | longitude | description |
|:---|---:|---:|:---|
| 2005-07-07 | 51.5186 | -0.0813 | Suicide bomb exploded on train, killing 7 |
| 2005-07-07 | 51.5200 | -0.1678 | Suicide bomb exploded on train, killing 6 |
| 2005-07-07 | 51.5302 | -0.1241 | Suicide bomb exploded on train, killing 26 |
| 2005-07-07 | 51.5250 | -0.1291 | Suicide bomb exploded on bus, killing 13 |
| 2013-05-22 | 51.4883 | 0.0623 | Soldier fatally stabbed |
| 2017-03-22 | 51.5008 | -0.1219 | Car driven at pedestrians and people stabbed, killing 5 |

The stand-alone version of this dataset is a CSV file.

### `london_crimes`

Dataset of 849,409 crimes recorded in London in 2022.

| month | type                     | location_type | longitude | latitude |
|------:|:-------------------------|:--------------|----------:|---------:|
|     1 | criminal damage or arson | NA            |   -0.1349 |  51.5067 |
|     1 | violent or sexual        | NA            |   -0.3751 |  51.4365 |
|     1 | public order             | Rail Station  |    0.0812 |  51.5398 |
|     1 | violent or sexual        | NA            |    0.0804 |  51.4840 |
|     1 | violent or sexual        | NA            |   -0.3513 |  51.5078 |
|     1 | other theft              | Hospital      |   -0.0170 |  51.4536 |
|     1 | criminal damage or arson | NA            |   -0.1497 |  51.4908 |
|     1 | violent or sexual        | NA            |   -0.2481 |  51.4637 |
|     1 | violent or sexual        | Rail Station  |   -0.1372 |  51.3200 |
|     1 | robbery                  | NA            |   -0.1254 |  51.5197 |

The stand-alone version of this dataset is a gzipped CSV file.

### `medellin_homicides`

Dataset of 9,360 homicides in Medellin, Colombia, from 2010 to 2019.

| fecha_hecho | longitud | latitud | sexo | edad | modalidad |
|:---|---:|---:|:---|---:|:---|
| 2019-04-23 12:30:00 | -75.56985 | 6.257226 | Mujer | 50 | Ahorcamiento o estrangulamiento |
| 2019-05-12 00:51:00 | -75.61037 | 6.222806 | Hombre | 24 | Arma de fuego |
| 2019-05-12 02:36:00 | -75.62039 | 6.262382 | Hombre | 34 | Arma de fuego |
| 2019-05-12 03:03:00 | -75.56177 | 6.269589 | Hombre | 20 | Arma de fuego |
| 2019-05-12 22:40:00 | -75.53269 | 6.236277 | Hombre | 34 | Arma de fuego |
| 2019-05-12 19:30:00 | -75.64196 | 6.196195 | Hombre | 25 | Arma de fuego |
| 2019-05-12 04:00:00 | -75.55532 | 6.290154 | Hombre | 37 | Cortopunzante |
| 2019-05-13 05:34:00 | -75.55720 | 6.271623 | Hombre | 22 | Arma de fuego |
| 2019-05-12 04:50:00 | -75.56665 | 6.240023 | Mujer | 21 | Ahorcamiento o estrangulamiento |
| 2019-05-14 01:00:00 | -75.56220 | 6.249262 | Hombre | 29 | Arma de fuego |

The stand-alone version of this dataset is a CSV file. Note that the CSV
file uses semi colons as column delimiters and commas as decimal
separators in numbers, in accordance with Colombian practice. This file
can be read with functions such as \[readr::read_csv2()\].

This dataset can be used together with the `medellin_metro_lines` and
`medellin_metro_stns` datasets to teach topics such as finding or
counting crimes within a certain distance of a facility (e.g. a metro
station).

### `montreal_mefait`

Dataset of 54,040 mefait incidents in Montreal, Canada, from 2016 to
2025.

| categorie | date       | quart |        x |       y |
|:----------|:-----------|:------|---------:|--------:|
| Méfait    | 2017-07-30 | jour  | 297654.7 | 5041877 |
| Méfait    | 2018-11-12 | soir  | 294670.7 | 5047695 |
| Méfait    | 2018-08-15 | jour  | 294670.7 | 5047695 |
| Méfait    | 2017-08-23 | jour  | 298266.1 | 5038914 |
| Méfait    | 2018-10-16 | jour  | 292011.0 | 5032898 |
| Méfait    | 2017-09-13 | jour  | 291073.5 | 5041534 |
| Méfait    | 2016-07-30 | soir  | 295536.1 | 5043175 |
| Méfait    | 2016-09-04 | jour  | 297184.2 | 5042137 |
| Méfait    | 2018-10-24 | jour  | 294163.3 | 5045419 |
| Méfait    | 2017-08-26 | jour  | 282404.8 | 5037605 |

The stand-alone version of this dataset is a gzipped CSV file.

### `nottingham_burglary` and `nottingham_robbery`

Datasets of 1,795 burglaries and 555 robberies in Nottingham, England,
in 2022.

| month      | longitude | latitude | location         | lsoa_code |
|:-----------|----------:|---------:|:-----------------|:----------|
| 2022-01-01 |   -1.1704 |  53.0050 | Hathersage Close | E01013893 |
| 2022-01-01 |   -1.1916 |  53.0140 | Fradley Close    | E01013879 |
| 2022-01-01 |   -1.2076 |  53.0047 | Milford Close    | E01013880 |
| 2022-01-01 |   -1.2050 |  53.0046 | Aldgate Close    | E01013880 |
| 2022-01-01 |   -1.2076 |  53.0047 | Milford Close    | E01013880 |
| 2022-01-01 |   -1.1987 |  53.0057 | Ravensworth Road | E01013882 |
| 2022-01-01 |   -1.1955 |  53.0023 | Montague Street  | E01013885 |
| 2022-01-01 |   -1.1789 |  52.9959 | Kersall Drive    | E01013889 |
| 2022-01-01 |   -1.1810 |  52.9963 | St Albans Road   | E01013889 |
| 2022-01-01 |   -1.1946 |  52.9976 | Latimer Close    | E01013891 |

`nottingham_burglary` {.table}

| month      | longitude | latitude | location               | lsoa_code |
|:-----------|----------:|---------:|:-----------------------|:----------|
| 2022-01-01 |   -1.0943 |  52.9550 | Daleside Road East     | E01028184 |
| 2022-01-01 |   -1.1968 |  52.9999 | Main Street            | E01013885 |
| 2022-01-01 |   -1.1789 |  52.9959 | Kersall Drive          | E01013889 |
| 2022-01-01 |   -1.1789 |  52.9959 | Kersall Drive          | E01013889 |
| 2022-01-01 |   -1.1547 |  52.9951 | Babbacombe Drive       | E01013853 |
| 2022-01-01 |   -1.1870 |  52.9888 | Ryder Street           | E01013829 |
| 2022-01-01 |   -1.1942 |  52.9831 | Sports/Recreation Area | E01013830 |
| 2022-01-01 |   -1.1954 |  52.9821 | Nuthall Road           | E01013819 |
| 2022-01-01 |   -1.2018 |  52.9788 | Winsford Close         | E01013820 |
| 2022-01-01 |   -1.1520 |  52.9682 | Thorncliffe Road       | E01013941 |

`nottingham_robbery` {.table}

The stand-alone versions of these datasets are gzipped CSV files. The
data in these files can be used together with the `nottingham_wards`
dataset teach spatial clipping, counting incidents in areas and related
topics.

### `nyc_shootings`

Dataset of 967 shootings in New York City recorded by the New York City
Police Department (NYPD) in 2019.

| incident_key | boro          | occur_date | murder | longitude | latitude |
|-------------:|:--------------|:-----------|:-------|----------:|---------:|
|    191709964 | BROOKLYN      | 2019-01-01 | TRUE   | -73.86616 | 40.66568 |
|    191739125 | BROOKLYN      | 2019-01-01 | FALSE  | -73.97513 | 40.69514 |
|    191739126 | BRONX         | 2019-01-01 | FALSE  | -73.89581 | 40.85633 |
|    191790873 | BROOKLYN      | 2019-01-02 | FALSE  | -73.94445 | 40.69817 |
|    191851037 | BRONX         | 2019-01-03 | FALSE  | -73.85457 | 40.87122 |
|    191851038 | STATEN ISLAND | 2019-01-03 | FALSE  | -74.16281 | 40.62472 |
|    191853461 | BROOKLYN      | 2019-01-04 | FALSE  | -73.99288 | 40.57376 |
|    191949899 | BROOKLYN      | 2019-01-04 | FALSE  | -73.94099 | 40.59836 |
|    191949900 | BRONX         | 2019-01-06 | FALSE  | -73.89287 | 40.82174 |
|    191949902 | BRONX         | 2019-01-05 | FALSE  | -73.85087 | 40.83122 |

The stand-alone version of this dataset is a CSV file.

This dataset can be used together with the `nyc_precincts` dataset to
teach topics such as counting the number of crimes in particular areas.

### `retiro_homicides`

Dataset of 13 homicides in the Retiro neighbourhood of Buenos Aires,
Argentina, in 2023.

| id_mapa | fecha               |  longitud |   latitud |
|--------:|:--------------------|----------:|----------:|
| 1399525 | 2023-02-04 20:00:00 | -58.37712 | -34.58509 |
| 1399523 | 2023-02-14 11:00:00 | -58.37385 | -34.59356 |
| 1399546 | 2023-03-05 19:00:00 | -58.36952 | -34.59832 |
| 1399553 | 2023-05-23 15:00:00 | -58.38049 | -34.58351 |
| 1399603 | 2023-06-06 22:00:00 | -58.38215 | -34.58314 |
| 1399561 | 2023-06-18 22:00:00 | -58.37964 | -34.58348 |
| 1399564 | 2023-06-21 02:00:00 | -58.38974 | -34.57974 |
| 1399560 | 2023-07-19 20:00:00 | -58.38215 | -34.58314 |
| 1399598 | 2023-09-09 22:00:00 | -58.38416 | -34.58209 |
| 1399588 | 2023-10-02 02:00:00 | -58.37977 | -34.58396 |

The stand-alone version of this dataset is a CSV file.

### `san_francisco_robbery`

Dataset of 951 personal robberies in San Francisco in 2019.

|      uid | offense_type     | date_time           | longitude | latitude |
|---------:|:-----------------|:--------------------|----------:|---------:|
| 24103841 | personal robbery | 2019-01-01 19:50:00 | -122.4021 | 37.78872 |
| 24103948 | personal robbery | 2019-01-02 08:00:00 | -122.4085 | 37.78445 |
| 24104162 | personal robbery | 2019-01-03 00:30:00 | -122.3900 | 37.75527 |
| 24104203 | personal robbery | 2019-01-03 03:13:00 | -122.4210 | 37.78382 |
| 24104237 | personal robbery | 2019-01-03 09:30:00 | -122.4723 | 37.72162 |
| 24104238 | personal robbery | 2019-01-03 09:30:00 | -122.4723 | 37.72162 |
| 24104239 | personal robbery | 2019-01-03 09:30:00 | -122.4723 | 37.72162 |
| 24104752 | personal robbery | 2019-01-05 02:23:00 | -122.4138 | 37.77452 |
| 24105017 | personal robbery | 2019-01-06 01:00:00 | -122.3979 | 37.78704 |
| 24105062 | personal robbery | 2019-01-06 10:22:00 | -122.4073 | 37.78456 |

The stand-alone version of this dataset is a CSV file.

### `sao_paulo_homicides`

Dataset of 6,214 homicides recorded by police in the immediate region of
Sao Paulo, Brazil, between 2017 and 2022.

| year | date | municipality | location_type | victim_sex | longitude | latitude |
|---:|:---|:---|:---|:---|---:|---:|
| 2017 | 2017-01-01 | São Paulo | Via pública | Masculino | -46.75288 | -23.42660 |
| 2017 | 2017-01-01 | São Paulo | Via pública | Masculino | -46.69175 | -23.46374 |
| 2017 | 2017-01-01 | São Paulo | Via pública | Masculino | -46.72815 | -23.44609 |
| 2017 | 2017-01-01 | Diadema | Via pública | Masculino | -46.59971 | -23.70628 |
| 2017 | 2017-01-01 | Guarulhos | Restaurante e afins | Masculino | -46.49450 | -23.42217 |
| 2017 | 2017-01-01 | Mauá | Via pública | Masculino | -46.44718 | -23.65284 |
| 2017 | 2017-01-01 | São Bernardo do Campo | Rodovia/Estrada | Masculino | -46.57781 | -23.83839 |
| 2017 | 2017-01-02 | São Paulo | Via pública | Masculino | -46.79244 | -23.68158 |
| 2017 | 2017-01-02 | São Paulo | Area não ocupada | Indefinido | -46.69767 | -23.76990 |
| 2017 | 2017-01-02 | Santa Isabel | Area não ocupada | Masculino | -46.22515 | -23.32094 |

The stand-alone version of this dataset is an Excel (`.xlsx`) file.

### `tempe_opioid_calls`

Dataset of 3,379 calls to emergency services related to opioid overdoses
in Tempe, Arizona, from 2017 to 2024.

| year | incident_date | narcan_given | latitude | longitude |
|-----:|:--------------|:-------------|---------:|----------:|
| 2017 | 2017-01-03    | NA           |  33.4196 | -111.8904 |
| 2017 | 2017-01-09    | NA           |  33.3971 | -111.9249 |
| 2017 | 2017-01-09    | NA           |  33.4297 | -111.9334 |
| 2017 | 2017-01-09    | NA           |  33.3681 | -111.9014 |
| 2017 | 2017-01-12    | NA           |  33.4647 | -111.9212 |
| 2017 | 2017-01-12    | NA           |  33.4180 | -111.8837 |
| 2017 | 2017-01-14    | NA           |  33.4210 | -111.9038 |
| 2017 | 2017-01-15    | NA           |  33.3591 | -111.9050 |
| 2017 | 2017-01-18    | NA           |  33.3528 | -111.9420 |
| 2017 | 2017-01-18    | NA           |  33.3656 | -111.8734 |

The stand-alone version of this dataset is a CSV file.

### `vancouver_thefts`

Dataset of 21,918 thefts in the City of Vancouver in 2020.

| TYPE | YEAR | MONTH | DAY | HOUR | MINUTE | HUNDRED_BLOCK | NEIGHBOURHOOD | X | Y |
|:---|---:|---:|---:|---:|---:|:---|:---|---:|---:|
| Other Theft | 2020 | 1 | 1 | 0 | 0 | 11XX BURNABY ST | West End | 490320.3 | 5458607 |
| Other Theft | 2020 | 1 | 1 | 0 | 0 | 13XX W 71ST AVE | Marpole | 489998.2 | 5450474 |
| Other Theft | 2020 | 1 | 1 | 0 | 1 | 18XX E GEORGIA ST | Grandview-Woodland | 495141.1 | 5458406 |
| Other Theft | 2020 | 1 | 1 | 0 | 0 | 2X ALEXANDER ST | Central Business District | 492471.3 | 5458985 |
| Theft from Vehicle | 2020 | 1 | 1 | 0 | 0 | 11XX SKEENA ST | Hastings-Sunrise | 497938.7 | 5457949 |
| Theft from Vehicle | 2020 | 1 | 1 | 0 | 10 | 14XX LABURNUM ST | Kitsilano | 488991.7 | 5457823 |
| Theft from Vehicle | 2020 | 1 | 1 | 0 | 30 | 14XX W 11TH AVE | Fairview | 490013.1 | 5456560 |
| Theft from Vehicle | 2020 | 1 | 1 | 0 | 0 | 33XX OAK ST | South Cambie | 490744.3 | 5455927 |
| Theft from Vehicle | 2020 | 1 | 1 | 0 | 30 | 42XX SKEENA ST | Renfrew-Collingwood | 497927.5 | 5454905 |
| Theft from Vehicle | 2020 | 1 | 1 | 0 | 0 | 45XX CLANCY LORANGER WAY | Riley Park | 492098.3 | 5454511 |

The stand-alone version of this dataset is a gzipped CSV file.

## Area-level crime data

### `germany_violence_counts` and `japan_violence_counts`

Datasets of annual counts of different types of violent crime in states
of Germany in 2019 and prefectures of Japan in 2012, together with
population data and GDP per capita data.

| state             | measure                |        count |
|:------------------|:-----------------------|-------------:|
| Baden-Württemberg | GDP per capita (€1000) |       45.108 |
| Baden-Württemberg | number of homicides    |      379.000 |
| Baden-Württemberg | number of rapes        |      820.000 |
| Baden-Württemberg | number of robberies    |     2868.000 |
| Baden-Württemberg | population             | 11103043.000 |
| Bayern            | GDP per capita (€1000) |       46.498 |
| Bayern            | number of homicides    |      529.000 |
| Bayern            | number of rapes        |     1067.000 |
| Bayern            | number of robberies    |     2083.000 |
| Bayern            | population             | 13140183.000 |

`germany_violence_counts` {.table}

| prefecture | measure                  |   value |
|:-----------|:-------------------------|--------:|
| Hokkaido   | number of homicides      |   55.00 |
| Hokkaido   | number of robberies      |  121.00 |
| Hokkaido   | number of rapes          |   48.00 |
| Hokkaido   | number of violent crimes | 2188.00 |
| Hokkaido   | GDP per capita (¥1000)   | 3712.99 |
| Hokkaido   | population (thousands)   | 5246.00 |
| Aomori     | number of homicides      |    8.00 |
| Aomori     | number of robberies      |    6.00 |
| Aomori     | number of rapes          |   12.00 |
| Aomori     | number of violent crimes |  602.00 |

`japan_violence_counts` {.table}

The format of these datasets is designed to be challenging for students,
who will need to reformat the data and wrangle it to create population
counts. This is designed to reflect the formats of data that are often
provided by statistical agencies.

The stand-alone versions of these datasets are `.rds` files.

### `malaysia_violence_counts`

Dataset of annual counts of five types of violent crime in states of
Malaysia from 2006 to 2017.

| region        | state | year | crime_type         | count |
|:--------------|:------|-----:|:-------------------|------:|
| East Malaysia | Sabah | 2006 | aggravated assault |   301 |
| East Malaysia | Sabah | 2006 | armed robbery      |     8 |
| East Malaysia | Sabah | 2006 | murder             |    83 |
| East Malaysia | Sabah | 2006 | rape               |   200 |
| East Malaysia | Sabah | 2006 | unarmed robbery    |   563 |
| East Malaysia | Sabah | 2007 | aggravated assault |   389 |
| East Malaysia | Sabah | 2007 | armed robbery      |     1 |
| East Malaysia | Sabah | 2007 | murder             |    68 |
| East Malaysia | Sabah | 2007 | rape               |   204 |
| East Malaysia | Sabah | 2007 | unarmed robbery    |   641 |

The stand-alone version of this dataset is a `.rds` file.

### `northants_burglary_counts`

Dataset of counts of burglaries in 409 lower-layer super output areas in
Northamptonshire, England, in 2020.

| district | lsoa       | count |
|:---------|:-----------|------:|
| Corby    | Corby 001A |     6 |
| Corby    | Corby 001B |     7 |
| Corby    | Corby 001C |     5 |
| Corby    | Corby 001D |    29 |
| Corby    | Corby 002A |     9 |
| Corby    | Corby 002B |     3 |
| Corby    | Corby 002C |     4 |
| Corby    | Corby 002D |     4 |
| Corby    | Corby 002E |     4 |
| Corby    | Corby 002F |     4 |

The stand-alone version of this dataset is a `.rds` file.

### `poland_property_crime_counts`

Dataset of counts of property offences ascertained by police in the 380
powiats (counties) in Poland from 2022 to 2024.

| kod_bdl | kod_teryt | nazwa | rok | przestepstwa_przeciwko_mieniu |
|:---|:---|:---|---:|---:|
| 030210101000 | 0201 | Powiat bolesławiecki | 2022 | 1761 |
| 030210101000 | 0201 | Powiat bolesławiecki | 2023 | 1566 |
| 030210101000 | 0201 | Powiat bolesławiecki | 2024 | 1959 |
| 030210302000 | 0202 | Powiat dzierżoniowski | 2022 | 852 |
| 030210302000 | 0202 | Powiat dzierżoniowski | 2023 | 864 |
| 030210302000 | 0202 | Powiat dzierżoniowski | 2024 | 744 |
| 030210203000 | 0203 | Powiat głogowski | 2022 | 1383 |
| 030210203000 | 0203 | Powiat głogowski | 2023 | 1525 |
| 030210203000 | 0203 | Powiat głogowski | 2024 | 2138 |
| 030210204000 | 0204 | Powiat górowski | 2022 | 514 |

The stand-alone version of this dataset is an Excel (`.xlsx`) file.

### `qld_stalking`

Dataset of 7,304 annual counts of stalking offences recorded by the
Queensland Police Service in police divisions from 2001 to 2022.

| division     | year | stalking |
|:-------------|-----:|---------:|
| Acacia Ridge | 2001 |        6 |
| Acacia Ridge | 2002 |        7 |
| Acacia Ridge | 2003 |       13 |
| Acacia Ridge | 2004 |        1 |
| Acacia Ridge | 2005 |        6 |
| Acacia Ridge | 2006 |        9 |
| Acacia Ridge | 2007 |       12 |
| Acacia Ridge | 2008 |        0 |
| Acacia Ridge | 2009 |        3 |
| Acacia Ridge | 2010 |        4 |

The stand-alone version of this dataset is an Excel (`.xlsx`) file.

### `uttar_pradesh_murders`

Dataset of counts of murders recorded by police in the 75 administrative
districts of the state of Uttar Pradesh, India, in 2014.

| district       | murder |
|:---------------|-------:|
| Agra           |    178 |
| Aligarh        |    179 |
| Allahabad      |    132 |
| Ambedkar Nagar |     24 |
| Amethi         |     36 |
| Amroha         |     60 |
| Auraiya        |     34 |
| Azamgarh       |     68 |
| Budaun         |    120 |
| Baghpat        |     83 |

The stand-alone version of this dataset is a CSV file.

## Supporting data

### `buenos_aires_subte_lines` and `buenos_aires_subte_stations`

Simple features (SF) objects containing the locations of metro lines and
stations in Buenos Aires, Argentina.

| segment_id | line    | geometry        |
|-----------:|:--------|:----------------|
|          1 | Linea A | \<SF polyline\> |
|          2 | Linea A | \<SF polyline\> |
|          3 | Linea A | \<SF polyline\> |
|          4 | Linea A | \<SF polyline\> |
|          5 | Linea A | \<SF polyline\> |
|          6 | Linea A | \<SF polyline\> |
|          7 | Linea A | \<SF polyline\> |
|          8 | Linea A | \<SF polyline\> |
|          9 | Linea D | \<SF polyline\> |
|         10 | Linea D | \<SF polyline\> |

`buenos_aires_subte_lines` {.table}

| station_id | station                    | line | geometry                    |
|-----------:|:---------------------------|:-----|:----------------------------|
|          1 | Caseros                    | H    | POINT (-58.39893 -34.63575) |
|          2 | Inclan - Mezquita Al Ahmad | H    | POINT (-58.40097 -34.62937) |
|          3 | Humberto 1°                | H    | POINT (-58.40233 -34.62309) |
|          4 | Venezuela                  | H    | POINT (-58.40473 -34.61524) |
|          5 | Once - 30 De Diciembre     | H    | POINT (-58.40604 -34.60893) |
|          6 | 9 De Julio                 | D    | POINT (-58.38058 -34.60424) |
|          7 | Facultad De Medicina       | D    | POINT (-58.39793 -34.59976) |
|          8 | Tribunales - Teatro Colón  | D    | POINT (-58.38515 -34.60159) |
|          9 | Agüero                     | D    | POINT (-58.40716 -34.59163) |
|         10 | R.Scalabrini Ortiz         | D    | POINT (-58.41596 -34.58516) |

`buenos_aires_subte_stations` {.table}

The stand-alone version of the `buenos_aires_subte_lines` dataset is a
geopackage. The `buenos_aires_subte_stations` dataset is a geoJSON file.

These datasets can be used together with the `buenos_aires_robbery`
dataset to teach topics such as finding or counting crimes within a
certain distance of a facility (e.g. a metro station).

### `cdmx_alcaldias`

Simple features (SF) object containing the boundaries of the alcaldías
(boroughs) of Mexico City.

| municip | nomgeo                 | geometry       |
|--------:|:-----------------------|:---------------|
|       9 | Milpa Alta             | \<SF polygon\> |
|      14 | Benito Juárez          | \<SF polygon\> |
|       5 | Gustavo A. Madero      | \<SF polygon\> |
|       3 | Coyoacán               | \<SF polygon\> |
|      16 | Miguel Hidalgo         | \<SF polygon\> |
|       8 | La Magdalena Contreras | \<SF polygon\> |
|      11 | Tláhuac                | \<SF polygon\> |
|       2 | Azcapotzalco           | \<SF polygon\> |
|       6 | Iztacalco              | \<SF polygon\> |
|      10 | Álvaro Obregón         | \<SF polygon\> |

The stand-alone version of this dataset is a geopackage file.

### `chicago_police_districts`

Simple features (SF) object containing the boundaries of Chicago Police
Department districts.

| Name | Description | geometry       |
|:-----|:------------|:---------------|
| 17   | District 17 | \<SF polygon\> |
| 20   | District 20 | \<SF polygon\> |
| 31   | District 31 | \<SF polygon\> |
| 31   | District 31 | \<SF polygon\> |
| 19   | District 19 | \<SF polygon\> |
| 25   | District 25 | \<SF polygon\> |
| 14   | District 14 | \<SF polygon\> |
| 31   | District 31 | \<SF polygon\> |
| 22   | District 22 | \<SF polygon\> |
| 5    | District 5  | \<SF polygon\> |

The stand-alone version of this dataset is a geopackage file.

### `japan_prefectures`

Simple Features (SF) object containing the boundaries of the prefectures
of Japan.

| adm0_en | adm0_ja | adm0_pcode | adm1_en   | adm1_ja | adm1_pcode | geometry       |
|:--------|:--------|:-----------|:----------|:--------|:-----------|:---------------|
| Japan   | 日本    | JP         | Aichi     | 愛知県  | JP23       | \<SF polygon\> |
| Japan   | 日本    | JP         | Akita     | 秋田県  | JP05       | \<SF polygon\> |
| Japan   | 日本    | JP         | Aomori    | 青森県  | JP02       | \<SF polygon\> |
| Japan   | 日本    | JP         | Chiba     | 千葉県  | JP12       | \<SF polygon\> |
| Japan   | 日本    | JP         | Ehime     | 愛媛県  | JP38       | \<SF polygon\> |
| Japan   | 日本    | JP         | Fukui     | 福井県  | JP18       | \<SF polygon\> |
| Japan   | 日本    | JP         | Fukuoka   | 福岡県  | JP40       | \<SF polygon\> |
| Japan   | 日本    | JP         | Fukushima | 福島県  | JP07       | \<SF polygon\> |
| Japan   | 日本    | JP         | Gifu      | 岐阜県  | JP21       | \<SF polygon\> |
| Japan   | 日本    | JP         | Gunma     | 群馬県  | JP10       | \<SF polygon\> |

The stand-alone version of this dataset is a geopackage file.

### `lancashire_districts`, `lancashire_wards`, `northumbria_districts` and `northumbria_wards`

Simple features (SF) objects containing the boundaries of local
government wards and districts in Lancashire and Northumbria, England.
Boundaries are for 2022.

| objectid  | district              | geometry       |
|:----------|:----------------------|:---------------|
| E06000008 | Blackburn with Darwen | \<SF polygon\> |
| E06000009 | Blackpool             | \<SF polygon\> |
| E07000117 | Burnley               | \<SF polygon\> |
| E07000118 | Chorley               | \<SF polygon\> |
| E07000119 | Fylde                 | \<SF polygon\> |
| E07000120 | Hyndburn              | \<SF polygon\> |
| E07000121 | Lancaster             | \<SF polygon\> |
| E07000122 | Pendle                | \<SF polygon\> |
| E07000123 | Preston               | \<SF polygon\> |
| E07000124 | Ribble Valley         | \<SF polygon\> |

`lancashire_districts` {.table}

| ward_code | ward_name    | geometry       |
|:----------|:-------------|:---------------|
| E05001643 | Anchorsholme | \<SF polygon\> |
| E05001644 | Bispham      | \<SF polygon\> |
| E05001645 | Bloomfield   | \<SF polygon\> |
| E05001646 | Brunswick    | \<SF polygon\> |
| E05001647 | Claremont    | \<SF polygon\> |
| E05001648 | Clifton      | \<SF polygon\> |
| E05001649 | Greenlands   | \<SF polygon\> |
| E05001650 | Hawes Side   | \<SF polygon\> |
| E05001651 | Highfield    | \<SF polygon\> |
| E05001652 | Ingthorpe    | \<SF polygon\> |

`lancashire_wards` {.table}

| objectid  | district            | geometry       |
|:----------|:--------------------|:---------------|
| E06000057 | Northumberland      | \<SF polygon\> |
| E08000021 | Newcastle upon Tyne | \<SF polygon\> |
| E08000022 | North Tyneside      | \<SF polygon\> |
| E08000023 | South Tyneside      | \<SF polygon\> |
| E08000024 | Sunderland          | \<SF polygon\> |
| E08000037 | Gateshead           | \<SF polygon\> |

`northumbria_districts` {.table}

| ward_code | ward_name                      | geometry       |
|:----------|:-------------------------------|:---------------|
| E05001067 | Birtley                        | \<SF polygon\> |
| E05001068 | Blaydon                        | \<SF polygon\> |
| E05001069 | Bridges                        | \<SF polygon\> |
| E05001071 | Chowdene                       | \<SF polygon\> |
| E05001072 | Crawcrook and Greenside        | \<SF polygon\> |
| E05001073 | Deckham                        | \<SF polygon\> |
| E05001074 | Dunston and Teams              | \<SF polygon\> |
| E05001075 | Dunston Hill and Whickham East | \<SF polygon\> |
| E05001076 | Felling                        | \<SF polygon\> |
| E05001077 | High Fell                      | \<SF polygon\> |

`northumbria_wards` {.table}

The stand-alone versions of
`lancashire_districts`/`northumbria_districts` are in geoJSON format and
the stand-alone versions of `lancashire_wards`/`northumbria_wards` are
geopackage files.

### `lancashire_ward_pop` and `northumbria_ward_pop`

Datasets of usual resident population in 2020 in each local government
ward in Lancashire and Northumbria, England. These can be used together
with the `lancashire_asb`/`northumbria_asb` and
`lancashire_wards`/`northumbria_wards` datasets for teaching non-spatial
joining and calculation of area crime rates.

| gss_code  | ward         | population |
|:----------|:-------------|-----------:|
| E05001643 | Anchorsholme |       6278 |
| E05001644 | Bispham      |       6291 |
| E05001645 | Bloomfield   |       7345 |
| E05001646 | Brunswick    |       6890 |
| E05001647 | Claremont    |       7178 |
| E05001648 | Clifton      |       6589 |
| E05001649 | Greenlands   |       6714 |
| E05001650 | Hawes Side   |       7010 |
| E05001651 | Highfield    |       6367 |
| E05001652 | Ingthorpe    |       6468 |

`lancashire_ward_pop` {.table}

| gss_code  | ward                           | population |
|:----------|:-------------------------------|-----------:|
| E05001067 | Birtley                        |       8028 |
| E05001068 | Blaydon                        |       9970 |
| E05001069 | Bridges                        |      11515 |
| E05001071 | Chowdene                       |       8647 |
| E05001072 | Crawcrook and Greenside        |       8786 |
| E05001073 | Deckham                        |       9786 |
| E05001074 | Dunston and Teams              |       9359 |
| E05001075 | Dunston Hill and Whickham East |       9005 |
| E05001076 | Felling                        |       9104 |
| E05001077 | High Fell                      |       9529 |

`northumbria_ward_pop` {.table}

The stand-alone versions of these dataset are Excel (`.xlsx`) files.

### `medellin_metro_lines` and `medellin_metro_stns`

Simple features (SF) objects containing the locations of metro lines and
stations in Medellin, Colombia.

    #> Warning in medellin_metro_lines_head$geometry <- "&lt;SF polyline&gt;":
    #> Coercing LHS to a list

[TABLE]

`medellin_metro_lines` {.table .kable_wrapper}

| linea | nombre                           | municipio | sistema |         x |        y |
|:------|:---------------------------------|:----------|:--------|----------:|---------:|
| A     | Estación Acevedo (Línea A)       | Medellín  | Metro   | -75.55856 | 6.299943 |
| A     | Estación Tricentenario (Línea A) | Medellín  | Metro   | -75.56472 | 6.290315 |
| A     | Estación Caribe (Línea A)        | Medellín  | Metro   | -75.56940 | 6.278327 |
| A     | Estación Universidad (Línea A)   | Medellín  | Metro   | -75.56583 | 6.269433 |
| A     | Estación Hospital (Línea A)      | Medellín  | Metro   | -75.56333 | 6.263920 |
| A     | Estación Prado (Línea A)         | Medellín  | Metro   | -75.56617 | 6.256850 |
| A     | Estación Parque Berrío (Línea A) | Medellín  | Metro   | -75.56824 | 6.250502 |
| A     | Estación San Antonio (Línea A)   | Medellín  | Metro   | -75.56970 | 6.247194 |
| B     | Estación Cisneros (Línea B)      | Medellín  | Metro   | -75.57515 | 6.249054 |
| A     | Estación Alpujarra (Línea A)     | Medellín  | Metro   | -75.57143 | 6.242917 |

`medellin_metro_stns` {.table}

The stand-alone version of the `medellin_metro_lines` dataset is a
zipped shapefile. The `medellin_metro_stn` dataset is a CSV file.

These datasets can be used together with the `medellin_homicides`
dataset to teach topics such as finding or counting crimes within a
certain distance of a facility (e.g. a metro station).

### `nottingham_wards`

Simple features (SF) objects containing the boundaries of local
government wards and districts in Nottingham, England. Boundaries are
for 2022.

| ward_code | ward_name      | geometry       |
|:----------|:---------------|:---------------|
| E05012270 | Aspley         | \<SF polygon\> |
| E05012271 | Basford        | \<SF polygon\> |
| E05012272 | Berridge       | \<SF polygon\> |
| E05012273 | Bestwood       | \<SF polygon\> |
| E05012274 | Bilborough     | \<SF polygon\> |
| E05012275 | Bulwell        | \<SF polygon\> |
| E05012276 | Bulwell Forest | \<SF polygon\> |
| E05012277 | Castle         | \<SF polygon\> |
| E05012278 | Clifton East   | \<SF polygon\> |
| E05012279 | Clifton West   | \<SF polygon\> |

The stand-alone version of this file is in geopackage format. The data
in these files can be used together with the `nottingham_wards` dataset
teach spatial clipping, counting incidents in areas and related topics.

### `nyc_precincts`

Dataset of the 77 police precincts in New York City.

| OBJECTID | Precinct | geom                         |
|---------:|---------:|:-----------------------------|
|        1 |        1 | MULTIPOLYGON (((-74.04388 4… |
|        2 |        5 | MULTIPOLYGON (((-73.98864 4… |
|        3 |        6 | MULTIPOLYGON (((-73.99969 4… |
|        4 |        7 | MULTIPOLYGON (((-73.97346 4… |
|        5 |        9 | MULTIPOLYGON (((-73.97161 4… |
|        6 |       10 | MULTIPOLYGON (((-74.00139 4… |
|        7 |       13 | MULTIPOLYGON (((-73.98156 4… |
|        8 |       14 | MULTIPOLYGON (((-73.97465 4… |
|        9 |       17 | MULTIPOLYGON (((-73.95904 4… |
|       10 |       18 | MULTIPOLYGON (((-73.99394 4… |

The stand-alone version of this dataset is a geopackage file.

This dataset can be used together with the `nyc_shootings` dataset to
teach topics such as counting the number of crimes in particular areas.

### `poland_population`

Dataset of resident population on 31 December in each year from 2022 to
2024 in each powiat (county) in Poland. This can be used together with
the `poland_powiat_boundaries` and `poland_property_crime_counts`
datasets for teaching non-spatial joining and calculation of area crime
rates.

| kod_bdl      | kod_teryt | nazwa                 |  rok | ludnosc |
|:-------------|:----------|:----------------------|-----:|--------:|
| 030210101000 | 0201      | Powiat bolesławiecki  | 2022 |   87922 |
| 030210101000 | 0201      | Powiat bolesławiecki  | 2023 |   87642 |
| 030210101000 | 0201      | Powiat bolesławiecki  | 2024 |   87255 |
| 030210302000 | 0202      | Powiat dzierżoniowski | 2022 |   95863 |
| 030210302000 | 0202      | Powiat dzierżoniowski | 2023 |   94740 |
| 030210302000 | 0202      | Powiat dzierżoniowski | 2024 |   93863 |
| 030210203000 | 0203      | Powiat głogowski      | 2022 |   85689 |
| 030210203000 | 0203      | Powiat głogowski      | 2023 |   85043 |
| 030210203000 | 0203      | Powiat głogowski      | 2024 |   84387 |
| 030210204000 | 0204      | Powiat górowski       | 2022 |   32738 |

The stand-alone version of this dataset is a tab-separated values (TSV)
file.

### `poland_powiat_boundaries`

Simple features (SF) object containing the boundaries of powiats
(counties) in Poland, from the 2025 archive of the National Register of
Boundaries.

| jpt_kod_je | jpt_nazwa             | regon          | geometry       |
|:-----------|:----------------------|:---------------|:---------------|
| 0201       | powiat bolesławiecki  | 23082162900000 | \<SF polygon\> |
| 0202       | powiat dzierżoniowski | 89071781700000 | \<SF polygon\> |
| 0203       | powiat głogowski      | 39064721600000 | \<SF polygon\> |
| 0204       | powiat górowski       | 41105046800000 | \<SF polygon\> |
| 0205       | powiat jaworski       | 39064716200000 | \<SF polygon\> |
| 0206       | powiat karkonoski     | 23082149200000 | \<SF polygon\> |
| 0207       | powiat kamiennogórski | 23082130000000 | \<SF polygon\> |
| 0208       | powiat kłodzki        | 89071789800000 | \<SF polygon\> |
| 0209       | powiat legnicki       | 39064720000000 | \<SF polygon\> |
| 0210       | powiat lubański       | 23082137400000 | \<SF polygon\> |

The stand-alone version of this dataset is a geopackage file.

### `qld_police_divisions`

Simple features (SF) object containing the boundaries of divisions of
the Queensland Police Service as of 2022.

| division     | geometry       |
|:-------------|:---------------|
| Acacia Ridge | \<SF polygon\> |
| Adavale      | \<SF polygon\> |
| Agnes Water  | \<SF polygon\> |
| Albany Creek | \<SF polygon\> |
| Allora       | \<SF polygon\> |
| Alpha        | \<SF polygon\> |
| Anakie       | \<SF polygon\> |
| Annerley     | \<SF polygon\> |
| Aramac       | \<SF polygon\> |
| Atherton     | \<SF polygon\> |

The stand-alone version of this dataset is a geopackage file.

### `qld_population`

Dataset of usual resident population in 2016 in each Queensland Police
Service division area. This can be used together with the
`qld_police_divisions` and `qld_stalking` datasets, especially for
teaching non-spatial joining and calculation of area crime rates.

| police_division | population |
|:----------------|-----------:|
| Acacia Ridge    |      40123 |
| Adavale         |        101 |
| Agnes Water     |       2674 |
| Albany Creek    |      49336 |
| Allora          |       3003 |
| Alpha           |        510 |
| Anakie          |       1599 |
| Annerley        |      25377 |
| Aramac          |        441 |
| Atherton        |      12092 |

The stand-alone version of this dataset is gzipped CSV file.

### `sao_paulo_muni`

Simple features (SF) object containing boundaries of municipality
boundaries in the immediate region of Sao Paulo, Brazil, 2010.

|     | code_muni | name_muni            | geometry       |
|:----|----------:|:---------------------|:---------------|
| 31  |   3502754 | Araçariguama         | \<SF polygon\> |
| 45  |   3503901 | Arujá                | \<SF polygon\> |
| 48  |   3504107 | Atibaia              | \<SF polygon\> |
| 65  |   3505708 | Barueri              | \<SF polygon\> |
| 72  |   3506359 | Bertioga             | \<SF polygon\> |
| 75  |   3506607 | Biritiba-Mirim       | \<SF polygon\> |
| 96  |   3508405 | Cabreúva             | \<SF polygon\> |
| 102 |   3509007 | Caieiras             | \<SF polygon\> |
| 104 |   3509205 | Cajamar              | \<SF polygon\> |
| 110 |   3509601 | Campo Limpo Paulista | \<SF polygon\> |

The stand-alone version of this dataset is a geoJSON file.

### `uttar_pradesh_districts`

Simple features (SF) object containing boundaries of administrative
districts in Uttar Pradesh, India.

| state         | district_name | geometry       |
|:--------------|:--------------|:---------------|
| Uttar Pradesh | Agra          | \<SF polygon\> |
| Uttar Pradesh | Bareilly      | \<SF polygon\> |
| Uttar Pradesh | Etah          | \<SF polygon\> |
| Uttar Pradesh | Shahjahanpur  | \<SF polygon\> |
| Uttar Pradesh | Pilibhit      | \<SF polygon\> |
| Uttar Pradesh | Allahabad     | \<SF polygon\> |
| Uttar Pradesh | Pratapgarh    | \<SF polygon\> |
| Uttar Pradesh | Jhansi        | \<SF polygon\> |
| Uttar Pradesh | Jalaun        | \<SF polygon\> |
| Uttar Pradesh | Jaunpur       | \<SF polygon\> |

The stand-alone version of this dataset is a geopackage file.

### `uttar_pradesh_population`

Dataset of usual resident population in 2011 in each administrative
district in Uttar Pradesh. This can be used together with the
`uttar_pradesh_districts` and `uttar_pradesh_murders` datasets,
especially for teaching non-spatial joining and calculation of area
crime rates.

| code | district       | headquarters | division  | population | area | density_km2 |
|:-----|:---------------|:-------------|:----------|-----------:|-----:|------------:|
| AG   | Agra           | Agra         | Agra      |    4418797 | 4041 |        1093 |
| AL   | Aligarh        | Aligarh      | Aligarh   |    3673889 | 3788 |        1007 |
| AH   | Allahabad      | Allahabad    | Allahabad |    5954391 | 5482 |        1086 |
| AN   | Ambedkar Nagar | Akbarpur     | Faizabad  |    2397888 | 2350 |        1020 |
| AM   | Amethi         | Gauriganj    | Faizabad  |    2050133 | 2651 |         773 |
| JP   | Amroha         | Amroha       | Moradabad |    1840221 | 2249 |         818 |
| AU   | Auraiya        | Auraiya      | Kanpur    |    1379545 | 2016 |         684 |
| AZ   | Azamgarh       | Azamgarh     | Azamgarh  |    4613913 | 4054 |        1138 |
| BD   | Budaun         | Badaun       | Bareilly  |    3127621 | 4234 |        2368 |
| BG   | Baghpat        | Baghpat      | Meerut    |    1303048 | 5237 |         249 |

The stand-alone version of this dataset is a CSV file.
