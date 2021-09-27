#!/usr/bin/csh



setenv ID $argv[1]

awk '{print($1 "_1.fits")}' $ID.lst > $ID'_1.lst'
awk '{print($1 "_2.fits")}' $ID.lst > $ID'_2.lst'
awk '{print($1 "_3.fits")}' $ID.lst > $ID'_3.lst'
awk '{print($1 "_4.fits")}' $ID.lst > $ID'_4.lst'


awk '{print($1 "_1.star")}' $ID.lst > $ID'_1.star'
awk '{print($1 "_2.star")}' $ID.lst > $ID'_2.star'
awk '{print($1 "_3.star")}' $ID.lst > $ID'_3.star'
awk '{print($1 "_4.star")}' $ID.lst > $ID'_4.star'


awk '{print("xy_" $1 "_1.star")}' $ID.lst > ref.$ID'_1.lst'
awk '{print("xy_" $1 "_2.star")}' $ID.lst > ref.$ID'_2.lst'
awk '{print("xy_" $1 "_3.star")}' $ID.lst > ref.$ID'_3.lst'
awk '{print("xy_" $1 "_4.star")}' $ID.lst > ref.$ID'_4.lst'





