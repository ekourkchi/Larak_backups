#!/bin/bash

export list=$1
export PIXSCALE=$3
export STACK=$2




echo '###############     chip1    chip2    chip3    chip4    pixscale'   >> $list'.fwhm'
for ID in  `awk '$1' $list` 
do


		export NO=1
		echo $ID'_'$NO'.esncorr2.fits'
		sex  $ID'_'$NO'.esncorr2.fits' -c ../vip/seeing.conf.sex \
			-CATALOG_NAME temp.seeing.cat \
			-FILTER_NAME ../vip/default.conv\
			-CATALOG_TYPE FITS_LDAC \
			-DETECT_MINAREA 10 -DETECT_THRESH 10.\
			-ANALYSIS_THRESH 1.2 \
			-PARAMETERS_NAME ../vip/seeing.param.sex\
		-MAG_ZEROPOINT 30. \
			-GAIN  1.5  \
			-FLAG_IMAGE ''
		echo "Determining seeing"
		FWHM1=`preanisotropy -i temp.seeing.cat \
				-t LDAC_OBJECTS \
				-c MAGERR_AUTO 0.0 0.05 IMAFLAGS_ISO 0.0 0.5 \
				-k FWHM_IMAGE MAG_AUTO 2>&1 |\
					awk '($1 ~ /best/) {print $3 * '${PIXSCALE}'}'`
		
		echo "The seeing is: ${FWHM1}  arcsec and the pixscale is: ${PIXSCALE}"
		rm temp.seeing.cat

		export NO=2
		echo $ID'_'$NO'.esncorr2.fits'
		sex  $ID'_'$NO'.esncorr2.fits' -c ../vip/seeing.conf.sex \
			-CATALOG_NAME temp.seeing.cat \
			-FILTER_NAME ../vip/default.conv\
			-CATALOG_TYPE FITS_LDAC \
			-DETECT_MINAREA 10 -DETECT_THRESH 10.\
			-ANALYSIS_THRESH 1.2 \
			-PARAMETERS_NAME ../vip/seeing.param.sex\
		-MAG_ZEROPOINT 30. \
			-GAIN  1.5  \
			-FLAG_IMAGE ''
		echo "Determining seeing"
		FWHM2=`preanisotropy -i temp.seeing.cat \
				-t LDAC_OBJECTS \
				-c MAGERR_AUTO 0.0 0.05 IMAFLAGS_ISO 0.0 0.5 \
				-k FWHM_IMAGE MAG_AUTO 2>&1 |\
					awk '($1 ~ /best/) {print $3 * '${PIXSCALE}'}'`
		
		echo "The seeing is: ${FWHM2}  arcsec and the pixscale is: ${PIXSCALE}"
		rm temp.seeing.cat

		export NO=3
		echo $ID'_'$NO'.esncorr2.fits'
		sex  $ID'_'$NO'.esncorr2.fits' -c ../vip/seeing.conf.sex \
			-CATALOG_NAME temp.seeing.cat \
			-FILTER_NAME ../vip/default.conv\
			-CATALOG_TYPE FITS_LDAC \
			-DETECT_MINAREA 10 -DETECT_THRESH 10.\
			-ANALYSIS_THRESH 1.2 \
			-PARAMETERS_NAME ../vip/seeing.param.sex\
		-MAG_ZEROPOINT 30. \
			-GAIN  1.5  \
			-FLAG_IMAGE ''
		echo "Determining seeing"
		FWHM3=`preanisotropy -i temp.seeing.cat \
				-t LDAC_OBJECTS \
				-c MAGERR_AUTO 0.0 0.05 IMAFLAGS_ISO 0.0 0.5 \
				-k FWHM_IMAGE MAG_AUTO 2>&1 |\
					awk '($1 ~ /best/) {print $3 * '${PIXSCALE}'}'`
		
		echo "The seeing is: ${FWHM3}  arcsec and the pixscale is: ${PIXSCALE}"
		rm temp.seeing.cat

		export NO=4
		echo $ID'_'$NO'.esncorr2.fits'
		sex  $ID'_'$NO'.esncorr2.fits' -c ../vip/seeing.conf.sex \
			-CATALOG_NAME temp.seeing.cat \
			-FILTER_NAME ../vip/default.conv\
			-CATALOG_TYPE FITS_LDAC \
			-DETECT_MINAREA 10 -DETECT_THRESH 10.\
			-ANALYSIS_THRESH 1.2 \
			-PARAMETERS_NAME ../vip/seeing.param.sex\
		-MAG_ZEROPOINT 30. \
			-GAIN  1.5  \
			-FLAG_IMAGE ''
		echo "Determining seeing"
		FWHM4=`preanisotropy -i temp.seeing.cat \
				-t LDAC_OBJECTS \
				-c MAGERR_AUTO 0.0 0.05 IMAFLAGS_ISO 0.0 0.5 \
				-k FWHM_IMAGE MAG_AUTO 2>&1 |\
					awk '($1 ~ /best/) {print $3 * '${PIXSCALE}'}'`
		
		echo "The seeing is: ${FWHM4}  arcsec and the pixscale is: ${PIXSCALE}"
		rm temp.seeing.cat


echo $ID'     '${FWHM1}'    '${FWHM2}'    '${FWHM3}'    '${FWHM4}'    '${PIXSCALE}  >> $list'.fwhm'
done


sex  ${STACK}'.fits' -c ../vip/seeing.conf.sex \
  	-CATALOG_NAME ${STACK}'.seeing.cat' \
        -FILTER_NAME ../vip/default.conv\
  	-CATALOG_TYPE FITS_LDAC \
  	-DETECT_MINAREA 10 -DETECT_THRESH 10.\
  	-ANALYSIS_THRESH 1.2 \
  	-PARAMETERS_NAME ../vip/seeing.param.sex\
        -WEIGHT_IMAGE ${STACK}'.weight.fits'\
        -WEIGHT_TYPE MAP_WEIGHT \
       -MAG_ZEROPOINT 30. \
	-GAIN  1.5  \
	-FLAG_IMAGE ''

echo "Determining seeing"
FWHM=`preanisotropy -i ${STACK}'.seeing.cat' \
                   -t LDAC_OBJECTS \
                   -c MAGERR_AUTO 0.0 0.05 IMAFLAGS_ISO 0.0 0.5 \
                   -k FWHM_IMAGE MAG_AUTO 2>&1 |\
			awk '($1 ~ /best/) {print $3 * '${PIXSCALE}'}'`

echo "The seeing is: ${FWHM}  arcsec and the pixscale is: ${PIXSCALE}"

rm ${STACK}'.seeing.cat'

echo '----------------------------------------------------------'  >> $list'.fwhm'
echo $STACK'     >>>     FWHM(coadd)= '${FWHM}   >> $list'.fwhm'