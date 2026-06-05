# Get Rescaler Colnames

Get Rescaler Colnames

## Usage

``` r
get_rescaler_colnames(x)
```

## Arguments

- x:

  A character vector.

## Value

A character vector of the rescaler column names.

## Examples

``` r
get_rescaler_colnames(c("log(mean)*", "sqrt(cc)="))
#> [1] "mean" "cc"  
```
