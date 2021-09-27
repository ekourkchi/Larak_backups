#!/usr/bin/csh


setenv  psf_root $argv[1]

# x and y are positions on drizzled final images
setenv  x $argv[2]
setenv  y $argv[3]

# x and y converts to x0 and y0 which are coordinates on WFC1 or WFC2 regarding to ACS configuration. Linear calculation is applied at this stage.

setenv tmp `./wfc_finder.x $x $y`
setenv wfc `echo $tmp | awk '{print ($1)}'`
# echo $wfc
setenv x0 `echo $tmp | awk '{print ($2)}'`
setenv y0 `echo $tmp | awk '{print ($3)}'`
# echo $x0
# echo $y0


# filter used for observation with ACS 
setenv filter f475w


tiny1 test > & logfile.out <<EOF
`echo 15`
`echo $wfc`
`echo $x0 $y0`
`echo $filter`
`echo 2`
`echo 3000`
`echo 3`
`echo $psf_root`
EOF

tiny2 test   >> & logfile.out
tiny3 test   >> & logfile.out

exit
