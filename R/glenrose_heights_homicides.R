#' Homicides in Glenrose Heights in 2019
#'
#' Dataset of the four homicides that occurred in the Glenrose Heights
#' neighbourhood of Atlanta, GA, in 2019.
#'
#' @format A data frame with four rows and four columns:
#' \describe{
#'   \item{report_number}{A reference number}
#'   \item{label}{A pre-formatted label giving address and date/time}
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude}
#' }
#'
#' This dataset is also available as a stand-alone file in two formats: in CSV
#' format at
#' <https://mpjashby.github.io/crimemappingdata/glenrose_heights_homicides.csv>
#' and in GeoPackage format at
#' <https://mpjashby.github.io/crimemappingdata/glenrose_heights_homicides.gpkg>
#'
#' Licence: public domain
#'
#'
#' @source Atlanta Police Department
#' @seealso
#' \code{\link{downtown_homicides}}: Homicides in downtown Atlanta in 2019.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     glenrose_heights_homicides,
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
"glenrose_heights_homicides"
