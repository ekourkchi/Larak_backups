#!/usr/bin/csh

setenv output $argv[1]'.txt'
setenv isofinal $argv[1]'.isofinal.cl'
setenv coef $argv[2]
#if (-e $output) then
#rm $output
#endif
echo " " > ${isofinal}
echo "               X_c       Y_c        mag     Re       n       Ratio  Pa     ID  no.  C_x     C_Y" >> $output

# ./general.csh  09  928 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  12  974 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  12  1999 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  12  137 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  13  467 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  13  1 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  13  206 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  15  2363 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  16  2899 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  16  543 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  16  1 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  16  1886 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  16  2282 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  16  1166 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  18  3176 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
# ./general.csh  18  2990 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
 ./general.csh  18  3649 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
 ./general.csh  18  1 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
 ./general.csh  18  1201 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
 ./general.csh  18  2692 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  19  2183 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  19  2782 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  22  691 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  22  649 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  22  1017 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  23  2062 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  23  427 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  23  1583 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  24  687 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  24  1 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  25  2646 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  25  1029 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  25  638 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh  25  3 ${coef}  | awk '(NR==14 || NR==15) {print($0)}' >> $output

echo "please type [ cl <  "${isofinal}" ] in IRAF environment.  (by:Ehsan Kourkchi 01 Jan 2010)"



