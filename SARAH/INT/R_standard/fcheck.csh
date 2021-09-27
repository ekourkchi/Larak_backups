#!/usr/bin/csh

setenv ID $argv[1]
foreach ID ( awk '{print($1 "_1.fits")}' $ID.lst > $ID'_1'.lst )


foreach ID ( dfits $ID | fitsort WFFBAND )




end
