# Functions used to calculate the NDVI

calculate_NDVI <- function(x , y) {
	overlay(x, y, fun=ndvOver)
}

ndvOver <- function(x, y) {
	ndvi <- (y - x) / (x + y)
	return(ndvi)
}