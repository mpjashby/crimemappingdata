#' Buenos Aires Subte (metro) stations
#'
#' @format A data frame with 90 rows and 4 columns.
#' \describe{
#'   \item{station_id}{Source station identifier}
#'   \item{station}{Station name}
#'   \item{line}{Metro line letter}
#'   \item{geometry}{SF point geometry}
#' }
#'
#' A version of this dataset is available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/buenos_aires_subte_stations.gpkg>.
#'
#' Licence: CC BY 2.5 Argentina <https://creativecommons.org/licenses/by/2.5/ar/>.
#'
#'
#' @source Subterraneos de Buenos Aires (SBASE), City of Buenos Aires <https://data.buenosaires.gob.ar/dataset/subte-estaciones>.
#' @seealso
#' \code{\link{buenos_aires_barrios}}: Buenos Aires barrio boundaries.
#' \code{\link{buenos_aires_robbery}}: Buenos Aires robberies in 2023.
#' \code{\link{buenos_aires_subte_lines}}: Buenos Aires Subte (metro) lines.
#' \code{\link{retiro_homicides}}: Retiro homicides in 2023.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     buenos_aires_subte_stations,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     size = 0.6
#'   )
#' }
"buenos_aires_subte_stations"
