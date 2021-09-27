#!/bin/sh

# example:
# ./gnuplot.sh 01 1550 2.0 test 14 27 0.2 2.0

export galfits=$1_$2.gal.out.ver$3.fits
export galpng=$1_$2.gal.out.ver$3.png
export badmap=$1_$2.badmap.ver$3.fits

echo $galfits


ds9 -multiframe -zoom to fit -zscale $galfits $badmap &

sleep 4


xpaset -p ds9  frame first
xpaset -p ds9  frame delete
xpaset -p ds9 zoom to fit 
xpaset -p ds9 regions file arrow.reg
xpaset -p ds9  frame next 
xpaset -p ds9  zoom to fit
xpaset -p ds9  frame next 
xpaset -p ds9  zoom to fit 
xpaset -p ds9  frame next 
xpaset -p ds9  zoom to fit 
xpaset -p ds9 colorbar no
xpaset -p ds9 tile grid gap 0
xpaset -p ds9  tile column 
xpaset -p ds9 height 250
xpaset -p ds9 width 900
xpaset -p ds9  saveimage png $galpng 
xpaset -p ds9  exit 

sleep 5




#  << EOF > logidl.out
# mu_e, $mag, $Re, $n_ser ,0.05
#EOF






