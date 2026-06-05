# Rescale Transformed Data

Rescales transformed columns in a data frame based on the transformed
columns in a second data frame. The columns are rescaled by subtracting
values and then dividing by values.

## Usage

``` r
rescale_c(data, data2 = data, colnames = character(0))
```

## Arguments

- data:

  The data frame to rescale.

- data2:

  A data frame to use for the rescaling.

- colnames:

  A character vector of column names to transform and/or rescale.

## Value

The data frame with transformed and rescaled columns.

## Details

The column names can include a single function for the transform as well
as the following suffices: + (subtract mean), - (subtract min),
=(subtract min and add 1), / (divide by sd) and \* (subtract mean and
divide by sd).

## See also

[`rescale`](https://poissonconsulting.github.io/rescale/reference/rescale.md)
