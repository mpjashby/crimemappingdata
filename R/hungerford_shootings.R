#' Shootings in the Hungerford Massacre
#'
#' Dataset of the locations of each shooting during the massacre that took place
#' in Hungerford, England, on 19 August 1987. Each row represents a location at
#' which one or more people were shot by the gun-man.
#'
#' @format A data frame with 16 rows and 4 columns:
#' \describe{
#'   \item{victims}{The names of the victims shot at this location, marked with
#'     a dagger symbol (†) if the victim was killed}
#'   \item{order}{The order in which the locations happened in time}
#'   \item{easting}{British National Grid easting co-ordinate}
#'   \item{northing}{British National Grid northing co-ordinate}
#' }
#'
#' This dataset is also available as a stand-alone file in CSV format at
#' <https://mpjashby.github.io/crimemappingdata/hungerford_shootings.csv>.
#'
#' Licence: Open Government Licence
#'
#'
#' @source Official report into the massacre
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   map_data <- sf::st_as_sf(
#'     hungerford_shootings,
#'     coords = c("easting", "northing"),
#'     crs = "EPSG:27700"
#'   )
#'
#'   sfhotspot::hotspot_map(
#'     map_data,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     size = 0.6
#'   )
#' }
"hungerford_shootings"
