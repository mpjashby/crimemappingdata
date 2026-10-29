#' Burglaries in Cincinnati, 2016 to 2018
#'
#' Dataset of aggravated assaults recorded by police in Cincinnati between
#' January 2016 and December 2018.
#'
#' @format Data frame with 8,723 and 5 columns:
#' \describe{
#'   \item{incident_no}{Unique identifier}
#'   \item{offense_date}{Date on which offence was discovered by victim}
#'   \item{offense}{Offence type}
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude}
#' }
#'
#' This dataset is also available as a stand-alone file in comma-separated
#' values (CSV) format at:
#' <https://mpjashby.github.io/crimemappingdata/cincinnati_burglary.csv.gz>
#'
#' Licence: Public domain
#'
#' @source City of Cincinnati
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   # Some incidents have no recorded coordinates.
#'   map_data <- subset(cincinnati_burglary, !is.na(longitude) & !is.na(latitude))
#'   map_data <- sf::st_as_sf(
#'     map_data,
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
"cincinnati_burglary"
