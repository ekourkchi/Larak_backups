#!/bin/csh

if (-e "temp.txt") then
rm temp.txt
endif


if (-e "temp1.txt") then
rm temp1.txt
endif


foreach ID ( `awk '{print $3}' $argv` )
hmstodecimal $ID >> temp.txt
end


foreach ID ( `awk '{print $4}' $argv` )
dmstodecimal $ID >> temp1.txt
end

pr -m -t -s\  ${argv} temp.txt  temp1.txt | awk '{print $1" " $2" "$5"  "$6}' > 'decimal_'${argv}
#pr -m -t -s\  temp.txt  temp1.txt



