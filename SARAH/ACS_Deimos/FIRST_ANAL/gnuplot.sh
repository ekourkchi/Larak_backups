#!/usr/bin/sh

# example:
# ./gnuplot.sh 01 1550 2.0 test 14 27 0.2 2.0

export galfit=$1_$2.galfit
#echo $galfit
export Re=`awk '(NR == 8){print($7)}' $galfit`
export n_ser=`awk '(NR == 8){print($8)}' $galfit`
export mag=`awk '(NR == 8){print($6)}' $galfit`

export Reff=`echo "sqrt(sqrt($Re*0.05))" | bc -l`
export Ref=`echo "($Re*0.05)" | bc -l | awk '{printf "%.2f",$1}'`
export n_cut=`echo $n_ser | awk '{printf "%.1f",$1}'`
export mag_cut=`echo $mag | awk '{printf "%.1f",$1}'`


gnuplot << EOF
set term postscript enhanced colo 16
set out "$galfit.ps"
set trange[$6:$5]
set xl "r^{0.25} [arcsec^{1/4}]"
set ylabel "{/Symbol m} [F814W mag {arcsec^{-2}}]"
set xr[$7:$8]
set yr[$6:$5]
set style line  1 linetype  3 linewidth 5
set style line  2 linetype  2 linewidth 3
set style line  3 linetype  3 linewidth 3
set style line  4 linetype  4 linewidth 3
set style line  5 linetype  5 linewidth 3
set style line  6 linetype  6 linewidth 3
set style line  7 linetype  7 linewidth 3
set style line  8 linetype  8 linewidth 2
set style line  9 linetype  9 linewidth 3
set style line 10 linetype 10 linewidth 3
set arrow 1 from $Reff,$5 to $Reff,$6 nohead ls 7
set label "`echo "mag=" $mag_cut`" at $Reff-0.45 ,  $6-2.4
set label "`echo "Re=" $Ref" [arcsec]"`" at $Reff-0.45 ,  $6-1.7
set label "`echo "n=" $n_cut`" at $Reff-0.45 ,  $6-1.0
set mxtics 2
set mytics 2
set xtics 0.2
set ytics 1
p "$1_$2.isogal.txt" u (0.472871*(\$1**0.25)*((1-\$6)**0.125)):(19.43185+\$18) title "Galaxy profile" w p ls 8, "$1_$2.isoser.txt" u (0.472871*(\$1**0.25)*((1-\$6)**0.125)):(19.43185+\$18) w l ls 1 title "Sersic fit"
EOF

mogrify -rotate 90 -format png $galfit.ps
