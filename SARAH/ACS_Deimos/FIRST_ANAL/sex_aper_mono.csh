#!/usr/bin/csh

setenv  ID0 $argv[1]
setenv filename ${ID0}'.galaxy.fits'
setenv filename1 ${ID0}'.sersic.fits'
setenv cataloge1 ${ID0}'.sersic.aper.cat'
setenv backsize 128
#echo ${filename}

setenv cataloge ${ID0}'.galaxy.aper.cat'
setenv check ${ID0}'.galaxy.segment.aper.fits'



sex ${filename},${filename} -c ../vip/default.sex \
-DETECT_THRESH   0.9  \
-ANALYSIS_THRESH  0.9  \
-PARAMETERS_NAME ../vip/default_aper.param	\
-CATALOG_NAME ${cataloge} \
-CATALOG_TYPE	ASCII_HEAD \
-STARNNW_NAME	../vip/default.nnw \
-CHECKIMAGE_TYPE SEGMENTATION  \
-CHECKIMAGE_NAME	${check} \
-BACKPHOTO_THICK 64  \
-BACKPHOTO_TYPE LOCAL \
-BACK_FILTERSIZE 3  \
-BACK_SIZE ${backsize}  \
-CLEAN Y  \
-CLEAN_PARAM 1.0  \
-DEBLEND_MINCONT 0.03   \
-DEBLEND_THRESH 32  \
-DETECT_MINAREA 5  \
-FILTER Y \
-FILTER_NAME ../vip/gauss_2.5_5x5.conv \
-FLAG_TYPE OR \
-GAIN 2677 \
-MAG_ZEROPOINT 25.937 \
-MASK_TYPE CORRECT \
-PHOT_APERTURES 2.4,8 \
-PHOT_AUTOPARAMS 2.5,3.5 \
-PHOT_FLUXFRAC 0.2,0.3,0.5,0.8,0.9  \
-PHOT_PETROPARAMS 2.0,3.5 \
-PIXEL_SCALE 0.05  \
-SATUR_LEVEL 3.14 \
-SEEING_FWHM 0.12  \
-STARNNW_NAME default.nnw  \
-WEIGHT_GAIN Y 

sex ${filename},${filename1} -c ../vip/default.sex \
-DETECT_THRESH   0.9  \
-ANALYSIS_THRESH  0.9  \
-PARAMETERS_NAME ../vip/default_aper.param	\
-CATALOG_NAME ${cataloge1} \
-CATALOG_TYPE	ASCII_HEAD \
-STARNNW_NAME	../vip/default.nnw \
-CHECKIMAGE_TYPE SEGMENTATION  \
-CHECKIMAGE_NAME	${check} \
-BACKPHOTO_THICK 64  \
-BACKPHOTO_TYPE LOCAL \
-BACK_FILTERSIZE 3  \
-BACK_SIZE ${backsize}  \
-CLEAN Y  \
-CLEAN_PARAM 1.0  \
-DEBLEND_MINCONT 0.03   \
-DEBLEND_THRESH 32  \
-DETECT_MINAREA 5  \
-FILTER Y \
-FILTER_NAME ../vip/gauss_2.5_5x5.conv \
-FLAG_TYPE OR \
-GAIN 2677 \
-MAG_ZEROPOINT 25.937 \
-MASK_TYPE CORRECT \
-PHOT_APERTURES 2.4,8 \
-PHOT_AUTOPARAMS 2.5,3.5 \
-PHOT_FLUXFRAC 0.2,0.3,0.5,0.8,0.9  \
-PHOT_PETROPARAMS 2.0,3.5 \
-PIXEL_SCALE 0.05  \
-SATUR_LEVEL 3.14 \
-SEEING_FWHM 0.12  \
-STARNNW_NAME default.nnw  \
-WEIGHT_GAIN Y 

