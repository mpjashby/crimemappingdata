# Exercise the installed data interface, including former external-file loaders.
# No standalone files, optional plotting packages or network access are needed.
topics <- utils::data(package = "crimemappingdata")$results[, "Item"]
stopifnot(length(topics) > 0L)
for (topic in topics) {
  env <- new.env(parent = baseenv())
  utils::data(list = topic, package = "crimemappingdata", envir = env)
  stopifnot(exists(topic, envir = env, inherits = FALSE))
  object <- env[[topic]]
  stopifnot(!inherits(object, "try-error"), is.data.frame(object), nrow(object) > 0L)
}
