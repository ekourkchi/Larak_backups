#!/usr/bin/csh

setenv filename cc.17.1.fits
setenv weight cc.wht.17.1.fits

echo ${filename}
echo ${weight}

setenv cataloge 17.cat
setenv check 17_seg.fits



sex ${filename} -c vip/default.sex \
-DETECT_THRESH   1.2  \
-ANALYSIS_THRESH  1.2  \
#-WEIGHT_IMAGE  ${weight}  \
-PARAMETERS_NAME vip/default.param	\
-CATALOG_NAME ${cataloge} \
-CATALOG_TYPE	ASCII_HEAD \
-STARNNW_NAME	vip/default.nnw \
-CHECKIMAGE_TYPE SEGMENTATION  \
-CHECKIMAGE_NAME	${check} \
-BACKPHOTO_THICK 128  \
-BACKPHOTO_TYPE LOCAL \
-BACK_FILTERSIZE 3  \
-BACK_SIZE 128  \
-CLEAN Y  \
-CLEAN_PARAM 1.0  \
-DEBLEND_MINCONT 0.03   \
-DEBLEND_THRESH 32  \
-DETECT_MINAREA 5  \
-FILTER Y \
-FILTER_NAME vip/gauss_2.5_5x5.conv \
-FLAG_TYPE OR \
-GAIN 2677 \
-MAG_ZEROPOINT 25.937 \
-MASK_TYPE CORRECT \
-PHOT_APERTURES 2.4,8,20,30,60,90,120,180,240 \
-PHOT_AUTOPARAMS 2.5,3.5 \
-PHOT_FLUXFRAC 0.2,0.3,0.5,0.8,0.9  \
-PHOT_PETROPARAMS 2.0,3.5 \
-PIXEL_SCALE 0.05  \
-SATUR_LEVEL 3.14 \
-SEEING_FWHM 0.12  \
-STARNNW_NAME default.nnw  \
-WEIGHT_GAIN Y \
#-WEIGHT_TYPE MAP_RMS  \
-WEIGHT_THRESH 1000000,1000000  

awk '(NR>29) {print("image;ellipse("$2","$3","$20*$33","$21*$33","$19")  #text={"$1"}")}' ${cataloge} > 17.reg


# -CATALOG_NAME ${cataloge} \
# -CATALOG_TYPE	ASCII_HEAD \
# -STARNNW_NAME	vip/default.nnw \
# -PARAMETERS_NAME vip/default.param	\
# -FILTER_NAME	vip/gauss_4.0_7x7.conv \
# -SEEING_FWHM 1.0 \
# -WEIGHT_IMAGE  ${weight}  \
# -WEIGHT_TYPE MAP_RMS \
# -GAIN 0 \
# -DETECT_THRESH   1  \
# -ANALYSIS_THRESH  1  \
# -DETECT_MINAREA	4 \
# -MAG_ZEROPOINT 25.9366 \
# -CHECKIMAGE_TYPE APERTURES  \
# -CHECKIMAGE_NAME	${check} \
# -BACK_SIZE        512

