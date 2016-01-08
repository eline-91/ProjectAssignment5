equal_extent <- function() {
	# Makes two lists of the subimages of the seperate satellite images
	list_newImage <- list.files('data', pattern = glob2rx('LC*.tif'), full.names = TRUE)
	list_oldImage <- list.files('data', pattern = glob2rx('LT*.tif'), full.names = TRUE)
	
	# Turn both lists into stacks
	stackNew <- stack(list_newImage)
	stackOld <- stack(list_oldImage)
	
	# Intersect twice in order to get intersected RasterBricks of both satellite images
	intersect_old <-intersect(stackOld,stackNew)
	intersect_new <-intersect(stackNew,stackOld)
	
	# Return the intersected RasterBricks
	return(list(intersect_old,intersect_new))
}