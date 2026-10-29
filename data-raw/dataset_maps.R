# Synchronise dataset-map examples in the roxygen documentation.
# Run from the package root after adding a spatial dataset:
# Rscript data-raw/dataset_maps.R [dataset names ...]
# This writes code only: tiles are fetched when examples run interactively or
# during pkgdown builds, never during ordinary installation or package checks.

map_example <- function(name, object) {
  code <- c(
    '# Basemap tiles require internet access unless already cached.',
    'if (interactive() || identical(Sys.getenv("IN_PKGDOWN"), "true")) {'
  )
  add <- function(lines) code <<- c(code, ifelse(nzchar(lines), paste0('  ', lines), ''))
  input <- name
  if (inherits(object, 'sf')) {
    # Determine styling while generating documentation, not in each example.
    types <- as.character(unique(sf::st_geometry_type(object)))
    size <- if (all(types %in% c('POINT', 'MULTIPOINT'))) 0.6 else 0.3
    polygons <- any(types %in% c('POLYGON', 'MULTIPOLYGON'))
    if (name == 'cdmx_car_jacking') {
      add(c(
        '# Exclude the known zero-coordinate placeholders.',
        'xy <- sf::st_coordinates(cdmx_car_jacking)',
        'map_data <- cdmx_car_jacking[xy[, 1] != 0 | xy[, 2] != 0, ]'
      ))
      input <- 'map_data'
    }
  } else {
    size <- 0.6
    polygons <- FALSE
    if (all(c('longitude', 'latitude') %in% names(object))) {
      coords <- c('longitude', 'latitude'); crs <- 'EPSG:4326'
    } else if (all(c('longitud', 'latitud') %in% names(object))) {
      coords <- c('longitud', 'latitud'); crs <- 'EPSG:4326'
    } else if (name == 'hungerford_shootings') {
      coords <- c('easting', 'northing'); crs <- 'EPSG:27700'
    } else if (name == 'vancouver_thefts') {
      coords <- c('X', 'Y'); crs <- 'EPSG:32610'
    } else if (name %in% c('medellin_metro_stns', 'montreal_mefait')) {
      coords <- c('x', 'y')
      crs <- if (name == 'montreal_mefait') 'EPSG:2950' else 'EPSG:4326'
    } else return(NULL)
    if (name %in% c('cincinnati_burglary', 'medellin_homicides')) {
      add(c(
        '# Some incidents have no recorded coordinates.',
        paste0('map_data <- subset(', name, ', !is.na(', coords[1], ') & !is.na(', coords[2], '))')
      ))
      input <- 'map_data'
    }
    add(c(
      'map_data <- sf::st_as_sf(',
      paste0('  ', input, ','),
      paste0('  coords = c("', coords[1], '", "', coords[2], '"),'),
      paste0('  crs = "', crs, '"'),
      ')',
      ''
    ))
    input <- 'map_data'
  }
  add(c(
    'sfhotspot::hotspot_map(',
    paste0('  ', input, ','),
    '  basemap_type = "cartolight",',
    '  colour = "red2",',
    if (polygons) '  fill = NA,',
    paste0('  size = ', size),
    ')'
  ))
  c(code, '}')
}

update_map_examples <- function(datasets = character()) {
  topics <- sub('[.]rda$', '', list.files('data', pattern = '[.]rda$'))
  if (length(datasets)) {
    stopifnot(all(datasets %in% topics))
    topics <- datasets
  }
  for (name in topics) {
    env <- new.env(parent = emptyenv())
    load(file.path('data', paste0(name, '.rda')), envir = env)
    code <- map_example(name, env[[name]])
    if (is.null(code)) next
    path <- file.path('R', paste0(name, '.R'))
    text <- readLines(path)
    while (length(text) && !nzchar(trimws(tail(text, 1L)))) text <- head(text, -1L)
    # Replace just our generated examples on repeated runs.
    start <- match("#' @examples", text)
    if (!is.na(start) && start < length(text) &&
        text[start + 1L] == "#' # Basemap tiles require internet access unless already cached.") {
      text <- text[seq_len(start - 1L)]
      text <- c(text, paste0('"', name, '"'))
    }
    # Remove the old embedded-map section without touching other sections.
    text <- text[!grepl("^#' (@section Map:|\\\\if\\{(html|latex)\\}\\{\\\\figure\\{.*-map[.]png)", text)]
    # Keep exactly one blank roxygen line before the generated block.
    marker <- tail(text, 1L)
    text <- head(text, -1L)
    while (length(text) && tail(text, 1L) %in% c("#'", "#' ")) text <- head(text, -1L)
    text <- c(text, marker)
    last <- length(text)
    stopifnot(text[last] %in% c(paste0('"', name, '"'), paste0("'", name, "'")))
    text <- append(text, c("#'", "#' @examples", ifelse(nzchar(code), paste0("#' ", code), "#'")), after = last - 1L)
    writeLines(text, path)
  }
}

if (sys.nframe() == 0L) update_map_examples(commandArgs(trailingOnly = TRUE))
