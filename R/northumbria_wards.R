#' Local government wards of Northumbria
#'
#' Dataset of ward boundaries in Northumbria, England, in 2022.
#'
#' @format A simple features (SF) object with 177 rows and 3 columns:
#' \describe{
#'   \item{ward_code}{Government Statistical Service code for each ward}
#'   \item{ward_name}{Ward name}
#'   \item{geometry}{SF polygon geometry}
#' }
#'
#' This dataset is also available as a stand-alone file in geopackage format at
#' <https://mpjashby.github.io/crimemappingdata/northumbria_wards.gpkg>.
#'
#' Licence: Open Government Licence
#'
#'
#' @source Office for National Statistics
#' @seealso
#' \code{\link{northumbria_asb}}: Anti-social behaviour in Northumbria.
#' \code{\link{northumbria_districts}}: Local authority districts of Northumbria.
#' \code{\link{northumbria_ward_pop}}: Northumbria ward population.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     northumbria_wards,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"northumbria_wards"
