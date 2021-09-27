#!/usr/bin/csh

setenv output $argv[1]'.txt'
setenv isofinal $argv[1]'.isofinal.cl'
setenv coef $argv[2]
#if (-e $output) then
#rm $output
#endif
echo " " > ${isofinal}
echo "               X_c       Y_c        mag     Re       n       Ratio  Pa     ID  no.  C_x     C_Y" > $output

./general.csh	03	1738		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	14	275		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	18	3649		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	18	1		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	19	2183		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	23	219		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	23	427		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	25	3		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	33	1323		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	45	1489		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	45	10		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	46	851		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	46	1225		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	59	1		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	63	222		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	75	1083		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	90	779		${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}


echo "please type [ cl <  "${isofinal}" ] in IRAF environment.  (by:Ehsan Kourkchi 01 Jan 2010)"



