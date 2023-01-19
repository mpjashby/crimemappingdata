#' Crimes in London in 2021
#'
#' Dataset of crimes recorded by police in London in 2021. Includes some crimes
#' that occurred outside London but were recorded by police forces in London, to
#' provide an opportunity to remove rows from datasets based on location.
#'
#' @format A data frame containing 1,076,832 rows and 7 columns:
#' \describe{
#'   \item{month}{Month in which crime occurred}
#'   \item{type}{Offence type}
#'   \item{location}{Name of street or other location}
#'   \item{lsoa}{Lower-layer super output area code}
#'   \item{borough}{Borough name}
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude}
#' }
#'
#' This dataset is also available as a stand-alone file in gzipped CSV format at
#' <https://mpjashby.github.io/crimemappingdata/london_crimes_2021.csv.gz>.
#'
#' @source Home Office <https://data.police.uk/>
"london_crimes_2021"
