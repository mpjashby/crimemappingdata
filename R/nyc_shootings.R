#' Shootings in New York City in 2019
#'
#' Dataset of shootings in New York City recorded by the New York City Police
#' Department (NYPD) in 2019.
#'
#' @format A data frame with 967 rows and six columns:
#' \describe{
#'   \item{incident_key}{Numeric reference number for each incident}
#'   \item{boro}{Borough name}
#'   \item{occur_date}{Date offence occurred}
#'   \item{murder}{Whether the shooting was fatal or not (logical)}
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude}
#' }
#'
#' This dataset is also available as a stand-alone file in CSV format at
#' <https://mpjashby.github.io/crimemappingdata/nyc_shootings.csv>.
#'
#' @source New York City Police Department <https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Historic-/833y-fsy8>
"nyc_shootings"
