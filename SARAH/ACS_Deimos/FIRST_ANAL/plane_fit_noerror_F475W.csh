#!/usr/bin/csh

clear

setenv mu $argv[1]
setenv re $argv[2]
setenv sigma $argv[3]
setenv n $argv[4]
setenv mu_limit $argv[5]
setenv suffix $argv[6]

awk -v a=$mu -v b=$re -v c=$sigma '(NR>1){print($a+2.5*log(2*3.1415*$b*$b*0.0025)/log(10)" 0.0 "log($b*0.05*0.463)/log(10)" 0.0 "log($c)/log(10)" 0.0")}' deimos.sersic.sigma.F475W.lst > deimos.sersic.sigma.F475W.${suffix}.lst


awk -v a=$mu -v b=$re -v c=$sigma '(NR>1){print($a+2.5*log(2*3.1415*$b*$b*0.0025)/log(10)" 0.0 "log($b*0.05*0.463)/log(10)" 0.0 "log($c)/log(10)" 0.0")}' matko.sersic.sigma.F475W.lst > matko.sersic.sigma.F475W.${suffix}.lst

awk -v a=$mu -v b=$re -v c=$sigma '(NR>1){print($a+2.5*log(2*3.1415*$b*$b*0.0025)/log(10)" 0.0 "log($b*0.05*0.463)/log(10)" 0.0 "log($c)/log(10)" 0.0")}' cody.sersic.sigma.F475W.lst > cody.sersic.sigma.F475W.${suffix}.lst

more deimos.sersic.sigma.F475W.${suffix}.lst  > all.sersic.sigma.F475W.${suffix}.lst
more matko.sersic.sigma.F475W.${suffix}.lst  >> all.sersic.sigma.F475W.${suffix}.lst
more cody.sersic.sigma.F475W.${suffix}.lst  >> all.sersic.sigma.F475W.${suffix}.lst

setenv filename all.sersic.sigma.F475W.${suffix}.lst


idl > & logidl.out <<EOF
`echo ".com plane_fit"`
`echo "plane_fit, '"$filename"', "$n", "$mu_limit`
EOF

./PLANEFIT.EXPLICIT.X
set nline=`awk '($2=="S.D.") {print(NR)}' REPORT_PLNAE_EX`

echo
echo "   ******** THE PLANE EQUATION *******"
 if ( $n == 3 ) echo "       BETA1*X1+BETA2*X2+BETA3=X3"
 if ( $n == 2 ) echo "       BETA1*X1+BETA2*X3+BETA3=X2"
 if ( $n == 1 ) echo "       BETA1*X2+BETA2*X3+BETA3=X1"


echo "   ***********************************"
echo  "       IDL output without considering the erros:"
awk '(NR==2) {print("       BETA1:  "$1)}' PLANE
awk '(NR==2) {print("       BETA2:  "$2)}' PLANE
awk '(NR==2) {print("       BETA3:  "$3)}' PLANE

echo "   ***********************************"
echo  "       ODRPACK (Explicit/Double version) output with considering the erros:"
awk -F: -v n="$nline" '(NR>=n && NR<n+2) {print($0)}' REPORT_PLNAE_EX

setenv a `awk -v n="$nline" '(NR==n+2) {print($4)}' REPORT_PLNAE_EX`
setenv b `awk -v n="$nline" '(NR==n+2) {print($6)}' REPORT_PLNAE_EX`
idl > & logidl.out1 <<EOF
`echo ".com minus"`
`echo "minus, "$a", "$b`
EOF
setenv error `awk '{print($0)}' temp.tmp`
echo "                     " `awk -F: -v n="$nline" '(NR == n+2) {print($0)}' REPORT_PLNAE_EX` $error "=error"

setenv a `awk -v n="$nline" '(NR==n+3) {print($4)}' REPORT_PLNAE_EX`
setenv b `awk -v n="$nline" '(NR==n+3) {print($6)}' REPORT_PLNAE_EX`
idl > & logidl.out1 <<EOF
`echo ".com minus"`
`echo "minus, "$a", "$b`
EOF
setenv error `awk '{print($0)}' temp.tmp`
echo "                     " `awk -F: -v n="$nline" '(NR == n+3) {print($0)}' REPORT_PLNAE_EX` $error "=error"

setenv a `awk -v n="$nline" '(NR==n+4) {print($4)}' REPORT_PLNAE_EX`
setenv b `awk -v n="$nline" '(NR==n+4) {print($6)}' REPORT_PLNAE_EX`
idl > & logidl.out1 <<EOF
`echo ".com minus"`
`echo "minus, "$a", "$b`
EOF
setenv error `awk '{print($0)}' temp.tmp`
echo "                     " `awk -F: -v n="$nline" '(NR == n+4) {print($0)}' REPORT_PLNAE_EX` $error "=error"

echo
echo " Written by Ehsan Kourkchi - 13 June 2010"
echo


