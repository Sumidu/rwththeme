RWTH Theme
================

The goal of rwththeme is to have a unified look and feel in ggplot2 plots.

Installation
------------

You can install the released version of rwththeme github with

``` r
install.packages("devtools")
devtools::install_github("sumidu/rwththeme")
```

Example
-------

Using the theme is as simple as attaching the package.

``` r
# Using ggplot2 as a plotting library
library(ggplot2)
library(rwththeme)
ggplot(diamonds) + aes(carat,depth) + geom_point()
```

<img src="README_files/figure-markdown_github/example1-1.png" width="672" />
