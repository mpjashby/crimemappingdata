#' Shootings in the Bronx in 2019
#'
#' Dataset of shootings in the Bronx borough of New York City recorded by the
#' New York City Police Department (NYPD) in 2019.
#'
#' @format A data frame with 267 rows and five columns:
#' \describe{
#'   \item{incident_key}{Numeric reference number for each incident}
#'   \item{occur_date}{Date offence occurred}
#'   \item{murder}{Whether the shooting was fatal or not (logical)}
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude}
#' }
#'
#' This dataset is also available as a stand-alone file in CSV format at
#' <https://mpjashby.github.io/crimemappingdata/bronx_shootings.csv>.
#'
#' Licence: NYC Open Data Law
#'
#'
#' @source New York City Police Department
#' <https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Historic-/833y-fsy8>
#' @seealso
#' \code{\link{nyc_homicides}}: Homicides in New York City, 2016 to 2018.
#' \code{\link{nyc_precincts}}: New York City Police precinct boundaries.
#' \code{\link{nyc_shootings}}: Shootings in New York City in 2019.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     bronx_shootings,
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
"bronx_shootings"
