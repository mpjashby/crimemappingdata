#' Metro and cable-car stations in Medellin
#'
#' Locations of metro and cable-car stations in Medellin, Colombia, as of early
#' 2023.
#'
#' @format Data frame with 48 rows and 6 columns:
#' \describe{
#'   \item{linea}{Line letter}
#'   \item{nombre}{Station name}
#'   \item{municipio}{Municipality name}
#'   \item{sistema}{Metro or Cable}
#'   \item{x}{Longitude}
#'   \item{y}{Latitude}
#' }
#'
#' This dataset is also available as a stand-alone file in CSV format at
#' <https://mpjashby.github.io/crimemappingdata/medellin_metro_stns.csv>.
#'
#'
#' @source Metro de Medellin
#' @seealso
#' \code{\link{medellin_homicides}}: Medellin homicides.
#' \code{\link{medellin_metro_lines}}: Metro and cable-car lines in Medellin.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     medellin_metro_stns,
#'     coords = c("x", "y"),
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
"medellin_metro_stns"
