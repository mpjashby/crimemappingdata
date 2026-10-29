#' Anti-social behaviour in Northumbria
#'
#' Dataset of incidents of anti-social behaviour reported to police in
#' Northumbria, England, in 2022.
#'
#' @format A data frame of 39,706 rows and 5 columns:
#' \describe{
#'   \item{month}{Date of the first day of the month of the incident}
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude}
#'   \item{location}{Street name or point-of-interest category}
#'   \item{lsoa_code}{Government Statistical Service code for the Lower Layer
#'   Super Output Area in which the incident occurred}
#' }
#'
#' This dataset is also available as a stand-alone file in tab-separated values
#' format at <https://mpjashby.github.io/crimemappingdata/northumbria_asb.tab>.
#'
#' Licence: Open Government Licence
#'
#'
#' @source Home Office
#' @seealso
#' \code{\link{northumbria_districts}}: Local authority districts of Northumbria.
#' \code{\link{northumbria_ward_pop}}: Northumbria ward population.
#' \code{\link{northumbria_wards}}: Local government wards of Northumbria.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     northumbria_asb,
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
"northumbria_asb"
