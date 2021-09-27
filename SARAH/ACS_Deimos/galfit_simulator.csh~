#!/usr/bin/csh

setenv ACSID $argv[1]
setenv no $argv[2]
setenv ver $argv[3]

setenv filename $ACSID'_'$no'.gal.out.ver'$ver'.fits'
setenv residu $ACSID'_'$no'.gal.out.ver'$ver'.residu'
setenv residurms $ACSID'_'$no'.gal.out.ver'$ver'.residu.RMS.fits'
setenv residuback $ACSID'_'$no'.gal.out.ver'$ver'.residu.BACK.fits'


if (-e $residu".fits") then
rm $residu".fits"
endif
echo "./imcopy '"$filename"[3]' " $residu".fits"  > temp.csh
csh temp.csh
rm temp.csh

./sex_residual.csh $residu > log.log


setenv simul simul.fits



setenv galin  $ACSID'_'$no'.gal.in.ver'$ver
setenv galinsimul  $ACSID'_'$no'.gal.in.ver'$ver'.simul'

setenv simulfile simul.fits

awk '(NR<3) {print($0)}' $galin  > $galinsimul
echo "A) "${simulfile}"         # Input data image (FITS file)"  >> $galinsimul
echo "B) galoutfile.fits            # Output data image block"   >> $galinsimul
awk '(NR>4 && NR<10) {print($0)}' $galin  >> $galinsimul
setenv xy `awk '(NR==10) {print($2" "$3" "$4" "$5)}' $galin`
#echo $xy

set x1=`echo $xy | awk '{print($1)}'`
set x2=`echo $xy | awk '{print($2)}'`
set y1=`echo $xy | awk '{print($3)}'`
set y2=`echo $xy | awk '{print($4)}'`

set size_x=`echo "$x2-$x1+1" | bc -l`
set size_y=`echo "$y2-$y1+1" | bc -l`

#echo $size_x
#echo $size_y

echo "H) 1" $size_x" 1 "$size_y"     # Image region to fit (xmin xmax ymin ymax)"  >> $galinsimul
echo "I) "$size_x"  "$size_y"          # Size of the convolution box (x y)"  >> $galinsimul

awk '(NR>11 && NR<43) {print($0)}' $galin  >> $galinsimul
setenv xy `awk '(NR==43) {print($2" "$3)}' $galin`
#echo $xy

set x0=`echo $xy | awk '{print($1)}'`
set y0=`echo $xy | awk '{print($2)}'`
set xc=`echo "$x0-$x1" | bc -l`
set yc=`echo "$y0-$y1" | bc -l`

#echo $xc
#echo $yc

echo "1) "$xc"   "$yc"  1 1    # position x, y        [pixel]"  >> $galinsimul

awk '(NR>43) {print($0)}' $galin  >> $galinsimul

#######################################################
foreach seed (`awk '$1' seed.lst`)
echo $seed
idl > & logidl.out <<EOF
`echo ".com galfit_simul"`
`echo "galfit_simul, '"$simul"', '"$ACSID"', '"$no"', '"$ver"', "$seed`
EOF

if (-e fit.log) then
rm fit.log
endif
galfit ${galinsimul}  > galfit.logfile.log
rm galfit.01

awk '(NR==8) {print($0)}' fit.log
rm fit.log

end
#######################################################
