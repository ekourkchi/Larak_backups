#!/usr/bin/csh

foreach ID ( `awk '$1' $argv[1]` )


setenv no 1
missfits  ${ID}'_'${no}'.esncorr.fits'  -c  ../vip/default.missfits  

setenv no 2
missfits  ${ID}'_'${no}'.esncorr.fits'  -c  ../vip/default.missfits  

setenv no 3
missfits  ${ID}'_'${no}'.esncorr.fits'  -c  ../vip/default.missfits  

setenv no 4
missfits  ${ID}'_'${no}'.esncorr.fits'  -c  ../vip/default.missfits  



end
