#' Queensland Police Service division boundaries
#'
#' Dataset of the boundaries of each division of the Queensland Police Service,
#' 2022.
#'
#' @format Simple features (SF) object containing 331 rows and 2 columns:
#' \describe{
#'   \item{division}{Police division name}
#'   \item{geometry}{SF polygons of the outline of each division}
#' }
#'
#' This dataset is also available as a stand-alone file in geopackage format
#' at <https://mpjashby.github.io/crimemappingdata/qld_police_divisions.gpkg>.
#'
#' Licence: Creative Commons Attribution <https://creativecommons.org/licenses/by/3.0/au/>
#'
#'
#' @source Queensland Government
#' <https://www.data.qld.gov.au/dataset/qps-divisions/resource/fa6a7917-43de-4036-a704-25f545c24093>
#' @seealso
#' \code{\link{qld_population}}: Population of Queensland Police Service divisions.
#' \code{\link{qld_stalking}}: Stalking in Queensland from 2001 to 2022.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     qld_police_divisions,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"qld_police_divisions"
