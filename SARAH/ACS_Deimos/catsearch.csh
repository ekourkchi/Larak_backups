#!/usr/bin/csh

setenv ID $argv[1]
setenv ra $argv[2]
setenv dec $argv[3]

set ra0=`hmstodecimal $ra`
set dec0=`dmstodecimal $dec`


idl > & logidl.out <<EOF
`echo ".com assoc"`
`echo "assoc, 'cat_t1_RADEC.txt', " ${ra0} ", " ${dec0}`
EOF

set no=`awk '{print($1)}' temp.tmp`
set ra0=`awk '{print($2)}' temp.tmp`
set dec0=`awk '{print($3)}' temp.tmp`
set ra1=`decimaltohms $ra0`
set dec1=`decimaltodms $dec0`


setenv  xy `awk -F: -v n="$no" '(NR == n ) {print($0)}' cat_t1.txt`
set mag=`echo $xy | awk '{print($86)}'`
set Re=`echo $xy | awk '{print($87)}'`
set logn=`echo $xy | awk '{print($88)}'`

idl > & logidl.out <<EOF
`echo ".com pow"`
`echo "pow, "$logn`
EOF

set n=`more temp.tmp | awk '{print($1)}'`

echo $ID $ra $dec "[ "$ra1 $dec1" ]" $mag $Re $n 









