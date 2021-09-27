#!/usr/bin/csh


setenv list id.814.475.lst
setenv nline `wc -l $list | awk '{print($1)}'`
setenv i 1
#echo $nline
while ($i <= $nline)
#echo $i

setenv all `awk  -F: -v en="$i" '(NR==en) {print($0)}' $list`

setenv ID814 `echo $all | awk '{print($1)}'`
setenv num814 `echo $all | awk '{print($2)}'`
setenv num475 `echo $all | awk '{print($3)}'`

setenv ID475 $ID814


################################################################################################################
################################################################################################################
setenv cat814 ${ID814}".cat"
setenv apercat814 ${ID814}".aper.cat"
setenv segment814 ${ID814}".segment_1.fits"
setenv apersegment ${ID814}".segment.814.aper_1.fits"


set n814=`echo "$num814+29" | bc -l`
setenv all814 `awk  -F: -v en="$n814" '(NR==en) {print($0)}' $cat814 `

setenv nxymagre0 `echo $all814 | awk '{print($1" "$2" "$3" "$14" "$15" "$25)}'`
#echo $nxymagre0

setenv xy  `echo $nxymagre0  | awk '{print($2" "$3)}'`


setenv n `./pixval ${ID814}".segment.814.aper_1.fits" $xy`
setenv n `./nodot $n`
#echo $n

set n814=`echo "$n+31" | bc -l`
setenv all814 `awk  -F: -v en="$n814" '(NR==en) {print($0)}' $apercat814 `

setenv nxymagre `echo $all814 | awk '{print($1" "$2" "$3" "$14" "$34" "$35" "$36" "$37" "$43" "$44" "$45" "$46)}'`
#echo $nxymagre


setenv F814W `echo F814W $ID814 $nxymagre0 $ID814 $nxymagre`

################################################################################################################
################################################################################################################
################################################################################################################
################################################################################################################
setenv cat475 ${ID475}".475.cat"
setenv apercat475 ${ID475}".475.aper.cat"
setenv segment475 ${ID475}".segment.475_1.fits"
setenv apersegment ${ID475}".segment.475.aper_1.fits"


set n475=`echo "$num475+29" | bc -l`
setenv all475 `awk  -F: -v en="$n475" '(NR==en) {print($0)}' $cat475 `

setenv nxymagre0 `echo $all475 | awk '{print($1" "$2" "$3" "$14" "$15" "$25)}'`
#echo $nxymagre0

setenv xy  `echo $nxymagre0  | awk '{print($2" "$3)}'`


setenv n `./pixval ${ID475}".segment.475.aper_1.fits" $xy`
setenv n `./nodot $n`
#echo $n

set n475=`echo "$n+31" | bc -l`
setenv all475 `awk  -F: -v en="$n475" '(NR==en) {print($0)}' $apercat475 `

setenv nxymagre `echo $all475 | awk '{print($1" "$2" "$3" "$14" "$34" "$35" "$36" "$37" "$43" "$44" "$45" "$46)}'`
#echo $nxymagre


setenv F475W `echo F475W $ID475 $nxymagre0 $ID475 $nxymagre`

################################################################################################################
################################################################################################################
echo $F814W  $F475W


set i=`echo "$i+1" | bc -l`
end
