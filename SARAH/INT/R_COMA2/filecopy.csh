#!/usr/bin/csh

foreach ID ( `awk '$1' $argv` )

cp -rf /usr/home2/INT/SII/$ID*fits . > copy.log



end
rm -f copy.log
