#!/usr/bin/csh

setenv ID $argv[1]


setenv xy `sky2xy -j $ID'.fits'  $argv[2] $argv[3]   | awk '{print($5" "$6)}'`
setenv n `./pixval $ID'.segment.fits' $xy`
setenv no `./nodot $n`
setenv cat ${ID}'.cat'
#echo $no


set n_line=`echo "$no+29" | bc -l`
#echo $n_line
if ( $no > 0 ) then
setenv flux `awk -F: -v n="$n_line" '(NR==n) {print($0)}' ${ID}".cat"`
setenv flux `echo $flux | awk '{print ($12)}'`
echo FLUX: $flux
else 
echo FLUX:
endif




