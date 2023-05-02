delayedAssign("london_crimes", local({
  try(
    readr::read_csv(
      system.file("extdata/london_crimes.zip", package = "crimemappingdata"),
      show_col_types = FALSE
    ),
    silent = TRUE
  )
}))
