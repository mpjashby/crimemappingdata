#' Local government wards of Lancashire
#'
#' Dataset of ward boundaries in Lancashire, England, in 2022.
#'
#' @format A simple features (SF) object with 271 rows and 3 columns:
#' \describe{
#'   \item{ward_code}{Government Statistical Service code for each ward}
#'   \item{ward_name}{Ward name}
#'   \item{geometry}{SF polygon geometry}
#' }
#'
#' This dataset is also available as a stand-alone file in geopackage format at
#' <https://mpjashby.github.io/crimemappingdata/lancashire_wards.gpkg>.
#'
#' Licence: Open Government Licence
#'
#'
#' @source Office for National Statistics
#' @seealso
#' \code{\link{lancashire_asb}}: Anti-social behaviour in Lancashire.
#' \code{\link{lancashire_districts}}: Local authority districts of Lancashire.
#' \code{\link{lancashire_ward_pop}}: Lancashire ward population.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     lancashire_wards,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"lancashire_wards"
