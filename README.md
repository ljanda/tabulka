
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tabulka()

The goal of tabulka() is to make some nice tables.

## Installation

You can install tabulka from github with:

``` r
# install.packages("devtools")
devtools::install_github("ljanda/tabulka")
```

## Examples

### n\_pct()

The n\_pct() function gives a nicely formatted table for a categorical
variable with the count and percent for each category. The table is
arranged using the percent in descending order so that the biggest
categories are at the top of the table.

``` r
tabulka::n_pct(diamonds, cut)
```

| cut       | Number | Percent |
| :-------- | -----: | ------: |
| Ideal     | 21,551 |   39.95 |
| Premium   | 13,791 |   25.57 |
| Very Good | 12,082 |   22.40 |
| Good      |  4,906 |    9.10 |
| Fair      |  1,610 |    2.98 |

### n\_pct\_fct()

The n\_pct\_fct() function gives a nicely formatted table for a factor
variable with the count and percent for each factor. The table is
arranged using the factor levels so that the preferred order is
maintained.

``` r
tabulka::n_pct_fct(diamonds, cut)
```

| cut       | Number | Percent |
| :-------- | -----: | ------: |
| Fair      |  1,610 |    2.98 |
| Good      |  4,906 |    9.10 |
| Very Good | 12,082 |   22.40 |
| Premium   | 13,791 |   25.57 |
| Ideal     | 21,551 |   39.95 |

### shelve()

The shelve() function gives a nicely formatted table giving the Q1,
Median, Mean, and Q3 for a continous variable that is broken down by
categories from a categorical variable

``` r
tabulka::shelve(diamonds, cut, price)
```

| Group     |       Q1 |  Median |     Mean |       Q3 |    Max |
| :-------- | -------: | ------: | -------: | -------: | -----: |
| Fair      | 2,050.25 | 3,282.0 | 4,358.76 | 5,205.50 | 18,574 |
| Good      | 1,145.00 | 3,050.5 | 3,928.86 | 5,028.00 | 18,788 |
| Very Good |   912.00 | 2,648.0 | 3,981.76 | 5,372.75 | 18,818 |
| Premium   | 1,046.00 | 3,185.0 | 4,584.26 | 6,296.00 | 18,823 |
| Ideal     |   878.00 | 1,810.0 | 3,457.54 | 4,678.50 | 18,806 |
