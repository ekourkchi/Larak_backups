#!/usr/bin/csh

setenv no $argv[2]
foreach ID ( `awk '$1' $argv[1]` )

 if (-e $ID'_'${no}'.reg') then

 setenv POLY '-POLY_NAMES    '$ID'_'${no}'.reg'
 else
 setenv POLY '-POLY_NAMES /'
 endif

 ww -WEIGHT_NAMES 'weight.'${ID}'_'${no}'.fits'  -c  ../vip/default.ww  \
 -OUTWEIGHT_NAME 'reg.weight.'${ID}'_'${no}'.fits'  \
-POLY_OUTFLAGS 0 \
-POLY_OUTWEIGHTS 0 \
-FLAG_NAMES  ../vip/flagin0.fits \
 ${POLY}

echo ${POLY}



end
