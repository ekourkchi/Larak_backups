#!/usr/bin/csh

# NOTE ***** This Script used for STANDARD images.
#  argv[1] is the image used for detection
#  argv[2] is the image used for measurment
#  argv[3] is the weight image
setenv ID0 $argv[1]
setenv ID $argv[2]

setenv weight $argv[3]
setenv weight ${weight}'.fits'
setenv check ${ID}'.segment.fits'


sex ${ID0}'.fits',${ID}'.fits' -c ../../vip/default.sex \
-CATALOG_NAME $ID'.cat' \
-CATALOG_TYPE	ASCII_HEAD \
-STARNNW_NAME	../../vip/default.nnw \
-PARAMETERS_NAME default.param	\
-FILTER Y   \
-FILTER_NAME	../../vip/gauss_4.0_7x7.conv \
-CHECKIMAGE_TYPE SEGMENTATION  \
-CHECKIMAGE_NAME	${check} \
-BACK_SIZE        256     \
-DETECT_THRESH	1.0   \
-ANALYSIS_THRESH   1.0 \
-MAG_ZEROPOINT 30. \
-PHOT_APERTURES 10,15,20 \
-PHOT_AUTOPARAMS 2.5,3.5 \
-PHOT_FLUXFRAC 0.2,0.3,0.5,0.8,0.9  \
-PHOT_PETROPARAMS 2.0,3.5 \
-PIXEL_SCALE 0.33  \
-GAIN  1.0 \
-WEIGHT_TYPE MAP_WEIGHT  \
-WEIGHT_IMAGE  ${weight}  \
-DETECT_MINAREA  300

awk '(NR>29) {print("image;ellipse("$2","$3","$20*$33","$21*$33","$19")  #text={"$1"}")}' $ID'.cat' > ${ID}'.reg'

