#' Polish powiat boundaries
#'
#' Boundaries of the 380 powiats (counties) in Poland, including cities with
#' powiat status, from the 2025 archive of the National Register of Boundaries
#' (Panstwowy Rejestr Granic, PRG).
#'
#' @format Simple features (SF) object containing 380 rows and 4 columns:
#' \describe{
#'   \item{jpt_kod_je}{Source TERYT territorial unit code.}
#'   \item{jpt_nazwa}{Powiat name in Polish.}
#'   \item{regon}{Source REGON identifier, stored as text.}
#'   \item{geometry}{Simple features multipolygon representing the powiat boundary.}
#' }
#'
#' Coordinates use ETRS89 (EPSG:4258), in decimal degrees.
#'
#' This dataset is also available as a stand-alone file in GeoPackage format at
#' <https://mpjashby.github.io/crimemappingdata/poland_powiat_boundaries.gpkg>.
#'
#' Licence: the provider permits PRG data to be used free of charge for any
#' purpose. See the source page for the reuse statement. Credit GUGiK/PRG
#' when redistributing this processed extract.
#'
#' @section Map:
#' \if{html}{\figure{poland_powiat_boundaries.png}{options: width="400" alt="Map of Polish powiat boundaries"}}
#' \if{latex}{\figure{poland_powiat_boundaries.png}{options: width=4in}}
#'
#' @source Head Office of Geodesy and Cartography (GUGiK), National Register
#' of Boundaries (PRG), 2025 archive.
#' <https://www.geoportal.gov.pl/pl/dane/panstwowy-rejestr-granic-prg/>.
#' @seealso \code{\link{poland_property_crime_counts}},
#'   \code{\link{poland_population}}
"poland_powiat_boundaries"
