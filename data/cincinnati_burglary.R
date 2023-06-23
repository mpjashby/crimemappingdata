delayedAssign("cincinnati_burglary", local({
  try(
    readr::read_csv(
      system.file(
        "extdata/cincinnati_burglary.csv.gz",
        package = "crimemappingdata"
      ),
      show_col_types = FALSE
    ),
    silent = TRUE
  )
}))
