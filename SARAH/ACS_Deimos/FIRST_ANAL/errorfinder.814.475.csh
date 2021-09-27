#!/usr/bin/csh



setenv list list0001.lst

setenv nline `wc -l $list | awk '{print($1)}'`
setenv i 1
#echo $nline
while ($i <= $nline)
#echo $i
setenv all `awk -F: -v en="$i" '(NR==en) {print($0)}' $list`


setenv gmp   `echo $all   | awk '{print($1)}'`
setenv idver `echo $all   | awk '{print($2)}'`
setenv n814  `echo $all   | awk '{print($3)}'`
setenv n475  `echo $all   | awk '{print($4)}'`


setenv er475 `awk '(NR==9) {print($4"  "$5"  "$6)}' "../"$idver"_"$n475".galfit.475.ver2.5"`

setenv er814 `awk '(NR==9) {print($4"  "$5"  "$6)}' $idver"_"$n814".galfit.ver2.5"`


setenv magren475 `awk '(NR==8) {print($6"  "$7"  "$8)}' "../"$idver"_"$n475".galfit.475.ver2.5"`

setenv magren814 `awk '(NR==8) {print($6"  "$7"  "$8)}' $idver"_"$n814".galfit.ver2.5"`


echo $gmp "  "  $er814 $er475  "    <ESN>   " $magren814 $magren475

set i=`echo "$i+1" | bc -l`
end
