#!/usr/bin/csh




setenv ID $argv[1]
missfits  ${ID}'.fits'  -c  ../vip/default.missfits  

sex ${ID}'.missfits.fits' -c ../vip/default.sex \
-CATALOG_NAME ${ID}'.corr.ldac' \
-CATALOG_TYPE	FITS_LDAC \
-STARNNW_NAME	../vip/default.nnw \
-PARAMETERS_NAME ../vip/default.param	\
-FILTER_NAME	../vip/gauss_4.0_7x7.conv \
-BACK_SIZE        128 \


scamp ${ID}'.corr.ldac' -c ../vip/scamp.conf \
-SOLVE_ASTROM N \
-SOLVE_PHOTOM Y




