#' Thefts in Vancouver in 2020
#'
#' Dataset of 21,918 thefts in the City of Vancouver in 2020.
#'
#' @format A data frame with 21,918 rows and 10 columns:
#' \describe{
#'   \item{TYPE}{The type of theft}
#'   \item{YEAR}{The year (2020)}
#'   \item{MONTH}{A month as a number}
#'   \item{DAY}{A day of the month as a number}
#'   \item{HOUR}{A hour as a number}
#'   \item{MINUTE}{A minute past the hour as a number}
#'   \item{HUNDRED_BLOCK}{An address, anonymised to the nearest 100 block}
#'   \item{NEIGHBOURHOOD}{A neighbourhood name}
#'   \item{X}{X co-ordinate in the UTM zone 10 north CRS (EPSG:32610)}
#'   \item{Y}{Y co-ordinate in the UTM zone 10 north CRS (EPSG:32610)}
#' }
#'
#' This dataset is also available as a stand-alone file in gzipped CSV format at
#' <https://mpjashby.github.io/crimemappingdata/vancouver_thefts.csv.gz>.
#'
#'
#' @source Vancouver Police Department <https://geodash.vpd.ca/opendata/>
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     vancouver_thefts,
#'     coords = c("X", "Y"),
#'     crs = "EPSG:32610"
#'   )
#'
#'   sfhotspot::hotspot_map(
#'     map_data,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     size = 0.6
#'   )
#' }
"vancouver_thefts"
