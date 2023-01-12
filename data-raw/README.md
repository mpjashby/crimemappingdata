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
