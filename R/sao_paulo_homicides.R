#' Homicides in the region of Sao Paulo
#'
#' Dataset of homicides recorded by police in the immediate region of Sao Paulo
#' from 2017 to 2022.
#'
#' @format A data frame containing 6,214 rows and 7 columns:
#' \describe{
#'   \item{year}{Year}
#'   \item{date}{Homicide date}
#'   \item{municipality}{Municipality}
#'   \item{location_type}{Type of location}
#'   \item{victim_sex}{Victim sex}
#'   \item{latitude}{Latitude}
#'   \item{longitude}{Longitude}
#' }
#'
#' A version of this dataset is also available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/sao_paulo_homicides.xlsx>.
#'
#' The original dataset has been cleaned to remove homicides with missing
#' co-ordinates.
#'
#' Licence: public domain
#'
#'
#' @source State of Sao Paulo Public Security Secretariat
#' @seealso
#' \code{\link{sao_paulo_muni}}: Municipality boundaries in São Paulo.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     sao_paulo_homicides,
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
"sao_paulo_homicides"
