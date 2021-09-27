#!/usr/bin/csh

clear

setenv mu $argv[1]
setenv re $argv[2]
setenv sigma $argv[3]
setenv n $argv[4]
setenv mu_limit $argv[5]
setenv suffix $argv[6]

awk -v a=$mu -v b=$re -v c=$sigma '{print($a" 0.0 "log($b*0.05)/log(10)" 0.0 "log($c)/log(10)" 0.0")}' deimos.all.sersic.sigma.lst > deimos.all.sersic.sigma.${suffix}.lst


awk -v a=$mu -v b=$re -v c=$sigma '{print($a" 0.0 "log($b*0.05)/log(10)" 0.0 "log($c)/log(10)" 0.0")}' matko.all.sersic.sigma.lst > matko.all.sersic.sigma.${suffix}.lst

awk -v a=$mu -v b=$re -v c=$sigma '{print($a" 0.0 "log($b*0.05)/log(10)" 0.0 "log($c)/log(10)" 0.0")}' cody.all.sersic.sigma.lst > cody.all.sersic.sigma.${suffix}.lst

more deimos.all.sersic.sigma.${suffix}.lst  > all.all.sersic.sigma.${suffix}.lst
more matko.all.sersic.sigma.${suffix}.lst  >> all.all.sersic.sigma.${suffix}.lst
more cody.all.sersic.sigma.${suffix}.lst  >> all.all.sersic.sigma.${suffix}.lst

setenv filename all.all.sersic.sigma.${suffix}.lst


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
echo " Written by Ehsan Kourkchi - 21 Jan 2010"
echo


