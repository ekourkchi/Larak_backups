#!/usr/bin/csh

foreach ID ( `awk '$1' $argv[1]` )


setenv no $argv[2]
missfits  ${ID}'_'${no}'.fits'  -c  ../vip/default.missfits  

sex ${ID}'_'${no}'.missfits.fits' -c ../vip/default.sex \
-CATALOG_NAME ${ID}'_'${no}'.corr.ldac' \
-CATALOG_TYPE	FITS_LDAC \
-STARNNW_NAME	../vip/default.nnw \
-PARAMETERS_NAME ../vip/default.param	\
-FILTER_NAME	../vip/gauss_4.0_7x7.conv \
-BACK_SIZE        64 \
-CHECKIMAGE_TYPE -BACKGROUND  \
-CHECKIMAGE_NAME  ${ID}'_'${no}'.corr.fits'

scamp ${ID}'_'${no}'.corr.ldac' -c ../vip/scamp.conf   



end
