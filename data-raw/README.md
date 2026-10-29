# Scripts for creating crime data

This directory contains scripts for creating datasets for use in crime mapping.

Each script should load data from the original source and output:

1.  data files in the file formats required for the relevant tutorial, *and*
2.  data files in `.Rda` format that reflect the dataset that would be loaded
    into the tutorial.

This means that if the function that loads the data in the tutorial only loads
some of the data (e.g. loading a single sheet from an Excel file), the `.Rda`
file should represent the data *as loaded*. The `.Rda` file should be created
using `usethis::use_data()`.

If the raw data cannot be downloaded directly in the script, e.g. because it is
only available via web form, the downloaded data should be stored in the `raw/`
subdirectory of this directory. Instructions for downloading the data should be
included as a comment in any script file that uses that data.

## Dataset preview maps

Each spatial dataset has a runnable map example in its roxygen documentation.
Run `Rscript data-raw/dataset_maps.R` from the package root to synchronise these
examples after adding a spatial dataset, then run `devtools::document()`.
Dataset names may be appended to update only selected examples.

Examples use `sfhotspot::hotspot_map()` with `red2` features, no polygon fill,
`cartolight` basemaps, and sizes of 0.6 for points and 0.3 for other geometries.
Examples use each dataset's known geometry and coordinate columns, with CRS
identifiers written as "EPSG:nnnn". Only Cincinnati and Medellin homicides need
missing-coordinate filtering; Mexico City car jackings exclude known (0, 0)
placeholders. Basemap reprojection is handled by sfhotspot itself.

Examples run interactively, or when pkgdown sets `IN_PKGDOWN=true`. They skip
ordinary package checks and never run during package installation. Basemap tiles
require internet access unless cached. Install the suggested `sfhotspot` package
before running them. Rebuild the website with `pkgdown::build_site()`; generated
images belong to `docs/`, not `man/figures/`. Keep the README overview image in
`man/figures/`.

## Package and stand-alone distributions

Always generate both the teaching-format stand-alone export in `inst/extdata/`
and a matching R object in `data/`. Save the latter with
`usethis::use_data(..., overwrite = TRUE, compress = "xz")`; never add runtime
loaders under `data/`. The package uses xz lazy-data compression as well.

`inst/extdata/` is excluded from R builds and direct installations, but remains
in Git checkouts for the existing GitHub Pages download workflow. Git archive
exclusions in `.gitattributes` also prevent these exports and development files
being downloaded by `install_github()`.

Validate releases from a built source tarball, not just `load_all()`. Check all
datasets load in a fresh installation without `extdata/`, and render reference
examples separately with pkgdown to verify the maps.
