#' Retiro homicides in 2023
#'
#' Homicides in the Retiro neighbourhood of Buenos Aires in 2023.
#'
#' @format A data frame with 13 rows and 4 columns.
#' \describe{
#'   \item{id_mapa}{Source record identifier}
#'   \item{fecha}{Recorded event date and time (to the nearest hour)}
#'   \item{longitud}{Longitude in decimal degrees}
#'   \item{latitud}{Latitude in decimal degrees}
#' }
#'
#' A version of this dataset is available as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/retiro_homicides.csv>. Note
#' that while this is a Spanish-language dataset the file uses commas as
#' delimiters.
#'
#' Licence: Creative Commons Attribution
#'
#' @section Map:
#' \if{html}{\figure{retiro_homicides-map.png}{options: width="400" alt="Retiro homicides in 2023"}}
#' \if{latex}{\figure{retiro_homicides-map.png}{options: width=4in}}
#'
#' @source Direccion General de Estadistica Criminal y Mapa del Delito, City of Buenos Aires <https://data.buenosaires.gob.ar/dataset/delitos>.
#'
"retiro_homicides"
