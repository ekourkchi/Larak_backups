#!/usr/bin/csh

foreach idd ( `ls $argv[1]` )
setenv STR ""
# echo ":" $idd 
setenv STR `more  $idd | grep $argv[2] | awk '(NR==1) {print($1)}'`


if ("${STR}" != "") then 
echo "---------------------"
echo ""
echo "File Name:" $idd "   " 
more  $idd | grep $argv[2]
endif


end
echo "---------------------"







