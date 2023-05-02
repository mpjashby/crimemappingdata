delayedAssign("chicago_aggravated_assaults", local({
  try(
    readr::read_csv(
      system.file(
        "extdata/chicago_aggravated_assaults.csv.gz",
        package = "crimemappingdata"
      ),
      show_col_types = FALSE
    ),
    silent = TRUE
  )
}))
