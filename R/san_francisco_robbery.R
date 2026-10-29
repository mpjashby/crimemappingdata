#' Personal robberies in San Francisco in 2019
#'
#' Dataset of personal robberies in San Francisco in 2019.
#'
#' @format A data frame containing 951 rows and 5 columns:
#' \describe{
#'   \item{uid}{Numeric reference number for each crime}
#'   \item{offense_type}{Offence type (always "personal robbery")}
#'   \item{date_time}{Date-time at which offence occurred}
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude}
#' }
#'
#' This dataset is also available as a stand-alone file in CSV format at
#' <https://mpjashby.github.io/crimemappingdata/san_francisco_robbery.csv>.
#'
#' Licence: Open Data Commons Public Domain Dedication and License <https://opendatacommons.org/licenses/pddl/1.0/>
#'
#'
#' @source San Francisco Police Department
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     san_francisco_robbery,
#'     coords = c("longitude", "latitude"),
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
"san_francisco_robbery"
