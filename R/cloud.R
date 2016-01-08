# Functions used to extract the cloud mask from the brick and substract it from the satellite images

cloud_mask <- function(list_bricks, index_fMask) {
	fmask_old <- list_bricks[[1]][[index_fMask]]
	fmask_new <- list_bricks[[2]][[index_fMask]]
	
	OldCloudFree <- overlay(x = list_bricks[[1]], y = fmask_old, fun = cloud2NA, filename = "output/OldCloudFree.grd", overwrite = TRUE)
	NewCloudFree <- overlay(x = list_bricks[[2]], y = fmask_new, fun = cloud2NA, filename = "output/NewCloudFree.grd", overwrite = TRUE)
}

cloud2NA <- function(x, y){
	x[y != 0] <- NA
	return(x)
}