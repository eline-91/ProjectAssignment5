cloud_mask <- function(list_bricks) {
	fmask_old <- list_bricks[[1]][[1]]
	fmask_new <- list_bricks[[2]][[1]]
	
	OldCloudFree <- overlay(x = list_bricks[[1]], y = fmask_old, fun = cloud2NA, filename = "output/OldCloudFree.grd")
	NewCloudFree <- overlay(x = list_bricks[[2]], y = fmask_new, fun = cloud2NA, filename = "output/NewCloudFree.grd")
}

cloud2NA <- function(x, y){
	x[y != 0] <- NA
	return(x)
}