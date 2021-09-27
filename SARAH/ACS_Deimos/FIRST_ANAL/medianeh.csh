#!/usr/bin/csh

setenv ver 2.5
setenv ACSID $argv[1]
setenv no $argv[2]
setenv galin $ACSID'_'$no'.ver'$ver'.isogal.txt'

awk '(NR>42){print($6)}' $galin > tmp.tmp


idl > & logidl.out <<EOF
`echo "readcol, 'tmp.tmp', a, /silent"`
`echo "print, median(a)"`
EOF



setenv n `more logidl.out |wc -l`

# echo $n


setenv med `awk  -v s="$n" '(NR==s){print($1)}' logidl.out`

echo $ACSID $no $med





