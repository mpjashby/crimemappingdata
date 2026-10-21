# Generate the static maps embedded in dataset help pages and the pkgdown site.
# Run from the package root: Rscript data-raw/dataset_maps.R
# Requires sf, sfhotspot and ggplot2, plus readr for CSV-backed datasets.
# These are development tools; generating maps is not part of package checking
# or website building. Base-map tiles require an internet connection.
# Optional dataset names restrict regeneration, e.g.:
# Rscript data-raw/dataset_maps.R bronx_shootings nyc_precincts

# Read the source-tree data, including data/*.R loaders, without requiring an
# installed copy of the package. Keep path resolution local to these loaders.
load_map_data <- function(name) {
  env <- new.env(parent = globalenv())
  env$system.file <- function(..., package) {
    stopifnot(identical(package, "crimemappingdata"))
    file.path(getwd(), "inst", ...)
  }
  rda <- file.path("data", paste0(name, ".rda"))
  if (file.exists(rda)) {
    load(rda, envir = env)
  } else {
    sys.source(file.path("data", paste0(name, ".R")), envir = env)
  }
  object <- env[[name]]
  # The existing Medellin loader refers to a missing GPKG and its RDA contains
  # a try-error. Use the distributed shapefile for this preview instead.
  if (name == "medellin_metro_lines" && inherits(object, "try-error")) {
    object <- sf::read_sf("/vsizip/inst/extdata/medellin_metro_lines.zip")
  }
  if (inherits(object, "try-error")) stop(name, ": ", object)
  object
}

map_features <- function(object, name) {
  if (!inherits(object, "sf")) {
    if (all(c("longitude", "latitude") %in% names(object))) {
      coords <- c("longitude", "latitude")
      crs <- 4326
    } else if (all(c("longitud", "latitud") %in% names(object))) {
      coords <- c("longitud", "latitud")
      crs <- 4326
    } else if (name == "hungerford_shootings") {
      coords <- c("easting", "northing")
      crs <- 27700
    } else if (name == "vancouver_thefts") {
      coords <- c("X", "Y")
      crs <- 32610
    } else if (name %in% c("medellin_metro_stns", "montreal_mefait")) {
      coords <- c("x", "y")
      crs <- if (name == "montreal_mefait") 2950 else 4326
    } else {
      return(NULL) # Counts and population tables have no geometry to plot.
    }
    keep <- is.finite(object[[coords[1]]]) & is.finite(object[[coords[2]]])
    # Vancouver uses (0, 0) for incidents without a mapped location.
    if (name == "vancouver_thefts") {
      keep <- keep & object$X != 0 & object$Y != 0
    }
    if (any(!keep)) message(name, ": omitting ", sum(!keep), " unmapped rows")
    object <- sf::st_as_sf(object[keep, ], coords = coords, crs = crs)
  }
  object <- object[!sf::st_is_empty(object), ]
  if (!nrow(object)) stop(name, ": no mapped features")
  # Mexico City uses POINT (0 0) for incidents without a mapped location.
  if (name == "cdmx_car_jacking") {
    xy <- sf::st_coordinates(sf::st_transform(object, 4326))
    keep <- !(xy[, 1] == 0 & xy[, 2] == 0)
    if (any(!keep)) message(name, ": omitting ", sum(!keep), " unmapped rows")
    object <- object[keep, ]
  }
  # A common map projection also gives consistent base-map rendering.
  sf::st_transform(object, 3857)
}

render_dataset_maps <- function(datasets = character()) {
  topics <- sub("[.]R$", "", list.files("R", pattern = "[.]R$"))
  if (length(datasets)) {
    stopifnot(all(datasets %in% topics))
    topics <- datasets
  }
  dir.create("man/figures", recursive = TRUE, showWarnings = FALSE)
  mapped <- character()
  for (name in topics) {
    object <- map_features(load_map_data(name), name)
    if (is.null(object)) next
    message("Mapping ", name)
    points <- all(sf::st_geometry_type(object) %in% c("POINT", "MULTIPOINT"))
    plot <- sfhotspot::hotspot_map(
      object, colour = "red2", fill = NA, basemap_type = "cartolight",
      # Small symbols keep dense incident datasets legible.
      size = if (points) 0.6 else 0.3
    )
    # Render before replacing an existing image, so a failed tile download
    # cannot leave an incomplete map in the documentation.
    output <- file.path("man/figures", paste0(name, "-map.png"))
    temporary <- tempfile(fileext = ".png")
    # Match the canvas to the mapped extent so portrait maps do not have
    # large white side margins when displayed at the page width. Allow a
    # little extra height for attribution, and bound unusually thin extents.
    bounds <- sf::st_bbox(object)
    aspect <- unname((bounds["ymax"] - bounds["ymin"]) /
                       (bounds["xmax"] - bounds["xmin"]))
    height <- max(3, min(9, 7 * aspect + 0.25))
    ggplot2::ggsave(
      temporary,
      plot = plot, width = 7, height = height, dpi = 150, bg = "white"
    )
    file.copy(temporary, output, overwrite = TRUE)
    unlink(temporary)
    mapped <- c(mapped, name)
  }
  invisible(mapped)
}

if (sys.nframe() == 0L) render_dataset_maps(commandArgs(trailingOnly = TRUE))
