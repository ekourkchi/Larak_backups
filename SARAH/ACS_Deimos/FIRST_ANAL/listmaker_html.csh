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



setenv quot '\042'


echo ${gmp} ${ra} ${dec} ${chi2} ${a_rms} ${a_abs} ${residu_rms} ${residu_abs} ${kpcr80} ${kpcr20} ${concentration} ${se_av_mue} ${fit_av_mue}
















