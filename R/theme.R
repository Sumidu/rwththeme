#' The rwththeme
#'
#' @param ... additional parameters
#'
#' @return the theme object
#' @export
#'
### @examples
rwththeme <- function(...){
  ggplot2::theme_bw(base_size=14, base_family="Helvetica Neue", ...) + ggplot2::theme(
    panel.background  = ggplot2::element_blank(),
    plot.background = ggplot2::element_blank()
    #panel.border = element_rect(size=0.75)
  )
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage("RWTH Theme set")
  #set default theme
  ggplot2::theme_set(rwththeme())
}
