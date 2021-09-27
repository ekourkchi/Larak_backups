#!/usr/bin/csh

setenv ID $argv[1]

sex ${ID}'.fits' -c ../vip/default.sex \
-CATALOG_NAME $ID'.cat' \
-CATALOG_TYPE	ASCII_HEAD \
-STARNNW_NAME	../vip/default.nnw \
-PARAMETERS_NAME ../vip/photometric.param	\
-FILTER Y   \
-FILTER_NAME	../vip/gauss_4.0_7x7.conv \
-CHECKIMAGE_TYPE APERTURES  \
-BACK_SIZE        256     \
-DETECT_THRESH	2.0   \
-ANALYSIS_THRESH   2.0 \
-MAG_ZEROPOINT 30. \
-GAIN  1.5 \
-DETECT_MINAREA  300

