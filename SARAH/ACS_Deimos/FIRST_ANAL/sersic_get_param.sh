#!/bin/sh

# example:
# ./gnuplot.sh 01 1550 2.0 test 14 27 0.2 2.0

export galfit=$1_$2.galfit.ver$3
#echo $galfit
export Re=`awk '(NR == 8){print($7)}' $galfit`
export n_ser=`awk '(NR == 8){print($8)}' $galfit`
export mag=`awk '(NR == 8){print($6)}' $galfit`

export Reff=`echo "sqrt(sqrt($Re*0.05))" | bc -l`
export Ref=`echo "($Re*0.05)" | bc -l`
export n_cut=`echo $n_ser | awk '{printf "%.1f",$1}'`
export mag_cut=`echo $mag | awk '{printf "%.1f",$1}'`

awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $1_$2.ver$3.isogal.txt > tmp.isogal.txt
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $1_$2.ver$3.isoser.txt > tmp.isoser.txt

idl  << EOF > logidl.out
 mu_e, $mag, $Re, $n_ser ,0.05
EOF






