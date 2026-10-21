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

Run `Rscript data-raw/dataset_maps.R` from the package root to regenerate
the maps in `man/figures/`. Install `sf`, `sfhotspot`, `ggplot2` and `readr`
first. Generating the maps requires internet access for base-map tiles.
To regenerate selected maps, append dataset names to the command.
Maps use `red2` features on a `cartolight` base map, with no polygon fill.
The canvas follows each dataset's extent to reduce white margins.
The figure markup displays maps at 400 pixels wide in HTML help and four
inches wide in PDF manuals. `pkgdown/extra.css` overrides the HTML width
on the website so maps fill the content column.

The script maps documented spatial datasets and tables with coordinates,
using the coordinate reference systems specified in their documentation.
Rows with missing coordinates or known zero-coordinate placeholders are
omitted from the previews; the datasets themselves are unchanged.
Tables containing only area counts or populations are skipped.

After adding or changing map links in `R/`, run `devtools::document()`.
The saved images are embedded in the help pages and copied by pkgdown,
so ordinary documentation and website builds do not need tile downloads.
