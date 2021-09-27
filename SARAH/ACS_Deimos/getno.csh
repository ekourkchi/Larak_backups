#!/usr/bin/csh

setenv aydi $argv[1]
setenv results " "
foreach ID (`awk '$1' no.lst`)

setenv xy `sky2xy -j 'h_v'$ID'_F814W_drz_cl_ver2.fits'  $argv[2] $argv[3]   | awk '{print($5" "$6)}'`
setenv n `./pixval $ID'.segment_1.fits' $xy`
setenv no `./nodot $n`
setenv cat ${ID}'.cat'
#echo $no

if ( $no != "0" ) setenv results ${results}" "$ID" "$no


end
echo $aydi"  "$results




