#!/usr/bin/csh


setenv ACSID $argv[1]
setenv no $argv[2]
setenv ver  $argv[3]
setenv gmp $argv[4]
setenv ra  $argv[5]
setenv dec  $argv[6]
setenv type  $argv[7]
setenv sig  $argv[8]
setenv ersig  $argv[9]
setenv backsize  $argv[10]

setenv galin $ACSID'_'$no'.gal.in.ver'$ver


#####################################33
./asymetry.csh $ACSID $no 1.0 ${backsize} > logfile.log
set a_rms=`awk '(NR==1){print($1)}' logfile.log`
set a_abs=`awk '(NR==1){print($2)}' logfile.log`

set residu_rms=`awk '(NR==2){print($1)}' logfile.log`
set residu_abs=`awk '(NR==2){print($2)}' logfile.log`
################################################3
##################################################
################################################
setenv cat ${ACSID}'.cat'
set n_line=`echo "$no+29" | bc -l`
setenv xy `awk -F: -v n="$n_line" '(NR==n) {print($0)}' ${cat}`
setenv se_mag `echo $xy | awk '{printf "%.1f",$14}'`
setenv se_ermag `echo $xy | awk '{printf "%.1f",$15}'`

setenv r80 `echo $xy | awk '{print($26)}'`
setenv r20 `echo $xy | awk '{print($23)}'`

setenv kpcr80 `echo $xy | awk '{printf "%.2f",$26*0.05*0.4}'`
setenv kpcr20 `echo $xy | awk '{printf "%.2f",$23*0.05*0.4}'`

setenv concentration `echo $xy | awk '{print(5.0*log($26/$23)/log(10.))}'`

set se_reee=`awk '(NR==45) {printf "%.1f",$2}' $galin`
setenv se_ree `echo "$se_reee*0.05*0.4" | bc -l`
setenv se_re `echo $se_ree | awk '{printf "%.2f",$1}'`

setenv se_av_mue `echo $se_mag $se_reee | awk '{printf "%.1f",$1+2.5*log(2*3.1415*$2*$2*0.0025)/log(10.)}'`


setenv galfit $ACSID'_'$no'.galfit.ver'$ver


# mag
setenv fit_mag `awk '(NR==8) {printf "%.1f",$6}' $galfit`
setenv fit_ermag `awk '(NR==9) {printf "%.1f",$4}' $galfit`
# Re
setenv fit_reee `awk '(NR==8) {printf "%.1f", $7}' $galfit`
setenv fit_erreee `awk '(NR==9) {printf "%.1f",$5}' $galfit`
setenv fit_ree `echo "$fit_reee*0.05*0.4" | bc -l`
setenv fit_re `echo $fit_ree | awk '{printf "%.2f",$1}'`
setenv fit_erree `echo "$fit_erreee*0.05*0.4" | bc -l`
setenv fit_erre `echo $fit_erree | awk '{printf "%.2f",$1}'`
# n
setenv fit_n `awk '(NR==8) {printf "%.2f",$8}' $galfit`
setenv fit_ern `awk '(NR==9) {printf "%.2f",$6}' $galfit`
# chi2
setenv chi2 `awk '(NR==13) {printf "%.3f",$3}' $galfit`


setenv fit_av_mue `echo $fit_mag $fit_reee | awk '{printf "%.1f",$1+2.5*log(2*3.1415*$2*$2*0.0025)/log(10.)}'`


setenv gal $ACSID'_'$no'.ver'$ver'.isogal.txt'
setenv ser $ACSID'_'$no'.ver'$ver'.isoser.txt'
 if ( -e $gal && -e $ser ) then
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $gal > tmp.isogal.txt
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $ser > tmp.isoser.txt
idl > & logidl.out <<EOF
`echo ".com mu_e"`
`echo "mu_e, "$fit_mag", "$fit_reee", "$fit_n", 0.05"`
EOF
setenv mu `awk '{print($0)}' temp.tmp`
 else
setenv mu "0 0 0 0 0 0"
 endif

setenv se_mue `echo $mu | awk '{printf "%.1f",$3}'`
setenv se_mu0 `echo $mu | awk '{printf "%.1f",$4}'`
setenv fit_mue `echo $mu | awk '{printf "%.1f",$5}'`
setenv fit_mu0 `echo $mu | awk '{printf "%.1f",$6}'`


setenv quot '\042'
more tab01.ht


if ( -e "newpng/"${galfit}".png" ) then
echo "<P><IMG SRC=${quot}newpng/"${galfit}".png${quot} NAME=${quot}graphics1${quot} ALIGN=RIGHT WIDTH=529 HEIGHT=369 BORDER=0><BR></P>"
else
echo "<P><IMG SRC=${quot}./"${galfit}".png${quot} NAME=${quot}graphics1${quot} ALIGN=RIGHT WIDTH=529 HEIGHT=369 BORDER=0><BR></P>"
endif


echo "</TD>"
echo "</TR>"
echo "<TR>"
echo "<TD WIDTH=100% VALIGN=TOP>"



#################################################################################################################
setenv filjpeg $ACSID'_'$no'.gal.out.ver3.0.galaxy.filgal.jpg'
setenv residu $ACSID'_'$no'.gal.out.ver3.0.residu'
setenv fitresidu $residu"_normal.jpg"
echo "<P ALIGN=CENTER><IMG SRC=${quot}./"${filjpeg}"${quot} NAME=${quot}graphics1${quot} ALIGN=CENTER WIDTH=200 HEIGHT=200 BORDER=0><IMG SRC=${quot}./"${fitresidu}"${quot} NAME=${quot}graphics1${quot} ALIGN=CENTER WIDTH=200 HEIGHT=200 BORDER=0></P>"
#################################################################################################################

more tab03.ht

echo "<BR><FONT SIZE=2><B>(Left)</B> Galaxy Asymmetry Residual (Image-Image180) within Kron Radius<B> (Right)</B> Normalized galfit output residual</FONT></P>"

more tab03.5.ht

echo " <P ALIGN=CENTER><IMG SRC=${quot}./"${ACSID}"_"${no}".gal.out.ver"${ver}".png${quot} NAME=${quot}graphics2${quot} ALIGN=LEFT WIDTH=700 HEIGHT=200 BORDER=0><FONT SIZE=2>"

more tab05.ht



echo "<P><FONT SIZE=3>GMP: "${gmp}" </FONT></P>"
echo "<P><FONT SIZE=3>Filter = F814W</FONT></P>"
	echo "<TABLE WIDTH=%100 BORDER=1 CELLPADDING=4 CELLSPACING=0 STYLE=${quot}page-break-before: always; page-break-inside: avoid${quot}>"
	echo "	<COL WIDTH=%100>"
	echo "	<TR>"
	echo "		<TD WIDTH=348  VALIGN=TOP BGCOLOR=${quot}#e6e6ff${quot} >"
	echo "<P STYLE=${quot}background: #ffffff${quot}><FONT COLOR=${quot}#ffffff${quot}><B><SPAN STYLE=${quot}background: #ff420e${quot}>     SExtractor - Gal. Profile </SPAN></B></FONT></P>"
	echo "<P><FONT SIZE=3>mag = "${se_mag}" ± "${se_ermag}" mag</FONT></P>"
	echo "<P><FONT SIZE=3>Re = "${se_re}" (kpc)</FONT></P>"
	
	
	more tab07.ht
	
	echo "= "${se_av_mue}"<FONT COLOR=${quot}#000000${quot}><SPAN STYLE=${quot}text-decoration: none${quot}>"
	
	more tab09.ht
	
	echo ${se_mue}" mag/srcsec</SPAN></SPAN></FONT></SPAN></FONT><FONT"
	
	more tab11.ht
	
	echo ${se_mu0}" mag/srcsec</SPAN></SPAN></FONT></SPAN></FONT><FONT"
	more tab12.5.ht

	echo "		</TD>"
	echo "	</TR>"
	echo "</TABLE>"

echo "<P><FONT SIZE=3>ID: "$ACSID'_'$no"</FONT></P>"

more tab13.ht

echo "<P><FONT SIZE=3>RA: "${ra}" (J2000)</FONT></P>"
echo "<P><FONT SIZE=3>Type: "${type}" </FONT></P>"

	echo "<TABLE WIDTH=%100 BORDER=1 CELLPADDING=4 CELLSPACING=0 STYLE=${quot}page-break-before: always; page-break-inside: avoid${quot}>"
	echo "	<COL WIDTH=%100>"
	echo "	<TR>"
	echo "		<TD WIDTH=348  VALIGN=TOP BGCOLOR=${quot}#e6e6e6${quot} >"
	echo "<P STYLE=${quot}background: #ffffff${quot}><FONT COLOR=${quot}#ffffff${quot}><B><SPAN STYLE=${quot}background: #ff420e${quot}><SPAN STYLE=${quot}background: #008000${quot}>Galfit - Sersic Model</SPAN></SPAN></B></FONT></P>"
	echo "<P><FONT SIZE=3>mag = "${fit_mag}" ± "${fit_ermag}" mag</FONT></P>"
	echo "<P><FONT SIZE=3>Re = "${fit_re}" <FONT COLOR=${quot}#000000${quot}><SPAN STYLE=${quot}text-decoration: none${quot}><FONT FACE=${quot}Arial, sans-serif${quot}><SPAN STYLE=${quot}font-style: normal${quot}><SPAN STYLE=${quot}font-weight: normal${quot}>±</SPAN></SPAN></FONT></SPAN></FONT>"
	echo ${fit_erre}" (kpc)</FONT></P>"
	more tab07.ht
	
	echo "= "${fit_av_mue}"<FONT COLOR=${quot}#000000${quot}><SPAN STYLE=${quot}text-decoration: none${quot}>"
	
	more tab09.ht
	
	echo ${fit_mue}" mag/srcsec</SPAN></SPAN></FONT></SPAN></FONT><FONT"
	
	more tab11.ht
	
	echo ${fit_mu0}" mag/srcsec</SPAN></SPAN></FONT></SPAN></FONT><FONT"
	

	echo "	</TR>"
	echo "</TABLE>"

more tab15.ht

echo "<P><FONT SIZE=3>DEC: "${dec}" (J2000)</FONT></P>"
echo "<P STYLE=${quot}font-style: normal; font-weight: normal; text-decoration: none${quot}>"
echo "<FONT COLOR=${quot}#000000${quot}><FONT FACE=${quot}Arial, sans-serif${quot}><FONT SIZE=3>σ="
echo ${sig}" ± "${ersig}" (km/s) </FONT></FONT></FONT></P>"
echo "<P><FONT SIZE=3>n= "${fit_n}" <FONT COLOR=${quot}#000000${quot}><SPAN STYLE=${quot}text-decoration: none${quot}><FONT FACE=${quot}Arial, sans-serif${quot}><SPAN STYLE=${quot}font-style: normal${quot}><SPAN STYLE=${quot}font-weight: normal${quot}>±</SPAN></SPAN></FONT></SPAN></FONT>"
	echo ${fit_ern}"</FONT></P>"
echo "<P><FONT SIZE=3>Chi^2/ndof: "${chi2}"</FONT></P>"



echo "<P><FONT SIZE=3>A_rms: "${a_rms}"</FONT></P>"
echo "<P><FONT SIZE=3>A_abs: "${a_abs}"</FONT></P>"

echo "<P><FONT SIZE=3>Residu_rms: "${residu_rms}"</FONT></P>"
echo "<P><FONT SIZE=3>Residu_abs: "${residu_abs}"</FONT></P>"

echo "<P><FONT SIZE=3>r80: "${kpcr80}" (kpc) </FONT></P>"
echo "<P><FONT SIZE=3>r20: "${kpcr20}" (kpc) </FONT></P>"
echo "<P><FONT SIZE=3>C=5*log(r80/r20)= "${concentration}"</FONT></P>"



more tab17.ht











