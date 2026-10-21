#' Buenos Aires robberies in 2023
#'
#' Robberies in Buenos Aires in 2023.
#'
#' @format A data frame with 64,983 rows and 6 columns.
#' \describe{
#'   \item{id_mapa}{Source record identifier}
#'   \item{fecha}{Recorded event date and time (to the nearest hour)}
#'   \item{subtipo}{Type of robbery}
#'   \item{barrio}{Neighbourhood name}
#'   \item{longitud}{Longitude in decimal degrees}
#'   \item{latitud}{Latitude in decimal degrees}
#' }
#'
#' A version of this dataset is available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/buenos_aires_robbery.csv>. Note
#' that since this is a Spanish-language dataset the file uses semi colons as
#' delimiters.
#'
#' Licence: Creative Commons Attribution
#'
#' @section Map:
#' \if{html}{\figure{buenos_aires_robbery-map.png}{options: width="400" alt="Map of buenos Aires robberies in 2023"}}
#' \if{latex}{\figure{buenos_aires_robbery-map.png}{options: width=4in}}
#'
#' @source Direccion General de Estadistica Criminal y Mapa del Delito, City of Buenos Aires <https://data.buenosaires.gob.ar/dataset/delitos>.
#'
"buenos_aires_robbery"
