#' Change Radian to degree
#'
#' @param x is angle
#' @return the radian conversion value of x
#' @examples sin(by_ange(90))
#' @export
by_angle<-function(x)
  {package('pracma')
    x*pi/180}


by_rad<-function(x)
{package('pracma')
  x*180/pi}

