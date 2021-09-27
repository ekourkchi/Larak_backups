#!/usr/bin/csh

setenv ID1 $argv[1]
setenv ID2 $argv[2]
setenv FWHM1 $argv[3]
setenv FWHM2 $argv[4]
setenv PIXSCALE $argv[5]

./create_gausssmoothing_kernel.py $FWHM1 $FWHM2 $PIXSCALE .

setenv filt `ls *${FWHM1}'_'${FWHM2}*`
echo 'filter='${filt}

sex ${ID1} -c ../vip/default.sex \
-CATALOG_NAME 'temp.cat' \
-CATALOG_TYPE	ASCII \
-STARNNW_NAME	../vip/default.nnw \
-PARAMETERS_NAME ../vip/default.param	\
-FILTER_NAME ${filt} \
-BACK_SIZE        256     \
-DETECT_THRESH	1.2   \
-ANALYSIS_THRESH   1.2 \
-MAG_ZEROPOINT 30. \
-GAIN  1.5  \
-CHECKIMAGE_TYPE  FILTERED \
-CHECKIMAGE_NAME  ${ID2}



