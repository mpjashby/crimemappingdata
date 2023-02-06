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
#' @source Metro de Medellin
"medellin_metro_lines"
