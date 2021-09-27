#!/bin/csh


foreach ID ( `awk '$1' $argv[1]` )

pr -m -t -s\  $ID $argv[2] | awk '{print $1" " $2" " $5" " $6}' > $ID'.astro'


end
