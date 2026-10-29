#' Local authority districts of Lancashire
#'
#' Dataset of the boundaries of the local authority districts in Lancashire,
#' England, in 2022.
#'
#' @format A simple features (SF) object with 14 rows and 3 columns:
#' \describe{
#'   \item{objectid}{Government Statistical Service code for each district}
#'   \item{district}{District name}
#'   \item{geometry}{SF polygon geometry}
#' }
#'
#' This dataset is also available as a stand-alone file in geoJSON format at
#' <https://mpjashby.github.io/crimemappingdata/lancashire_districts.geojson>.
#'
#' Licence: Open Government Licence
#'
#'
#' @source Office for National Statistics
#' @seealso
#' \code{\link{lancashire_asb}}: Anti-social behaviour in Lancashire.
#' \code{\link{lancashire_ward_pop}}: Lancashire ward population.
#' \code{\link{lancashire_wards}}: Local government wards of Lancashire.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     lancashire_districts,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"lancashire_districts"
