#!/usr/bin/csh

setenv output $argv[1]'.txt'
setenv isofinal $argv[1]'.isofinal.cl'
setenv coef $argv[2]
#if (-e $output) then
#rm $output
#endif
echo " " > ${isofinal}
echo "               X_c       Y_c        mag     Re       n       Ratio  Pa     ID  no.  C_x     C_Y" > $output

./general.csh	01	1550	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	03	2495	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	03	573	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	03	527	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	03	1738	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	03	1525	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	08	1703	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	09	928	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	10	2150	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	10	825	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	10	2689	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	12	1999	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	12	137	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	13	206	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	14	2010	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	14	275	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	14	861	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	15	479	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	15	338	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	15	925	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	16	2899	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	16	1	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	18	1	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	18	1201	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	18	3492	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	18	3649	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	19	2183	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	19	379	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	19	509	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	19	1	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	19	4949	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	22	962	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	22	284	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	23	1536	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	23	219	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	24	2611	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	24	1966	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	25	2432	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	25	1901	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	25	1	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	25	638	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	25	818	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	33	1030	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
./general.csh	33	1	${coef}	| awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk '(NR==1) {print($0)}' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}


echo "please type [ cl <  "${isofinal}" ] in IRAF environment.  (by:Ehsan Kourkchi 01 Jan 2010)"



