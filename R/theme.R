#' The rwththeme
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
rwththeme <- function(...){
  theme_bw(base_size=12, base_family="Helvetica Neue", ...) + theme(
    panel.background  = element_blank(),
    plot.background = element_blank()
    #panel.border = element_rect(size=0.75)
  )
}
