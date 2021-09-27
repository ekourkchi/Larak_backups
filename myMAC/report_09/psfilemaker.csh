#!/usr/bin/csh

setenv ID $argv[1]


ps2eps -l -O -n -f -B ${ID}'.ps'
ps2pdf -dEPSCrop ${ID}'.eps'
pdf2ps ${ID}'.pdf'


