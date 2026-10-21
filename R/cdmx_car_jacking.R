#' Car jackings in Mexico City
#'
#' Dataset of car jackings (\emph{"robo de vehiculo de servicio particular con violencia"}) in Mexico City in 2019.
#'
#' @format Simple features (SF) object containing 2,811 rows and 4 columns:
#' \describe{
#'   \item{fecha_hechos}{Date and time of the offence}
#'   \item{longitud}{Longitude}
#'   \item{latitud}{Latitude}
#'   \item{geometry}{SF point geometry}
#' }
#'
#' This dataset is also available as a stand-alone file in geopackage format
#' at <https://mpjashby.github.io/crimemappingdata/cdmx_car_jacking.gpkg>.
#'
#' Licence: Creative Commons Attribution <https://creativecommons.org/licenses/by/4.0/>
#'
#' @section Map:
#' \if{html}{\figure{cdmx_car_jacking-map.png}{options: width="400" alt="Map of car jackings in Mexico City"}}
#' \if{latex}{\figure{cdmx_car_jacking-map.png}{options: width=4in}}
#'
#' @source Mexico City Attorney General’s Office
"cdmx_car_jacking"
