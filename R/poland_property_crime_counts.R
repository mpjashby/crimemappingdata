#' Property offences in Polish powiats, 2022–2024
#'
#' Counts of property offences ascertained by the police in completed
#' preparatory proceedings in each powiat (county) in Poland from 2022 to 2024.
#'
#' @format Data frame containing 1,140 rows and 5 columns:
#' \describe{
#'   \item{kod_bdl}{Twelve-character BDL territorial unit identifier.}
#'   \item{kod_teryt}{Four-character TERYT powiat code, stored as text to
#'     preserve leading zeroes.}
#'   \item{nazwa}{Powiat name in Polish, including cities with powiat status.}
#'   \item{rok}{Year of observation: 2022, 2023 or 2024.}
#'   \item{przestepstwa_przeciwko_mieniu}{Number of property offences.}
#' }
#'
#' @details
#' Each row represents one powiat in one year.
#'
#' This dataset is also available as a stand-alone file in Excel format at
#' <https://mpjashby.github.io/crimemappingdata/poland_property_crime_counts.xlsx>.
#'
#' Licence: Creative Commons Attribution 4.0 International (CC BY 4.0)
#' <https://creativecommons.org/licenses/by/4.0/>.
#'
#' @source Statistics Poland, Bank Danych Lokalnych (Local Data Bank).
#' <https://api.stat.gov.pl/home/bdlapi>.
#' @seealso
#' \code{\link{poland_population}}: Population of Polish powiats, 2022–2024.
#' \code{\link{poland_powiat_boundaries}}: Polish powiat boundaries.
"poland_property_crime_counts"
