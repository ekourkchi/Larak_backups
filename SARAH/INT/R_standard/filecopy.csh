#!/usr/bin/csh

foreach ID ( `awk '$1' $argv` )

cp -rf /home/user/ehsan/R.source/$ID*fits . > copy.log



end
rm -f copy.log
