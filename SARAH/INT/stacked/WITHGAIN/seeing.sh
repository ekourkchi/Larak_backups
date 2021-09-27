#!/bin/bash

export ID=$1
export PIXSCALE=$2

echo $ID

sex  ${ID}'.fits' -c ../vip/seeing.conf.sex \
  	-CATALOG_NAME ${ID}'.seeing.cat' \
        -FILTER_NAME ../vip/default.conv\
  	-CATALOG_TYPE FITS_LDAC \
  	-DETECT_MINAREA 10 -DETECT_THRESH 10.\
  	-ANALYSIS_THRESH 1.2 \
  	-PARAMETERS_NAME ../vip/seeing.param.sex\
        -WEIGHT_IMAGE ${ID}'.weight.fits'\
        -WEIGHT_TYPE MAP_WEIGHT \
       -MAG_ZEROPOINT 30. \
	-GAIN  1.5  \
	-FLAG_IMAGE ''

echo "Determining seeing"
FWHM=`preanisotropy -i ${ID}'.seeing.cat' \
                   -t LDAC_OBJECTS \
                   -c MAGERR_AUTO 0.0 0.05 IMAFLAGS_ISO 0.0 0.5 \
                   -k FWHM_IMAGE MAG_AUTO 2>&1 |\
			awk '($1 ~ /best/) {print $3 * '${PIXSCALE}'}'`

seeing=`preanisotropy -i ${ID}'.seeing.cat' \
                   -t LDAC_OBJECTS \
                   -c MAGERR_AUTO 0.0 0.05 IMAFLAGS_ISO 0.0 0.5 \
                   -k FWHM_IMAGE MAG_AUTO 2>&1 |\
			awk '($1 ~ /best/) {print $3 }'`


echo "The seeing is: ${seeing}  pixel(s)"
echo "The seeing is: ${FWHM}  arcsec and the pixscale is: ${PIXSCALE}"