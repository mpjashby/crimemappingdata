#' Retiro homicides in 2023
#'
#' Homicides in the Retiro neighbourhood of Buenos Aires in 2023.
#'
#' @format A data frame with 13 rows and 4 columns.
#' \describe{
#'   \item{id_mapa}{Source record identifier}
#'   \item{fecha}{Recorded event date and time (to the nearest hour)}
#'   \item{longitud}{Longitude in decimal degrees}
#'   \item{latitud}{Latitude in decimal degrees}
#' }
#'
#' A version of this dataset is available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/retiro_homicides.csv>. Note
#' that while this is a Spanish-language dataset the file uses commas as
#' delimiters.
#'
#' Licence: Creative Commons Attribution
#'
#'
#' @source Direccion General de Estadistica Criminal y Mapa del Delito, City of Buenos Aires <https://data.buenosaires.gob.ar/dataset/delitos>.
#'
#' @seealso
#' \code{\link{buenos_aires_barrios}}: Buenos Aires barrio boundaries.
#' \code{\link{buenos_aires_robbery}}: Buenos Aires robberies in 2023.
#' \code{\link{buenos_aires_subte_lines}}: Buenos Aires Subte (metro) lines.
#' \code{\link{buenos_aires_subte_stations}}: Buenos Aires Subte (metro) stations.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     retiro_homicides,
#'     coords = c("longitud", "latitud"),
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
"retiro_homicides"
