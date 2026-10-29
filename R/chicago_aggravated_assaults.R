#' Aggravated assaults in Chicago, 2010 to 2019
#'
#' Dataset of aggravated assaults recorded by police in Chicago between 2010 and
#' 2019.
#'
#' @format Data frame with 148,636 rows and 5 columns:
#' \describe{
#'   \item{date}{Date-time at which assault occurred}
#'   \item{loc_cat}{Type of location}
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude}
#'   \item{district}{Chicago Police Department District}
#' }
#'
#' This dataset is also available as a stand-alone file in comma-separated
#' values (CSV) format at
#' <https://mpjashby.github.io/crimemappingdata/chicago_aggravated_assaults.csv.gz>
#'
#' Licence: <https://www.chicago.gov/city/en/narr/foia/data_disclaimer.html>
#'
#' This site provides applications using data that has been modified for use
#' from its original source, <http://www.cityofchicago.org/>, the official
#' website of the City of Chicago. The City of Chicago makes no claims as to the
#' content, accuracy, timeliness, or completeness of any of the data provided at
#' this site. The data provided at this site is subject to change at any time.
#' It is understood that the data provided at this site is being used at one’s
#' own risk.
#'
#'
#' @source City of Chicago
#' @seealso
#' \code{\link{chicago_police_districts}}: Chicago Police Department Districts.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     chicago_aggravated_assaults,
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
"chicago_aggravated_assaults"
