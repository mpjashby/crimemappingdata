#' Medellin homicides
#'
#' Dataset of homicides in Medellin, Colombia, from 2010 to 2019.
#'
#' @format A data frame of 9,360 rows and 6 columns:
#' \describe{
#'   \item{fecha_hecho}{Date-time of the incident}
#'   \item{longitud}{Longitude}
#'   \item{latitud}{Latitude}
#'   \item{sexo}{Sex of victim}
#'   \item{edad}{Age of victim in years}
#'   \item{modalidad}{Method of homicide}
#' }
#'
#' This dataset is also available as a stand-alone file in CSV format at
#' <https://mpjashby.github.io/crimemappingdata/medellin_homicides.csv>. Note
#' that the CSV file uses semi colons as column delimiters and commas as decimal
#' separators in numbers. This file can be read with functions such as
#' [readr::read_csv2()].
#'
#' Licence: Creative Commons Attribution Share-Alike <https://opendefinition.org/licenses/cc-by-sa/>
#'
#'
#' @seealso
#' \code{\link{medellin_metro_lines}}: Metro and cable-car lines in Medellin.
#' \code{\link{medellin_metro_stns}}: Metro and cable-car stations in Medellin.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   # Some incidents have no recorded coordinates.
#'   map_data <- subset(medellin_homicides, !is.na(longitud) & !is.na(latitud))
#'   map_data <- sf::st_as_sf(
#'     map_data,
#'     coords = c("longitud", "latitud"),
#'     crs = "EPSG:4326"
#'   )
#'
#'   sfhotspot::hotspot_map(
#'     map_data,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     size = 0.6
#'   )
#' }
"medellin_homicides"
