#' Damage to property in Montreal, 2016 to 2025
#'
#' Recorded incidents of damage to property (French: méfait) in the City of
#' Montreal, Quebec, Canada. The source data are displaced in space and time to
#' protect privacy.
#'
#' @format A data frame with 54,040 rows and 5 columns.
#' \describe{
#'   \item{categorie}{Always "méfait"}
#'   \item{date}{Date of offence}
#'   \item{quart}{Whether the crime occurred in the daytime (jour), evening (soir) or at night (nuit)}
#'   \item{x}{Easting in EPSG:2950, metres}
#'   \item{y}{Northing in EPSG:2950, metres}
#' }
#'
#' This dataset is also available as a stand-alone file in gzipped CSV format at
#' <https://mpjashby.github.io/crimemappingdata/montreal_mefait.csv.gz>.
#'
#' Licence: CC BY 4.0 <https://creativecommons.org/licenses/by/4.0/>.
#'
#' @section Map:
#' \if{html}{\figure{montreal_mefait-map.png}{options: width="400" alt="Damage to property in Montreal, 2016 to 2025"}}
#' \if{latex}{\figure{montreal_mefait-map.png}{options: width=4in}}
#'
#' @source: Service de police de la Ville de Montreal
#' <https://donnees.montreal.ca/dataset/actes-criminels>.
"montreal_mefait"
