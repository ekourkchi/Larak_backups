#!/usr/bin/csh

setenv name $argv[1]
################################################################################################################
################################################################################################################
setenv coef $argv[2]
setenv output ${name}".F475W.ver"${coef}".sersic.catal.txt"
setenv isofinal ${name}".F475W.ver"${coef}".isofinal.cl"
echo " " > ${isofinal}
echo "               X_c       Y_c        mag     Re       n       Ratio  Pa     ID  no.  C_x     C_Y  n_814  CAT_ID" > $output
################################################################################################################
################################################################################################################
# wc gives the number of lines in a text file
setenv list ${name}"getno.csh"
setenv nline `wc -l $list | awk '{print($1)}'`
setenv i 1
echo $nline
while ($i <= $nline)
echo $i
setenv heade `awk -F: -v en="$i" '(NR==en) {print($1)}' $list`
setenv heade `echo $heade | awk '{print($1)}'`
echo $heade
if ( $heade == "./getno.csh" ) then
setenv radec `awk  -F: -v en="$i" '(NR==en) {print($0)}' $list`

setenv ra `echo $radec | awk '{print($3)}'`
setenv dec `echo $radec | awk '{print($4)}'`
setenv catid `echo $radec | awk '{print($2)}'`

echo $ra $dec

foreach ID (`awk '$1' no.lst`)

setenv xy `sky2xy -j 'h_v'$ID'_F814W_drz_cl_ver2.fits'  $ra $dec   | awk '{print($5" "$6)}'`
setenv n `./pixval $ID'.segment_1.fits' $xy`
setenv no_814 `./nodot $n`
setenv cat ${ID}'.cat'
#echo $no

#if ( $no != "0" ) echo $ID $no


setenv xy `sky2xy -j 'h_v'$ID'_F475W_drz_cl_ver2.fits'  $ra $dec   | awk '{print($5" "$6)}'`
#echo 'h_v'$ID'_F475W_drz_cl_ver2.fits'
setenv n `./pixval $ID'.segment.475_1.fits' $xy`
#echo $n
setenv no_475 `./nodot $n`
setenv cat ${ID}'.cat'
#echo $no


######### ID is the image number in filter F475W
######### no is the object numberin filter F475W


	if ( $no_475 != "0" ) then 
	
	echo $ID $no_814 $no_475
	./general_475.csh $ID  $no_475  ${coef} | awk '(NR==14 || NR==15) {print($0)}' > temp.temp ; awk -F: -v em="$no_814" -v et="$catid" '(NR==1) {print($0"  "em"  "et) }' temp.temp  >> $output ; awk '(NR==2) {print($4" "$5" "$6)}' temp.temp >> ${isofinal}
	
	endif




end

endif
set i=`echo "$i+1" | bc -l`
end

#echo ${results}




