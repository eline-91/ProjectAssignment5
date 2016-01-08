download_untar <- function() {
	
	setwd('data')
	# Download first dataset
	download.file(url='https://www.dropbox.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz?dl=0', destfile='LC81970242014109-SC20141230042441.tar.gz', method='wget')
	# Untar first dataset
	untar('LC81970242014109-SC20141230042441.tar.gz')
	
	# Download second dataset
	download.file(url='https://www.dropbox.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz?dl=0', destfile='LT51980241990098-SC20150107121947.tar.gz', method='wget')
	# Untar second dataset
	untar('LT51980241990098-SC20150107121947.tar.gz')
	
	# Move back up one folder
	setwd('..')

}