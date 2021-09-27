#!/usr/bin/csh

# ID is the root of filename which is a fits file containing the image of the galaxy
setenv  ID $argv[1]_$argv[2]'.gal.out.ver3.0.galaxy'
setenv filename $ID'.fits'

setenv coef $argv[3]
setenv cataloge ${ID}'.cat'
setenv check ${ID}'.segment.fits'
setenv galin $argv[1]_$argv[2]'.gal.in.ver3.0'
#echo ${galin}

setenv backsize  $argv[4]


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


./asymetry_sex.csh ${ID} 128
mv ${cataloge} cat.temp
mv ${ID}'.reg' reg.temp
setenv n `./pixval $ID'.segment.fits' $X $Y`
# no is the number of the image in the SExtractor cataloge
setenv no `./nodot $n`

./asymetry_sex.csh ${ID} ${backsize}
mv cat.temp ${cataloge}
mv  reg.temp  ${ID}'.reg'
setenv n2 `./pixval $ID'.segment.fits' $X $Y`
# no2 is the number of the image in the SExtractor cataloge
setenv no2 `./nodot $n2`



set n_line=`echo "$no+29" | bc -l`
if ( $no > 0 ) then
setenv xy `awk -F: -v n="$n_line" '(NR==n) {print($0)}' ${cataloge}`
#echo SEx: $xy
echo $xy | awk '{print("image;ellipse("$2","$3","$20*$33","$21*$33","$19") # color=red ")}'  > ${cataloge}'.reg'

setenv badmap ${ID}'.badmap.fits'
setenv filgal ${ID}'.filgal.fits'
setenv filjpeg ${ID}'.filgal.jpg'

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
./maskmaker ehsan.fits ${badmap} $x0 $y0 $A $B $THETA $KRON_R $no2 $coef
rm ehsan.fits

if (-e ${filgal}) then
rm ${filgal}
endif

setenv asymetry `./asymetry ${filename} ${badmap} ${filgal} $x0 $y0 $A $B $THETA $KRON_R $coef 3 1`

set A_rms=`echo $asymetry | awk '{print($1)}'`
set A_abs=`echo $asymetry | awk '{print($2)}'`

#echo A_rms=${A_rms}
#echo A_abs=${A_abs}

echo ${A_rms} ${A_abs} 

#################################################
#if (-e ${filjpeg}) then
#rm ${filjpeg}
#endif
#ds9 $filgal   &
#sleep 4
#xpaset -p ds9 pan to $X $Y
#xpaset -p ds9 scale minmax
#xpaset -p ds9 scale linear

#xpaset -p ds9 scale limits -0.05 0.05

#xpaset -p ds9 zoom .6 .6 
#xpaset -p ds9 colorbar no
#xpaset -p ds9 height 200
#xpaset -p ds9 width 200
#xpaset -p ds9 regions file ${cataloge}'.reg'
#xpaset -p ds9  saveimage jpeg $filjpeg 
#xpaset -p ds9  exit 
#################################################


setenv galfitfile $argv[1]'_'$argv[2]'.gal.out.ver3.0.fits'
setenv residu $argv[1]'_'$argv[2]'.gal.out.ver3.0.residu'
if (-e $residu".fits") then
rm $residu".fits"
endif
echo "./imcopy '"$galfitfile"[3]' " $residu".fits"  > temp.csh
csh temp.csh
rm temp.csh


if (-e $residu"_normal.fits") then
rm $residu"_normal.fits"
endif
imarith $filename $residu".fits" d $residu"_normal.fits"

if (-e temp.fits) then
rm temp.fits
endif
setenv asymetry_galfit `./asymetry_galfit $residu"_normal.fits" ${badmap} temp.fits $x0 $y0 $A $B $THETA $KRON_R $coef 0 0`

set A_rms=`echo $asymetry_galfit | awk '{print($1)}'`
set A_abs=`echo $asymetry_galfit | awk '{print($2)}'`

#echo A_rms=${A_rms}
#echo A_abs=${A_abs}

echo ${A_rms} ${A_abs} 


#################################################
#if (-e $residu"_normal.jpg") then
#rm $residu"_normal.jpg"
#endif

#ds9 $residu"_normal.fits"   &

#sleep 4
#xpaset -p ds9 pan to $X $Y
#xpaset -p ds9 scale zscale


#xpaset -p ds9 zoom .6 .6

#xpaset -p ds9 colorbar no
#xpaset -p ds9 height 200
#xpaset -p ds9 width 200
#xpaset -p ds9 regions file ${cataloge}'.reg'
#xpaset -p ds9  saveimage jpeg $residu"_normal.jpg"
#xpaset -p ds9  exit 
#################################################

