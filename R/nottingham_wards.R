#' Local government wards of Nottingham
#'
#' Dataset of ward boundaries in Nottingham, England, in 2022.
#'
#' @format A simple features (SF) object with 20 rows and 3 columns:
#' \describe{
#'   \item{ward_code}{Government Statistical Service code for each ward}
#'   \item{ward_name}{Ward name}
#'   \item{geometry}{SF polygon geometry}
#' }
#'
#' This dataset is also available as a stand-alone file in geopackage format at
#' <https://mpjashby.github.io/crimemappingdata/nottingham_wards.gpkg>.
#'
#' Licence: Open Government Licence
#'
#'
#' @source Office for National Statistics
#' @seealso
#' \code{\link{nottingham_burglary}}: Burglaries in Nottingham.
#' \code{\link{nottingham_robbery}}: Robberies in Nottingham.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     nottingham_wards,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"nottingham_wards"
