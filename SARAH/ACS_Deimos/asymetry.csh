#!/usr/bin/csh

# ID is the root of filename which is a fits file containing the image of the galaxy
setenv  ID $argv[1]_$argv[2]'.gal.out.ver3.0.galaxy'
setenv filename $ID'.fits'

setenv coef $argv[3]
setenv cataloge ${ID}'.cat'
setenv check ${ID}'.segment.fits'
setenv galin $argv[1]_$argv[2]'.gal.in.ver3.0'
echo ${galin}

set x1=`awk '(NR==10) {print($2)}' ${galin}`
set y1=`awk '(NR==10) {print($4)}' ${galin}`

set x_c=`awk '(NR==43) {print($2)}' ${galin}`
set y_c=`awk '(NR==43) {print($3)}' ${galin}`

set x0=`echo "$x_c-$x1" | bc -l`
set y0=`echo "$y_c-$y1" | bc -l`

setenv X `./nodot $x0`
setenv Y `./nodot $y0`

echo $X
echo $Y

./asymetry_sex.csh ${ID}



setenv n `./pixval $ID'.segment.fits' $X $Y`

# no is the number of the image in the SExtractor cataloge
setenv no `./nodot $n`

set n_line=`echo "$no+29" | bc -l`
if ( $no > 0 ) then
setenv xy `awk -F: -v n="$n_line" '(NR==n) {print($0)}' ${cataloge}`
#echo SEx: $xy


setenv badmap ${ID}'.badmap.fits'
setenv filgal ${ID}'.filgal.fits'

setenv NAXIS1 `dfits ${check} | fitsort NAXIS1 | awk '(NR==2) {print($2)}'`
setenv NAXIS2 `dfits ${check} | fitsort NAXIS2 | awk '(NR==2) {print($2)}'`

if (-e ehsan.fits) then
rm ehsan.fits
endif
./imcopy ${check}"[1:"$NAXIS1",1:"$NAXIS2"]"   ehsan.fits
if (-e ${badmap}) then
rm ${badmap}
endif
setenv x0 `echo $xy | awk '{print ($2)}'`
setenv y0 `echo $xy | awk '{print ($3)}'`
setenv A `echo $xy | awk '{print ($20)}'`
setenv B `echo $xy | awk '{print ($21)}'`
setenv THETA `echo $xy | awk '{print ($19)}'`
setenv KRON_R `echo $xy | awk '{print ($33)}'`
./maskmaker ehsan.fits ${badmap} $x0 $y0 $A $B $THETA $KRON_R $no $coef
rm ehsan.fits

if (-e ${filgal}) then
rm ${filgal}
endif
setenv asymetry `./asymetry ${filename} ${badmap} ${filgal} $x0 $y0 $A $B $THETA $KRON_R $coef 3 1`

set A_rms=`echo $asymetry | awk '{print($1)}'`
set A_abs=`echo $asymetry | awk '{print($2)}'`

echo A_rms=${A_rms}
echo A_abs=${A_abs}






