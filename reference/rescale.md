# Rescale Data

Centers and scales columns in a data frame based on the columns in a
second data frame. A column is centered by subtracting the mean and
scaled by dividing by the standard deviation. Columns in `scale` are
automatically added to `center` so they are standardised.

## Usage

``` r
rescale(data, data2 = data, center = character(0), scale = character(0))
```

## Arguments

- data:

  The data frame to center and scale.

- data2:

  A data frame to use for the centering and scaling.

- center:

  A character vector of the columns to center.

- scale:

  A character vector of the columns to scale (after centering).

## Value

The data frame with rescaled columns.

## See also

[`scale`](https://rdrr.io/r/base/scale.html),
[`rescale_f`](https://poissonconsulting.github.io/rescale/reference/rescale_f.md)
and
[`rescale_c`](https://poissonconsulting.github.io/rescale/reference/rescale_c.md)

## Examples

``` r
rescale(datasets::mtcars, scale = "mpg")
#>                             mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> Mazda RX4            0.15088482   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> Mazda RX4 Wag        0.15088482   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#> Datsun 710           0.44954345   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> Hornet 4 Drive       0.21725341   6 258.0 110 3.08 3.215 19.44  1  0    3    1
#> Hornet Sportabout   -0.23073453   8 360.0 175 3.15 3.440 17.02  0  0    3    2
#> Valiant             -0.33028740   6 225.0 105 2.76 3.460 20.22  1  0    3    1
#> Duster 360          -0.96078893   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> Merc 240D            0.71501778   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> Merc 230             0.44954345   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> Merc 280            -0.14777380   6 167.6 123 3.92 3.440 18.30  1  0    4    4
#> Merc 280C           -0.38006384   6 167.6 123 3.92 3.440 18.90  1  0    4    4
#> Merc 450SE          -0.61235388   8 275.8 180 3.07 4.070 17.40  0  0    3    3
#> Merc 450SL          -0.46302456   8 275.8 180 3.07 3.730 17.60  0  0    3    3
#> Merc 450SLC         -0.81145962   8 275.8 180 3.07 3.780 18.00  0  0    3    3
#> Cadillac Fleetwood  -1.60788262   8 472.0 205 2.93 5.250 17.98  0  0    3    4
#> Lincoln Continental -1.60788262   8 460.0 215 3.00 5.424 17.82  0  0    3    4
#> Chrysler Imperial   -0.89442035   8 440.0 230 3.23 5.345 17.42  0  0    3    4
#> Fiat 128             2.04238943   4  78.7  66 4.08 2.200 19.47  1  1    4    1
#> Honda Civic          1.71054652   4  75.7  52 4.93 1.615 18.52  1  1    4    2
#> Toyota Corolla       2.29127162   4  71.1  65 4.22 1.835 19.90  1  1    4    1
#> Toyota Corona        0.23384555   4 120.1  97 3.70 2.465 20.01  1  0    3    1
#> Dodge Challenger    -0.76168319   8 318.0 150 2.76 3.520 16.87  0  0    3    2
#> AMC Javelin         -0.81145962   8 304.0 150 3.15 3.435 17.30  0  0    3    2
#> Camaro Z28          -1.12671039   8 350.0 245 3.73 3.840 15.41  0  0    3    4
#> Pontiac Firebird    -0.14777380   8 400.0 175 3.08 3.845 17.05  0  0    3    2
#> Fiat X1-9            1.19619000   4  79.0  66 4.08 1.935 18.90  1  1    4    1
#> Porsche 914-2        0.98049211   4 120.3  91 4.43 2.140 16.70  0  1    5    2
#> Lotus Europa         1.71054652   4  95.1 113 3.77 1.513 16.90  1  1    5    2
#> Ford Pantera L      -0.71190675   8 351.0 264 4.22 3.170 14.50  0  1    5    4
#> Ferrari Dino        -0.06481307   6 145.0 175 3.62 2.770 15.50  0  1    5    6
#> Maserati Bora       -0.84464392   8 301.0 335 3.54 3.570 14.60  0  1    5    8
#> Volvo 142E           0.21725341   4 121.0 109 4.11 2.780 18.60  1  1    4    2
```
