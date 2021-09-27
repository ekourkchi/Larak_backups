#!/bin/sh

# example:
# ./gnuplot.sh 01 1550 2.5 title 14 27 0.02 10

# ./gnuplot.sh 01 1550 2.5 2536 14 27 0.02 10 1

export galfit=$1_$2.galfit.ver$3
#echo $galfit
export Re=`awk '(NR == 8){print($7)}' $galfit`
export n_ser=`awk '(NR == 8){print($8)}' $galfit`
export mag=`awk '(NR == 8){print($6)}' $galfit`

#export Reff=`echo "sqrt(sqrt($Re*0.05))" | bc -l`
export Reff=`echo "($Re*0.05)" | bc -l`

export Ref=`echo "($Re*0.05)" | bc -l | awk '{printf "%.2f",$1}'`
export n_cut=`echo $n_ser | awk '{printf "%.1f",$1}'`
export mag_cut=`echo $mag | awk '{printf "%.1f",$1}'`

 awk '($18!=0. &&  NR>41) {print($0)}' FIRST_ANAL/$1_$2.ver$3.isogal.txt    > FIRST_ANAL/isogal.tmp
 awk '($18!=0. &&  NR>41) {print($0)}' $1_$2.ver$3.isoser.txt    > isoser.tmp
 awk '($18!=0. &&  NR>41) {print($0)}' FIRST_ANAL/$1_$2.ver$3.isoser.txt    > FIRST_ANAL/isoser.tmp

if [ $9 -eq  1 ]; then
gnuplot << EOF
set term postscript enhanced colo 16 

set out "$galfit.paper.ps"
set trange[$6:$5]
set xl "r [arcsec]"  font "Helvetica,25"
set ylabel "{/Symbol m} [F814W mag {arcsec^{-2}}]"  font "Helvetica,25"
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
set style line 11 linetype -1 linewidth 2
set pointsize 1.5
set key 1,15.5
set arrow 1 from $Reff,$5 to $Reff,$6 nohead ls 7
#set arrow 2 from 0.07,$5 to 0.07,$6 nohead ls 11
set label "`echo "mag=" $mag_cut`" at 0.025 ,  $6-2.4-0.4   font "Helvetica,23"
set label "`echo "Re=" $Ref" [arcsec]"`" at 0.025 ,  $6-1.7-0.4 font "Helvetica,23"
set label "`echo "GMP" $4`" at 3 ,  16 font "Helvetica,30"
set label "`echo "n=" $n_cut`" at 0.025 ,  $6-1.0-0.4 font "Helvetica,23"
set label "`echo "PSF=~0.15\'\'"`" at 0.025 ,  $6-0.3-0.4 font "Helvetica,23"

set mytics 2
set ytics 1
set log x
set xtics 10
set mxtics 10


p "FIRST_ANAL/isogal.tmp" u ((\$1*0.05)*((1-\$6)**0.5)):(19.43185+\$18) title "Galaxy profile" w p ls 8, "FIRST_ANAL/isoser.tmp" u ((\$1*0.05)*((1-\$6)**0.5)):(19.43185+\$18) w l ls 1 title "Sersic fit" , "isoser.tmp" u ((\$1*0.05)*((1-\$6)**0.5)):(19.43185+\$18) w l ls 11 title "Sersic+Gauss fit", $6-6.5-2.5*log10(6*(exp(-(x)**2 / 2/(0.15/2.355)/(0.15/2.355)))) title "PSF" ls 8



EOF
fi


if [ $9 -eq  0 ]; then
gnuplot << EOF
set term postscript enhanced colo 16 

set out "$galfit.paper.ps"
set trange[$6:$5]
set xl "r [arcsec]"  font "Helvetica,25"
set ylabel "{/Symbol m} [F814W mag {arcsec^{-2}}]"  font "Helvetica,25"
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
set style line 11 linetype -1 linewidth 2
set pointsize 1.5
set key left
set arrow 1 from $Reff,$5 to $Reff,$6 nohead ls 7
set label "`echo "mag=" $mag_cut`" at 0.1 ,  $6-2.4   font "Helvetica,23"
set label "`echo "Re=" $Ref" [arcsec]"`" at 0.1 ,  $6-1.7 font "Helvetica,23"
#set label "`echo "GMP" $4`" at 0.025 ,  $6-0.7 font "Helvetica,30"
set label "`echo "n=" $n_cut`" at 0.1 ,  $6-1.0 font "Helvetica,23"
set mytics 2
set ytics 1
set log x
set xtics 10
set mxtics 10


p "FIRST_ANAL/isogal.tmp" u ((\$1*0.05)*((1-\$6)**0.5)):(19.43185+\$18) title "Galaxy profile" w p ls 8, "FIRST_ANAL/isoser.tmp" u ((\$1*0.05)*((1-\$6)**0.5)):(19.43185+\$18) w l ls 1 title "Sersic fit" 

EOF
fi
#set mxtics 2
#set xtics 0.2
# p "FIRST_ANAL/$1_$2.ver$3.isogal.txt" u (0.472871*(\$1**0.25)*((1-\$6)**0.125)):(19.43185+\$18) title "Galaxy profile" w p ls 8, "$1_$2.ver$3.isoser.txt" u (0.472871*(\$1**0.25)*((1-\$6)**0.125)):(19.43185+\$18) w l ls 11 title "Sersic+Gauss fit", "FIRST_ANAL/$1_$2.ver$3.isoser.txt" u (0.472871*(\$1**0.25)*((1-\$6)**0.125)):(19.43185+\$18) w l ls 1 title "Sersic fit"

gv $galfit".paper.ps"
#mogrify -rotate 90 -format png $galfit.paper.ps

#./psfilemaker.csh  $galfit.paper
#cp $galfit.paper.eps /media/SARAH/kaar/Cody.ehsan/.
#gv /media/SARAH/kaar/Cody.ehsan/$galfit.paper.eps &

