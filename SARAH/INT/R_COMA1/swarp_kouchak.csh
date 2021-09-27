#!/usr/bin/csh

setenv ID $argv[1]
setenv outname  $argv[2]
setenv outname ${outname}'.fits'


setenv weightout  $argv[2]
setenv weightout ${weightout}'.weight.fits'

setenv images ${ID}'_1.fits'
setenv images ${images}','${ID}'_2.fits'
setenv images ${images}','${ID}'_3.fits'
setenv images ${images}','${ID}'_4.fits'


echo ${images}




swarp ${images}  \
-IMAGEOUT_NAME ${outname} \
-COMBINE_TYPE MEDIAN \
-SUBTRACT_BACK N \
-WEIGHTOUT_NAME ${weightout} \
-BLANK_BADPIXELS Y  \
-BACK_SIZE 256 \
-BACK_FILTERSIZE  3 \
-WRITE_FILEINFO Y
