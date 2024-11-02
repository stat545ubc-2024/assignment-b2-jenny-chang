
<!-- README.md is generated from README.Rmd. Please edit that file -->

# countunique

<!-- badges: start -->
<!-- badges: end -->

The goal of countunique is to provide a function that can calculate the
number of unique values in a specified column when grouping by one or
more variables.

## Installation

You can install the development version of countunique from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2024/assignment-b2-jenny-chang", ref = "0.1.0")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(countunique)

data <- data.frame(
   category = c("A", "A", "B", "B", "C"),
   subgroup = c(1, 1, 2, 2, 1),
   value = c(10, 20, 10, NA, 30)
 )

# Count unique values in `value` by `category`
count_unique(data, summ_var = value, category)
#> # A tibble: 3 × 2
#>   category unique_sum
#>   <chr>         <int>
#> 1 A                 2
#> 2 B                 1
#> 3 C                 1

# Count unique values in `value` by both `category` and `subgroup`
count_unique(data, summ_var = value, category, subgroup)
#> # A tibble: 3 × 3
#>   category subgroup unique_sum
#>   <chr>       <dbl>      <int>
#> 1 A               1          2
#> 2 B               2          1
#> 3 C               1          1
```
