#' converts rgb values to hex notation
#'
#' @param r red value
#' @param g green value
#' @param b blue value
rgb2hex <- function(r,g,b) {
  rgb(r, g, b, maxColorValue = 255)
}


rwth_colors <- c(blue = rgb2hex(0,84,159),
  lightblue = rgb2hex(142,186,229),
  black= rgb2hex(0,0,0),
  magenta = rgb2hex(227,0,102),
  yellow = rgb2hex(255,237,0),
  petrol = rgb2hex(0,97,101),
  turquois = rgb2hex(0,152,161),
  green = rgb2hex(87,171,39),
  maygreen = rgb2hex(189,205,0),
  orange = rgb2hex(246,168,0),
  red = rgb2hex(204,7,30),
  bordeaux = rgb2hex(161,16,53),
  violet = rgb2hex(97,33,88),
  purple = rgb2hex(122,111,172))

#' Function to extract rwth colors as hex codes
#'
#' @param ... Character names of rwth_colors
#'
rwth_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (rwth_colors)

  rwth_colors[cols]
}

rwth_palettes <- list(
  `main`  = rwth_cols("blue", "green", "yellow"),
  `cool`  = rwth_cols("blue", "green"),
  `hot`   = rwth_cols("yellow", "orange", "red"),
  `mixed` = rwth_cols("blue", "green", "yellow", "orange", "red"),
  `grey`  = rwth_cols("light grey", "dark grey"),
  `procon` = rwth_cols("green","light grey","red")
)


#' Return function to interpolate a rwth color palette
#'
#' @param palette Character name of palette in rwth_palette
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
rwth_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- rwth_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}


#' Color scale constructor for rwth colors
#'
#' @param palette Character name of palette in rwth_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_rwth <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- rwth_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("rwth_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for rwth colors
#'
#' @param palette Character name of palette in rwth_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_rwth <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- rwth_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("rwth_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

library(ggplot2)
ggplot2::ggplot(ggplot2::diamonds) + aes(x=carat, y=depth, color=cut) + geom_point() + scale_color_rwth("procon", discrete = T)
