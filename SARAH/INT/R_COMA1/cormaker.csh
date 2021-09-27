#!/usr/bin/csh

setenv sarahmscor $argv[2]
setenv nomfile  ${sarahmscor}'.cor'
awk '{print($1"  "$2)}'  $sarahmscor  >   $nomfile

if (-e $nomfile'.lst') then
rm $nomfile'.lst'
endif

foreach ID ( `awk '$1' $argv[1]` )

echo ${sarahmscor}'.cor' >> $nomfile'.lst'


end
