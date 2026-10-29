#' Buenos Aires Subte (metro) lines
#'
#' @format A data frame with 98 rows and 3 columns.
#' \describe{
#'   \item{segment_id}{Line segment identifier}
#'   \item{line}{Subte line name}
#'   \item{geometry}{SF line geometry}
#' }
#'
#' A version of this dataset is available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/buenos_aires_subte_lines.gpkg>.
#'
#' Licence: CC BY 2.5 Argentina <https://creativecommons.org/licenses/by/2.5/ar/>.
#'
#'
#' @source Subterraneos de Buenos Aires (SBASE), City of Buenos Aires <https://data.buenosaires.gob.ar/dataset/subte-estaciones>.
#' @seealso
#' \code{\link{buenos_aires_barrios}}: Buenos Aires barrio boundaries.
#' \code{\link{buenos_aires_robbery}}: Buenos Aires robberies in 2023.
#' \code{\link{buenos_aires_subte_stations}}: Buenos Aires Subte (metro) stations.
#' \code{\link{retiro_homicides}}: Retiro homicides in 2023.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     buenos_aires_subte_lines,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     size = 0.3
#'   )
#' }
"buenos_aires_subte_lines"
