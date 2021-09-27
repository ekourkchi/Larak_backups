#!/usr/bin/csh



setenv ID $argv[1]

foreach FILE (`awk '$1' $ID.lst`)

setenv nomfile $FILE'_1.star'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile $FILE'_2.star'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile $FILE'_3.star'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile $FILE'_4.star'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile 'xy_'$FILE'_1.star'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile 'xy_'$FILE'_2.star'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile 'xy_'$FILE'_3.star'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile 'xy_'$FILE'_4.star'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile 'sh'$FILE'_1.fits'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile  'sh'$FILE'_2.fits'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile 'sh'$FILE'_3.fits'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile 'sh'$FILE'_4.fits'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif


end

setenv nomfile $ID'_1.geomap'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile $ID'_2.geomap'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile $ID'_3.geomap'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

setenv nomfile $ID'_4.geomap'
if (-e $nomfile) then
mv $nomfile  $nomfile'~'
endif

