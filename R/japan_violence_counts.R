#' Counts of violent crime in Japan, 2012
#'
#' Dataset of counts of homicides, rapes, robberies and total violent crimes in
#' each prefecture in Japan in 2012, together with GDP per capita and
#' population.
#'
#' @format Data frame of 300 rows and 3 columns:
#' \describe{
#'   \item{prefecture}{Prefecture name}
#'   \item{measure}{Type of data}
#'   \item{value}{Numeric value}
#' }
#'
#' The values of \code{measure} are "number of homicides",
#' "number of robberies", "number of rapes", "number of violent crimes",
#' "GDP per capita (¥1000)", "population (thousands)".
#'
#' This dataset is also available as a stand-alone file in \code{.rds} format at
#' <https://mpjashby.github.io/crimemappingdata/japan_violence_counts.rds>.
#'
#' Licence: Creative Commons Attribution
#'
#' @source Statistics Bureau of Japan
"japan_violence_counts"
