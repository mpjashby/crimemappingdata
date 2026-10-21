#' Buenos Aires barrio boundaries
#'
#' A dataset of barrio (neighbourhood) boundaries in the City of Buenos Aires,
#' Argentina.
#'
#' @format A data frame with 48 rows and 5 columns.
#' \describe{
#'   \item{id}{Polygon identifier}
#'   \item{nombre}{Neighbourhood name}
#'   \item{comuna}{Commune number}
#'   \item{area_metro}{Area in square meters}
#'   \item{geometry}{Polygon representing barrio boundary}
#' }
#'
#' This dataset is also available as a stand-alone file in geopackage format at
#' <https://mpjashby.github.io/crimemappingdata/buenos_aires_barrios.gpkg>.
#'
#' Licence: CC BY 2.5 Argentina
#' <https://creativecommons.org/licenses/by/2.5/ar/>.
#'
#' @section Map:
#' \if{html}{\figure{buenos_aires_barrios-map.png}{options: width="400" alt="Map of buenos Aires barrio boundaries"}}
#' \if{latex}{\figure{buenos_aires_barrios-map.png}{options: width=4in}}
#'
#' @source City of Buenos Aires
#' <https://data.buenosaires.gob.ar/dataset/barrios>.
"buenos_aires_barrios"
