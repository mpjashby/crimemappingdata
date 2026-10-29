#' Fatal terrorist attacks in London
#'
#' Dataset of fatal terrorist attacks in London, United Kingdom, from 2010 to
#' 2018.
#'
#' @format A data frame containing 8 rows and 4 columns:
#' \describe{
#'   \item{date}{Attack date}
#'   \item{latitude}{Latitude}
#'   \item{longitude}{Longitude}
#'   \item{description}{Type of attack and number of people killed}
#' }
#'
#' A version of this dataset is also available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/london_attacks.csv>.
#'
#' Licence: public domain
#'
#'
#' @source Compiled by package author
#' @seealso
#' \code{\link{london_crimes}}: Crimes in London.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     london_attacks,
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
"london_attacks"
