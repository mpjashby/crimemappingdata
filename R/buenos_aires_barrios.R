#' Buenos Aires barrio boundaries
#'
#' A dataset of barrio (neighbourhood) boundaries in the City of Buenos Aires,
#' Argentina.
#'
#' @format A data frame with 48 rows and 5 columns.
#' \describe{
#'   \item{id}{Polygon identifier}
#'   \item{nombre}{Neighbourhood name}
#'   \item{comuna}{Commune number}
#'   \item{area_metro}{Area in square meters}
#'   \item{geometry}{Polygon representing barrio boundary}
#' }
#'
#' This dataset is also available as a stand-alone file in geopackage format at
#' <https://mpjashby.github.io/crimemappingdata/buenos_aires_barrios.gpkg>.
#'
#' Licence: CC BY 2.5 Argentina
#' <https://creativecommons.org/licenses/by/2.5/ar/>.
#'
#'
#' @source City of Buenos Aires
#' <https://data.buenosaires.gob.ar/dataset/barrios>.
#' @seealso
#' \code{\link{buenos_aires_robbery}}: Buenos Aires robberies in 2023.
#' \code{\link{buenos_aires_subte_lines}}: Buenos Aires Subte (metro) lines.
#' \code{\link{buenos_aires_subte_stations}}: Buenos Aires Subte (metro) stations.
#' \code{\link{retiro_homicides}}: Retiro homicides in 2023.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     buenos_aires_barrios,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"buenos_aires_barrios"
