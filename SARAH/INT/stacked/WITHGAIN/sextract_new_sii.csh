#!/usr/bin/csh

setenv ID $argv[1]


sex ${ID}'_R.gain.fits','norm'${ID}'_SII.gain.r.fits' -c ../vip/default.sex \
-CATALOG_NAME 'norm'$ID'_SII.gain.r.cat' \
-CATALOG_TYPE	ASCII_HEAD \
-STARNNW_NAME	../vip/default.nnw \
-PARAMETERS_NAME ../vip/photometric.param	\
-FILTER_NAME	../vip/gauss_4.0_7x7.conv \
-CHECKIMAGE_TYPE NONE  \
-BACK_SIZE        256     \
-DETECT_THRESH	2.   \
-ANALYSIS_THRESH   2. \
-MAG_ZEROPOINT 30. \
-GAIN  1.5


