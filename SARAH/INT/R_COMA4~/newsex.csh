#!/usr/bin/csh

# setenv ID $argv[1]
setenv no $argv[2]

foreach ID ( `awk '$1' $argv[1]` )

sex ${ID}'_'${no}'.fits' -c ../vip/default.sex \
-CATALOG_NAME 'sextractor.ldac' \
-CATALOG_TYPE	FITS_LDAC \
-STARNNW_NAME	../vip/default.nnw \
-PARAMETERS_NAME ../vip/default.param	\
-FILTER_NAME	../vip/gauss_4.0_7x7.conv \
-CHECKIMAGE_TYPE BACKGROUND  \
-CHECKIMAGE_NAME	${ID}'_'${no}'.sexback.fits' \
-BACK_SIZE        64     \
-DETECT_THRESH	1.   \
-ANALYSIS_THRESH   1.



sex ${ID}'_'${no}'.fits' -c ../vip/default.sex \
-CATALOG_NAME 'sextractor.ldac' \
-CATALOG_TYPE	FITS_LDAC \
-STARNNW_NAME	../vip/default.nnw \
-PARAMETERS_NAME ../vip/default.param	\
-FILTER_NAME	../vip/gauss_4.0_7x7.conv \
-CHECKIMAGE_TYPE OBJECTS  \
-CHECKIMAGE_NAME	${ID}'_'${no}'.objects.fits' \
-BACK_SIZE        64     \
-DETECT_THRESH	1.   \
-ANALYSIS_THRESH   1.

cp ${ID}'_'${no}'.corr.head' ${ID}'_'${no}'.esncorr.head' 

end
