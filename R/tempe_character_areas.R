#' Character Area boundaries in Tempe, Arizona
#'
#' Dataset showing the boundaries of groups of neighbourhoods that "contain
#' common design, land use and commercial characteristics".
#'
#' @format An SF object containing 8 rows and 3 columns:
#' \describe{
#'   \item{area_number}{Numeric identifier for each area}
#'   \item{area_name}{Name of each area}
#'   \item{geometry}{SF polygon geometry of each area}
#' }
#'
#' A version of this dataset is also available in Geography Markup Language
#' (GML) format as a stand-alone file at
#' <https://mpjashby.github.io/crimemappingdata/tempe_character_areas.gml>.
#'
#' Licence: Creative Commons Attribution (CC-BY)
#'
#'
#' @source Open Tempe
#'
#' @seealso
#' \code{\link{tempe_opioid_calls}}: Calls to opioid overdoses in Tempe, Arizona.
#'
#' @examples
#' # Basemap tiles require internet access unless already cached.
#' if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {
#'   sfhotspot::hotspot_map(
#'     tempe_character_areas,
#'     basemap_type = "cartolight",
#'     colour = "red2",
#'     fill = NA,
#'     size = 0.3
#'   )
#' }
"tempe_character_areas"
