#!/usr/bin/csh

setenv ID $argv[1]


sex ${ID}'.fits' -c ../vip/default.sex \
-CATALOG_NAME $ID'.cat' \
-CATALOG_TYPE	ASCII_HEAD \
-STARNNW_NAME	../vip/default.nnw \
-PARAMETERS_NAME ../vip/photometric.param	\
-FILTER_NAME	../vip/gauss_4.0_7x7.conv \
-CHECKIMAGE_TYPE NONE  \
-BACK_SIZE        256     \
-DETECT_THRESH	2.   \
-ANALYSIS_THRESH   2. \
-MAG_ZEROPOINT 30. \
-GAIN  1.5  \
-ASSOC_NAME  ${ID}'.star1'   \
-ASSOC_DATA   0  \
-ASSOC_PARAMS 1,2,3   \
-ASSOC_RADIUS 10.   \
-ASSOC_TYPE NEAREST \
-ASSOCSELEC_TYPE  MATCHED


