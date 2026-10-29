#' Sao Paolo municipality boundaries
#'
#' Dataset of municipality boundaries in the immediate region of Sao Paulo, 2010.
#'
#' @format A data frame containing 60 rows and 3 columns:
#' \describe{
#'   \item{code_muni}{Statistical code for municipality}
#'   \item{name_muni}{Municipality name}
#'   \item{geom}{Feature geometry}
#' }
#'
#' A version of this dataset is also available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/sao_paulo_muni.geojson>.
#'
#' Licence: public domain
#'
#'
#' @source Institute for Applied Economic Research
#' @seealso
#' \code{\link{sao_paulo_homicides}}: Homicides in the region of Sao Paulo.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     sao_paulo_muni,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"sao_paulo_muni"
