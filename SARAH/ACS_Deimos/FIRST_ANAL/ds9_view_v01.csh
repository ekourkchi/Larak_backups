#!/bin/csh

# example:
# 

setenv contrast $argv[3]
setenv bias $argv[4]

setenv  ID $argv[1]_$argv[2]'.gal.out.ver2.5_galaxy'
setenv filename $ID'.fits'

setenv cataloge ${ID}'.cat'
setenv check ${ID}'.segment.fits'
setenv galin $argv[1]_$argv[2]'.gal.in.ver2.5'


set x1=`awk '(NR==10) {print($2)}' ${galin}`
set y1=`awk '(NR==10) {print($4)}' ${galin}`

set x_c=`awk '(NR==43) {print($2)}' ${galin}`
set y_c=`awk '(NR==43) {print($3)}' ${galin}`

set x0=`echo "$x_c-$x1" | bc -l`
set y0=`echo "$y_c-$y1" | bc -l`

setenv X `./nodot $x0`
setenv Y `./nodot $y0`


./asymetry_sex.csh ${ID} 128
mv ${ID}'.reg' reg.temp

setenv no `./pixval $ID'.segment.fits' $X $Y`
# no is the number of the image in the SExtractor cataloge
setenv no2 `./nodot $no`



set n_line=`echo "$no2+29" | bc -l`

setenv xy `awk -F: -v n="$n_line" '(NR==n) {print($0)}' ${cataloge}`
echo SEx: $xy
echo $xy | awk '{print("image;ellipse("$2","$3","$20*$33","$21*$33","$19") # color=black width=1 ")}'  > ${cataloge}'.reg'

setenv badmap ${ID}'.badmap.fits'


ds9 ${filename}   &

sleep 4

xpaset -p ds9 pan to $X $Y

xpaset -p ds9 scale log
xpaset -p ds9 scale mode  minmax
xpaset -p ds9 scale limits -0.6 20
xpaset -p ds9 cmap value $contrast $bias
xpaset -p ds9 zoom 0.9 0.9

xpaset -p ds9 regions file ${cataloge}'.reg'

#xpaset -p ds9  frame first
#xpaset -p ds9  frame delete
#xpaset -p ds9 zoom to fit 
#xpaset -p ds9 regions file arrow.reg
#xpaset -p ds9  frame next 
#xpaset -p ds9  zoom to fit
#xpaset -p ds9  frame next 
#xpaset -p ds9  zoom to fit 
#xpaset -p ds9  frame next 
#xpaset -p ds9  zoom to fit 
xpaset -p ds9 colorbar no
#xpaset -p ds9 tile grid gap 0
#xpaset -p ds9  tile column 
#xpaset -p ds9 height 250
#xpaset -p ds9 width 250
#xpaset -p ds9  saveimage png $galpng 
#xpaset -p ds9  exit 

#ds9 $filgal   &
#sleep 4
#xpaset -p ds9 pan to $X $Y
#xpaset -p ds9 scale minmax



#xpaset -p ds9 colorbar no
xpaset -p ds9 height 300
xpaset -p ds9 width 300
xpaset -p ds9 cmap invert
#xpaset -p ds9 regions file ${cataloge}'.reg'
#xpaset -p ds9  saveimage jpeg $filjpeg 
#xpaset -p ds9  exit 
xpaset -p ds9 grid load ds9.grd 


sleep 1

xpaset -p ds9 scale mode  minmax
xpaset -p ds9 cmap invert


#  << EOF > logidl.out
# mu_e, $mag, $Re, $n_ser ,0.05
#EOF






