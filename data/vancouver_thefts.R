delayedAssign("vancouver_thefts", local({
  try(
    readr::read_csv(
      system.file(
        "extdata/vancouver_thefts.csv.gz",
        package = "crimemappingdata"
      ),
      show_col_types = FALSE
    ),
    silent = TRUE
  )
}))
