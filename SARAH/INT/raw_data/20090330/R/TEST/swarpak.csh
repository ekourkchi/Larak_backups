#!/usr/bin/csh



setenv outname  $argv[2]
setenv outname ${outname}'.fits'

setenv images ""
setenv weights ""
setenv weightout  $argv[2]
setenv weightout ${weightout}'.weight.fits'


setenv ID $argv[1]
setenv images ${ID}'_1.fits,'${ID}'_2.fits,'${ID}'_3.fits,'${ID}'_4.fits'


echo ${images}
echo ${weights}




swarp ${images}  \
-IMAGEOUT_NAME ${outname} \
-COMBINE_TYPE MEDIAN \
-SUBTRACT_BACK N \
-BLANK_BADPIXELS Y  \
-BACK_SIZE 256 \
-BACK_FILTERSIZE  3 \
-WRITE_FILEINFO Y
