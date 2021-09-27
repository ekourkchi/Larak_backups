#!/usr/bin/csh

# ID is the root of filename which is a fits file containing the image of the galaxy
setenv ID0 $argv[1]_$argv[2]'.gal.out.ver2.5'
setenv  ID $argv[1]_$argv[2]'.gal.out.ver2.5.galaxy'
setenv filename $ID'.fits'

setenv cataloge ${ID}'.aper.cat'
setenv cataloge1 ${ID0}'.sersic.aper.cat'
setenv check ${ID}'.segment.aper.fits'
setenv galin $argv[1]_$argv[2]'.gal.in.ver2.5'
#echo ${galin}



set x1=`awk '(NR==10) {print($2)}' ${galin}`
set y1=`awk '(NR==10) {print($4)}' ${galin}`

set x_c=`awk '(NR==43) {print($2)}' ${galin}`
set y_c=`awk '(NR==43) {print($3)}' ${galin}`

set x0=`echo "$x_c-$x1" | bc -l`
set y0=`echo "$y_c-$y1" | bc -l`

setenv X `./nodot $x0`
setenv Y `./nodot $y0`

#echo $X
#echo $Y


./sex_aper_mono.csh ${ID0}
setenv n `./pixval $ID'.segment.aper.fits' $X $Y`
# no is the number of the image in the SExtractor cataloge
setenv no `./nodot $n`


set n_line=`echo "$no+31" | bc -l`
if ( $no > 0 ) then
setenv xy `awk -F: -v n="$n_line" '(NR==n) {print($0)}' ${cataloge}`
#echo $xy
setenv f1 `awk  -v n="$n_line" '(NR==n) {print($34)}' ${cataloge}`
setenv f2 `awk  -v n="$n_line" '(NR==n) {print($35)}' ${cataloge}`
setenv ef1 `awk  -v n="$n_line" '(NR==n) {print($36)}' ${cataloge}`
setenv ef2 `awk  -v n="$n_line" '(NR==n) {print($37)}' ${cataloge}`
# echo $f1 $ef1 $f2 $ef2

setenv f11 `awk  -v n="$n_line" '(NR==n) {print($34)}' ${cataloge1}`
setenv f21 `awk  -v n="$n_line" '(NR==n) {print($35)}' ${cataloge1}`
setenv ef11 `awk  -v n="$n_line" '(NR==n) {print($36)}' ${cataloge1}`
setenv ef21 `awk  -v n="$n_line" '(NR==n) {print($37)}' ${cataloge1}`

echo $f1 $ef1 $f2 $ef2 $f11 $ef11 $f21 $ef21 
endif


