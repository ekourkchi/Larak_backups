#!/bin/sh

# example:
# ./gnuplot.sh 01 1550 2.0 test 14 27 0.2 2.0


/Applications/SAOImage\ DS9.app/Contents/MacOS/ds9  $1  &

sleep 4


#xpaset -p ds9  frame first
#xpaset -p ds9  frame delete
#xpaset -p ds9 zoom to fit 
#xpaset -p ds9 regions file arrow.reg
#xpaset -p ds9  frame next 
#xpaset -p ds9  zoom to fit
#xpaset -p ds9  frame next 
#xpaset -p ds9  zoom to fit 
#xpaset -p ds9  frame next 
xpaset -p ds9  zoom to fit 
xpaset -p ds9 colorbar no
xpaset -p ds9 tile grid gap 0
xpaset -p ds9  tile column 
#xpaset -p ds9 height 250
#xpaset -p ds9 width 250
#xpaset -p ds9  saveimage png $galpng 
#xpaset -p ds9  exit 

#ds9 $filgal   &
#sleep 4
#xpaset -p ds9 pan to $X $Y
xpaset -p ds9 scale minmax
xpaset -p ds9 scale log

xpaset -p ds9 scale limits 0 15
xpaset -p ds9 cmap value 5.5 .65
xpaset -p ds9 zoom 1.6 1.6
#xpaset -p ds9 colorbar no
xpaset -p ds9 height 400
xpaset -p ds9 width 400
xpaset -p ds9 cmap invert
#xpaset -p ds9 regions file ${cataloge}'.reg'
#xpaset -p ds9  saveimage jpeg $filjpeg 
#xpaset -p ds9  exit 
xpaset -p ds9 grid load ds9.grd 


#sleep 5




#  << EOF > logidl.out
# mu_e, $mag, $Re, $n_ser ,0.05
#EOF






