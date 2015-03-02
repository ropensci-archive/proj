#' Project points
#'
#' @importFrom jsonlite toJSON
#' @export
#'
#' @param pts A vector or list of points.
#' @param from,to The from and to projection. A character string. If from is left NULL, then it is
#' assumed to be projected from WGS84.
#' @details New lines are stripped out of projection strings to facilitate collapsing them
#' onto multiple lines.
#' @examples
#' pts <- c(-71,41)
#' to = '"+proj=gnom +lat_0=90 +lon_0=0 +x_0=6300000 +y_0=6300000 +ellps=WGS84
#'    +datum=WGS84 +units=m +no_defs"'
#' project(pts, to = to)
project <- function(pts, from = NULL, to){
  if(is.null(from)) {
    ct$eval(sprintf("proj4(%s,%s);", clean_str(to), jsonlite::toJSON(pts)))
  } else {
    ct$eval(sprintf("proj4(%s,%s,%s);", clean_str(from), clean_str(to), jsonlite::toJSON(pts)))
  }
}
