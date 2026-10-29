#' Calls to opioid overdoses in Tempe, Arizona
#'
#' Dataset of calls to emergency medical services in Tempe for suspected opioid
#' overdoses.
#'
#' @format A data frame containing 3,379 rows and 5 columns:
#' \describe{
#'   \item{year}{Year of incident}
#'   \item{incident_date}{Date of incident}
#'   \item{narcan_given}{Was naloxone given to the patient?}
#'   \item{latitude}{Latitude}
#'   \item{longitude}{Longitude}
#' }
#'
#' A version of this dataset is also available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/tempe_opioid_calls.csv>.
#'
#' This dataset has been cleaned to remove incidents with missing co-ordinates.
#' The co-ordinates in the original dataset have been rounded to preserve the
#' privacy of those involved: the City of Tempe estimates the co-ordinates are
#' accurate to with approximately 0.25 miles.
#'
#' Licence: Creative Commons Attribution (CC-BY)
#'
#'
#' @source Open Tempe
#'
#' @seealso
#' \code{\link{tempe_character_areas}}: Character Area boundaries in Tempe, Arizona.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     tempe_opioid_calls,
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
"tempe_opioid_calls"
