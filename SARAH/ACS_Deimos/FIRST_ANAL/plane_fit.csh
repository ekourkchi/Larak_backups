#!/usr/bin/csh

clear
setenv filename $argv[1]
setenv n $argv[2]


idl > & logidl.out <<EOF
`echo ".com plane_fit"`
`echo "plane_fit, '"$filename"', "$n`
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
awk -F: -v n="$nline" '(NR>=n && NR<n+5) {print($0)}' REPORT_PLNAE_EX

echo
echo " Written by Ehsan Kourkchi - 19 Jan 2010"
echo
