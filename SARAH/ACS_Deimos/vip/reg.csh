#!/usr/bin/csh

foreach ID ( `awk '$1' $argv` )


setenv no 1
if (-e $ID'_'${no}'.reg') then
setenv POLY '-POLY_NAMES    '$ID'_'${no}'.reg'
else
setenv POLY '-POLY_NAMES   \ '
endif

ww -WEIGHT_NAMES 'weight.'${ID}'_'${no}'.fits'  -c  ..\vip\default.ww  \
-OUTWEIGHT_NAME 'reg.weight.'${ID}'_'${no}'.fits'  \
${POLY}




end