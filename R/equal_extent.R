equal_extent <- function(folder) {
	# Makes two lists of the needed bands of the seperate satellite images
	list_newImage <- list.files(folder, pattern = 'LC.*band[45].tif', full.names = TRUE)
	list_oldImage <- list.files(folder, pattern = 'LT.*band[34].tif', full.names = TRUE)
	# Extracts the path of the cloud mask of both images
	cloudmask_new <- list.files(folder, pattern = glob2rx('LC*cfmask.tif'), full.names = TRUE)
	cloudmask_old <- list.files(folder, pattern = glob2rx('LT*cfmask.tif'), full.names = TRUE)
	
	# Turn into stacks
	stackNew <- stack(c(list_newImage, cloudmask_new))
	stackOld <- stack(c(list_oldImage, cloudmask_old))
	
	# Intersect twice in order to get intersected RasterBricks of both satellite images
	intersect_old <-intersect(stackOld,stackNew)
	intersect_new <-intersect(stackNew,stackOld)
	
	# Return the intersected RasterBricks
	return(list(intersect_old,intersect_new))
}