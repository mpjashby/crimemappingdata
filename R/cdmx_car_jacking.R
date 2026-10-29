#' Car jackings in Mexico City
#'
#' Dataset of car jackings (\emph{"robo de vehiculo de servicio particular con violencia"}) in Mexico City in 2019.
#'
#' @format Simple features (SF) object containing 2,811 rows and 4 columns:
#' \describe{
#'   \item{fecha_hechos}{Date and time of the offence}
#'   \item{longitud}{Longitude}
#'   \item{latitud}{Latitude}
#'   \item{geometry}{SF point geometry}
#' }
#'
#' This dataset is also available as a stand-alone file in geopackage format
#' at <https://mpjashby.github.io/crimemappingdata/cdmx_car_jacking.gpkg>.
#'
#' Licence: Creative Commons Attribution <https://creativecommons.org/licenses/by/4.0/>
#'
#'
#' @source Mexico City Attorney General’s Office
#' @seealso
#' \code{\link{cdmx_alcaldias}}: Alcaldías (boroughs) of Mexico City.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   # Exclude the known zero-coordinate placeholders.
#'   xy <- sf::st_coordinates(cdmx_car_jacking)
#'   map_data <- cdmx_car_jacking[xy[, 1] != 0 | xy[, 2] != 0, ]
#'   sfhotspot::hotspot_map(
#'     map_data,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     size = 0.6
#'   )
#' }
"cdmx_car_jacking"
