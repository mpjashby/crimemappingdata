#' Japanese prefecture boundaries, 2019
#'
#' Dataset of boundaries of Japanese prefectures.
#'
#' @format Data frame of 47 rows and 6 columns:
#' \describe{
#'   \item{adm0_en}{Top-level administrative unit name (English)}
#'   \item{adm0_ja}{Top-level administrative unit name (Japanese)}
#'   \item{adm0_pcode}{Top-level administrative unit code (English)}
#'   \item{adm1_en}{Prefecture name (English)}
#'   \item{adm1_ja}{Prefecture name (Japanese)}
#'   \item{adm1_pcode}{Prefecture code (English)}
#' }
#'
#' This dataset is also available as a stand-alone file in Geopackage
#' (\code{.gpkg}) format at
#' <https://mpjashby.github.io/crimemappingdata/japan_prefectures.gpkg>.
#'
#' Licence: Creative Commons Attribution for Intergovernmental Organisations
#'
#'
#' @source United Nations Office for the Coordination of Humanitarian Affairs
#' @seealso
#' \code{\link{japan_violence_counts}}: Counts of violent crime in Japan, 2012.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     japan_prefectures,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"japan_prefectures"
