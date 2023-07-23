#' Count of violence in German states
#'
#' Datasets of counts of homicides, rapes and robberies in each state in Germany
#' in 2019, together with GDP per capita and population.
#'
#' @format Data frame of 80 rows and 3 columns:
#' \describe{
#'   \item{state}{State name}
#'   \item{measure}{Type of data}
#'   \item{count}{Numeric value}
#' }
#' The values of \code{measure} are "number of homicides",
#' "number of rapes", "number of robberies", "GDP per capita (€1000)" and
#' "population".
#'
#' This dataset is also available as a stand-alone file in \code{.rds} format at
#' <https://mpjashby.github.io/crimemappingdata/germany_violence_counts.rds>.
#'
#' Licence: Datenlizenz Deutschland - Namensnennung (Data Licence Germany -
#' Attribution)
#'
#' @source German Federal Criminal Police Office
"germany_violence_counts"
