#' Local authority districts of Northumbria
#'
#' Dataset of the boundaries of the local authority districts in Northumbria,
#' England, in 2022.
#'
#' @format A simple features (SF) object with 5 rows and 3 columns:
#' \describe{
#'   \item{objectid}{Government Statistical Service code for each district}
#'   \item{district}{District name}
#'   \item{geometry}{SF polygon geometry}
#' }
#'
#' This dataset is also available as a stand-alone file in geoJSON format at
#' <https://mpjashby.github.io/crimemappingdata/northumbria_districts.geojson>.
#'
#' Licence: Open Government Licence
#'
#'
#' @source Office for National Statistics
#' @seealso
#' \code{\link{northumbria_asb}}: Anti-social behaviour in Northumbria.
#' \code{\link{northumbria_ward_pop}}: Northumbria ward population.
#' \code{\link{northumbria_wards}}: Local government wards of Northumbria.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     northumbria_districts,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"northumbria_districts"
