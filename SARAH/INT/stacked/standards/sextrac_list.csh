#!/usr/bin/csh

foreach ID ( `awk '$1' $argv[1]` )


./sextract.csh $ID


end
