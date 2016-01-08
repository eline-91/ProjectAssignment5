# Geetika Rathee & Eline van Elburg
# 8th of January 2016
# Assignment 5

library(raster)
library(rgdal)

# Code to download and unpack the necessary datafiles into the 'data' folder of the project.
# !! This code only needs to be run once !!
source('R/download_untar_files.R')
download_untar()

# Make the intersection so that both extents will be equal
source('R/equal_extent.R')
folder = 'data'
list_bricks <- equal_extent(folder)

# Substract the clouds from the satellite images
source('R/cloud.R')
index_fMask = 3
cloud_mask(list_bricks, index_fMask)

# Plot an example of an image with the clouds removed
plot(brick("output/NewCloudFree.grd")[[1]])

# Calculating NDVI of both images seperately
source('R/calculate_NDVI.R')
# Get the bricks from the output folder
OldCloudFree <- brick("output/OldCloudFree.grd")
NewCloudFree <- brick("output/NewCloudFree.grd")

# Put the RED and NIR band into a list, so that we can put it directly into the function
bandListOld <- list(OldCloudFree[[1]], OldCloudFree[[2]])
bandListNew <- list(NewCloudFree[[1]],NewCloudFree[[2]])

# Calculate NDVI for both images
NDVI_OldImage <- calculate_NDVI(bandListOld[[1]], bandListOld[[2]])
NDVI_NewImage <- calculate_NDVI(bandListNew[[1]], bandListNew[[2]])
plot(NDVI_OldImage, main="NDVI of the old satellite image")
plot(NDVI_NewImage, main="NDVI of the new satellite image")

# Calculate the change in NDVI
NDVI_difference = NDVI_NewImage - NDVI_OldImage
plot(NDVI_difference, main = "The differences in NDVI between the old and new satellite images")
