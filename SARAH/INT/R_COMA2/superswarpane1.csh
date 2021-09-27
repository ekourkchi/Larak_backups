#!/usr/bin/csh



setenv outname  $argv[2]
setenv outname ${outname}'.fits'

setenv images ""
setenv weights ""
setenv weightout  $argv[2]
setenv weightout ${weightout}'.weight.fits'

setenv no 1
foreach ID ( `awk '{if(NR==1) print ($1)}' $argv[1]` )
setenv images ${ID}'_'${no}'.esncorr2.fits'
# setenv images ${ID}'_'${no}'.check.fits'
setenv weights 'weight.'${ID}'_'${no}'.fits'
end

foreach ID ( `awk '{if (NR > 1) print ($1)}' $argv[1]` )
setenv images ${images}','${ID}'_'${no}'.esncorr2.fits'
# setenv images ${images}','${ID}'_'${no}'.check.fits'
setenv weights ${weights}',weight.'${ID}'_'${no}'.fits'
end

setenv no 2
foreach ID ( `awk '{ print ($1)}' $argv[1]` )
setenv images ${images}','${ID}'_'${no}'.esncorr2.fits'
# setenv images ${images}','${ID}'_'${no}'.check.fits'
setenv weights ${weights}',weight.'${ID}'_'${no}'.fits'
end

setenv no 3
foreach ID ( `awk '{ print ($1)}' $argv[1]` )
setenv images ${images}','${ID}'_'${no}'.esncorr2.fits'
# setenv images ${images}','${ID}'_'${no}'.check.fits'
setenv weights ${weights}',weight.'${ID}'_'${no}'.fits'
end

setenv no 4
foreach ID ( `awk '{ print ($1)}' $argv[1]` )
setenv images ${images}','${ID}'_'${no}'.esncorr2.fits'
# setenv images ${images}','${ID}'_'${no}'.check.fits'
setenv weights ${weights}',weight.'${ID}'_'${no}'.fits'
end

echo ${images}
echo ${weights}




swarp ${images}  \
-IMAGEOUT_NAME ${outname} \
-COMBINE_TYPE MEDIAN \
-WEIGHT_TYPE MAP_WEIGHT \
-WEIGHT_IMAGE ${weights} \
-SUBTRACT_BACK N \
-WEIGHTOUT_NAME ${weightout} \
-BLANK_BADPIXELS Y  \
-BACK_SIZE 256 \
-BACK_FILTERSIZE  3 \
-WRITE_FILEINFO Y
