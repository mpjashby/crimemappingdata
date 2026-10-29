#' Districts of Uttar Pradesh
#'
#' Spatial dataset of the boundaries of administrative districts in the Indian
#' state of uttar Pradesh.
#'
#' @format Simple features (SF) object containing 75 rows and 3 columns:
#' \describe{
#'   \item{state}{State name}
#'   \item{district_name}{District name}
#'   \item{geometry}{SF geometry representation of the district boundary}
#' }
#'
#' This dataset is also available as a stand-alone file in geopackage format at
#' <https://mpjashby.github.io/crimemappingdata/uttar_pradesh_districts.gpkg>.
#'
#' Licence: MIT
#'
#'
#' @source Hindustan Times
#' <https://github.com/HindustanTimesLabs/shapefiles>
#' @seealso
#' \code{\link{uttar_pradesh_murders}}: Murders in Uttar Pradesh.
#' \code{\link{uttar_pradesh_population}}: Population of districts in Uttar Pradesh.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     uttar_pradesh_districts,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"uttar_pradesh_districts"
