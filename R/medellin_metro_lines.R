#' Metro and cable-car lines in Medellin
#'
#' Routes of metro and cable-car lines in Medellin, Colombia, as of early 2023.
#'
#' @format Simple features (SF) object with 9 rows and 4 columns:
#' \describe{
#'   \item{linea}{Line letter}
#'   \item{itinerario}{Terminus stations}
#'   \item{sistema}{Metro or Cable}
#'   \item{geometry}{SF line object}
#' }
#'
#' This dataset is also available as a stand-alone file in shape-file format
#' at <https://mpjashby.github.io/crimemappingdata/medellin_metro_lines.zip>.
#' Note the components of the shape file are contained in a zip archive.
#'
#'
#' @source Metro de Medellin
#' @seealso
#' \code{\link{medellin_homicides}}: Medellin homicides.
#' \code{\link{medellin_metro_stns}}: Metro and cable-car stations in Medellin.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     medellin_metro_lines,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     size = 0.3
#'   )
#' }
"medellin_metro_lines"
