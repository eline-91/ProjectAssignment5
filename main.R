# Geetika Rathee & Eline van Elburg
# 8th of January 2016
# Assignment 5

library(raster)
library(rgdal)

# Code to download and unpack the necessary datafiles into the 'data' folder of the project.
# !! This code only needs to be run once !!
source('R/download_untar_files.R')
download_untar()

######### ASK ABOUT DATE OF ACQUISITION OF LANDSAT IMAGES #########

source('R/equal_extent.R')
list_bricks <- equal_extent()

source('R/cloud.R')
cloud_mask(list_bricks)

# Plot an example of an image with the clouds removed
plot(brick("output/NewCloudFree.grd")[[5]])

source('R/calculate_NDVI.R')
OldCloudFree <- brick("output/OldCloudFree.grd")
NewCloudFree <- brick("output/NewCloudFree.grd")

bandListOld <- list(OldCloudFree[[4]], OldCloudFree[[5]])
bandListNew <- list(NewCloudFree[[7]],NewCloudFree[[8]])

NDVI_OldImage <- calculate_NDVI(bandListOld[1], bandListOld[2])
NDVI_NewImage <- calculate_NDVI(bandListNew[1], bandListNew[2])