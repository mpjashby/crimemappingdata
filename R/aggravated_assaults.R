#' Aggravated assaults in Austin in 2019
#'
#' Dataset of aggravated assaults in Austin, TX, in 2019.
#'
#' @format A data frame containing 8,696 rows and 5 columns:
#' \describe{
#'   \item{date}{A date-time}
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude}
#'   \item{location_type}{Type of place}
#'   \item{location_category}{More-detailed type of place}
#' }
#'
#' A version of this dataset is also available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/aggravated_assaults.xlsx> but
#' the contents of the stand-alone file differ from the contents of the
#' package dataset. The stand-alone file is an Excel (`.xlsx`) file containing
#' three sheets: one each containing data (in the same format as above) for
#' Austin, TX (the data in the package dataset), Fort Worth, TX, and Seattle,
#' WA.
#'
#' Licence: Creative Commons Attribution <https://creativecommons.org/licenses/by/4.0/>
#'
#'
#' @source `crimedata` package <http://pkgs.lesscrime.info/crimedata/>
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     aggravated_assaults,
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
"aggravated_assaults"
