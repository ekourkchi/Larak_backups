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


awk '{print( $1 "_1.cor")}' $ID.lst > $ID'_1.cor'
awk '{print( $1 "_2.cor")}' $ID.lst > $ID'_2.cor'
awk '{print( $1 "_3.cor")}' $ID.lst > $ID'_3.cor'
awk '{print( $1 "_4.cor")}' $ID.lst > $ID'_4.cor'


awk '{print( $1 "_1.cor.astro")}' $ID.lst > $ID'_1.cor.astro'
awk '{print( $1 "_2.cor.astro")}' $ID.lst > $ID'_2.cor.astro'
awk '{print( $1 "_3.cor.astro")}' $ID.lst > $ID'_3.cor.astro'
awk '{print( $1 "_4.cor.astro")}' $ID.lst > $ID'_4.cor.astro'

awk '{print( "reg.weight." $1 "_1.fits")}' $ID.lst > $ID'_1.reg.weight'
awk '{print( "reg.weight." $1 "_2.fits")}' $ID.lst > $ID'_2.reg.weight'
awk '{print( "reg.weight." $1 "_3.fits")}' $ID.lst > $ID'_3.reg.weight'
awk '{print( "reg.weight." $1 "_4.fits")}' $ID.lst > $ID'_4.reg.weight'

awk '{print(  $1 "_1.check.fits")}' $ID.lst > $ID'_1.check'
awk '{print(  $1 "_2.check.fits")}' $ID.lst > $ID'_2.check'
awk '{print(  $1 "_3.check.fits")}' $ID.lst > $ID'_3.check'
awk '{print(  $1 "_4.check.fits")}' $ID.lst > $ID'_4.check'

awk '{print(  $1 "_1.corr.fits")}' $ID.lst > $ID'_1.corr'
awk '{print(  $1 "_2.corr.fits")}' $ID.lst > $ID'_2.corr'
awk '{print(  $1 "_3.corr.fits")}' $ID.lst > $ID'_3.corr'
awk '{print(  $1 "_4.corr.fits")}' $ID.lst > $ID'_4.corr'


