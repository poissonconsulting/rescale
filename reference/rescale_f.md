# Rescale Transformed Data

Rescales transformed columns in a data frame based on the transformed
columns in a second data frame. The columns are rescaled by subtracting
values and then dividing by values.

## Usage

``` r
rescale_f(
  data,
  data2 = data,
  transform = list(),
  subtract = list(),
  divide_by = list()
)
```

## Arguments

- data:

  The data frame to rescale.

- data2:

  A data frame to use for the rescaling.

- transform:

  A named list where the name(s) indicate the function(s) to use for the
  transformations and the elements indicate the columns to transform.

- subtract:

  A named list where the name(s) indicate the function(s) to use when
  determining the value to subtract and the elements indicate the
  columns.

- divide_by:

  A named list where the name(s) indicate the function(s) to use when
  determining the value to divide by and the elements indicate the
  columns.

## Value

The data frame with transformed and rescaled columns.

## See also

[`rescale`](https://poissonconsulting.github.io/rescale/reference/rescale.md)

## Examples

``` r
rescale_f(datasets::mtcars,
  transform = list(log = "mpg"),
  subtract = list(mean = c("mpg", "disp"), min = "gear"),
  divide_by = list(sd = c("mpg", "hp"))
)
#>                              mpg cyl        disp        hp drat    wt  qsec vs
#> Mazda RX4            0.292195651   6  -70.721875 1.6043669 3.90 2.620 16.46  0
#> Mazda RX4 Wag        0.292195651   6  -70.721875 1.6043669 3.90 2.875 17.02  0
#> Datsun 710           0.568372564   4 -122.721875 1.3564193 3.85 2.320 18.61  1
#> Hornet 4 Drive       0.355560927   6   27.278125 1.6043669 3.08 3.215 19.44  1
#> Hornet Sportabout   -0.097358857   8  129.278125 2.5524020 3.15 3.440 17.02  0
#> Valiant             -0.206877039   6   -5.721875 1.5314412 2.76 3.460 20.22  1
#> Duster 360          -0.998259062   8  129.278125 3.5733627 3.21 3.570 15.84  0
#> Merc 240D            0.796138474   4  -84.021875 0.9042796 3.69 3.190 20.00  1
#> Merc 230             0.568372564   4  -89.921875 1.3855896 3.92 3.150 22.90  1
#> Merc 280            -0.008745273   6  -63.121875 1.7939739 3.92 3.440 18.30  1
#> Merc 280C           -0.263005253   6  -63.121875 1.7939739 3.92 3.440 18.90  1
#> Merc 450SE          -0.538104246   8   45.078125 2.6253277 3.07 4.070 17.40  0
#> Merc 450SL          -0.358688647   8   45.078125 2.6253277 3.07 3.730 17.60  0
#> Merc 450SLC         -0.793284675   8   45.078125 2.6253277 3.07 3.780 18.00  0
#> Cadillac Fleetwood  -2.067709478   8  241.278125 2.9899566 2.93 5.250 17.98  0
#> Lincoln Continental -2.067709478   8  229.278125 3.1358081 3.00 5.424 17.82  0
#> Chrysler Imperial   -0.905611533   8  209.278125 3.3545854 3.23 5.345 17.42  0
#> Fiat 128             1.748458018   4 -152.021875 0.9626202 4.08 2.200 19.47  1
#> Honda Civic          1.534483750   4 -155.021875 0.7584280 4.93 1.615 18.52  1
#> Toyota Corolla       1.900441418   4 -159.621875 0.9480350 4.22 1.835 19.90  1
#> Toyota Corona        0.371217179   4 -110.621875 1.4147599 3.70 2.465 20.01  1
#> Dodge Challenger    -0.727648840   8   87.278125 2.1877731 2.76 3.520 16.87  0
#> AMC Javelin         -0.793284675   8   73.278125 2.1877731 3.15 3.435 17.30  0
#> Camaro Z28          -1.241717804   8  119.278125 3.5733627 3.73 3.840 15.41  0
#> Pontiac Firebird    -0.008745273   8  169.278125 2.5524020 3.08 3.845 17.05  0
#> Fiat X1-9            1.173283056   4 -151.721875 0.9626202 4.08 1.935 18.90  1
#> Porsche 914-2        1.009433001   4 -110.421875 1.3272490 4.43 2.140 16.70  0
#> Lotus Europa         1.534483750   4 -135.621875 1.6481224 3.77 1.513 16.90  1
#> Ford Pantera L      -0.663271279   8  120.278125 3.8504807 4.22 3.170 14.50  0
#> Ferrari Dino         0.077590072   6  -85.721875 2.5524020 3.62 2.770 15.50  0
#> Maserati Bora       -0.837765589   8   70.278125 4.8860266 3.54 3.570 14.60  0
#> Volvo 142E           0.355560927   4 -109.721875 1.5897818 4.11 2.780 18.60  1
#>                     am gear carb
#> Mazda RX4            1    1    4
#> Mazda RX4 Wag        1    1    4
#> Datsun 710           1    1    1
#> Hornet 4 Drive       0    0    1
#> Hornet Sportabout    0    0    2
#> Valiant              0    0    1
#> Duster 360           0    0    4
#> Merc 240D            0    1    2
#> Merc 230             0    1    2
#> Merc 280             0    1    4
#> Merc 280C            0    1    4
#> Merc 450SE           0    0    3
#> Merc 450SL           0    0    3
#> Merc 450SLC          0    0    3
#> Cadillac Fleetwood   0    0    4
#> Lincoln Continental  0    0    4
#> Chrysler Imperial    0    0    4
#> Fiat 128             1    1    1
#> Honda Civic          1    1    2
#> Toyota Corolla       1    1    1
#> Toyota Corona        0    0    1
#> Dodge Challenger     0    0    2
#> AMC Javelin          0    0    2
#> Camaro Z28           0    0    4
#> Pontiac Firebird     0    0    2
#> Fiat X1-9            1    1    1
#> Porsche 914-2        1    2    2
#> Lotus Europa         1    2    2
#> Ford Pantera L       1    2    4
#> Ferrari Dino         1    2    6
#> Maserati Bora        1    2    8
#> Volvo 142E           1    1    2
```
