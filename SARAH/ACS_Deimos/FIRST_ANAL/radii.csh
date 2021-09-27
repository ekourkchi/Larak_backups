#!/usr/bin/csh

setenv ID $argv[1]
setenv  no_object $argv[2]
setenv cat ${ID}'.cat'

set n_line=`echo "$no_object+29" | bc -l`



setenv xy `awk -F: -v n="$n_line" '(NR==n) {print($0)}' ${cat}`



setenv x0 `echo $xy | awk '{print ($2)}'`
setenv y0 `echo $xy | awk '{print ($3)}'`







setenv A `echo $xy | awk '{print ($20)}'`
setenv B `echo $xy | awk '{print ($21)}'`
setenv THETA `echo $xy | awk '{print ($19)}'`
setenv KRON_R `echo $xy | awk '{print ($33)}'`
#echo THETA: $THETA
setenv mag `echo $xy | awk '{print ($14)}'`
setenv re  `echo $xy | awk '{print ($25)}'`
setenv r20  `echo $xy | awk '{print ($23)}'`
setenv r80  `echo $xy | awk '{print ($26)}'`
setenv r90  `echo $xy | awk '{print ($27)}'`

#echo R_e: $re
#echo Mag: $mag
setenv elips `echo $xy | awk '{print ($32)}'`


#echo $elips
echo $A $B $KRON_R $r20 $re $r80 $r90





