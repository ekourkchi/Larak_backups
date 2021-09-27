#!/usr/bin/csh

setenv ver 2.5
setenv ACSID $argv[1]
setenv no $argv[2]
setenv galin $ACSID'_'$no'.gal.in.ver'$ver

set mag=`awk '(NR==44) {print($2)}' $galin`
set re=`awk '(NR==45) {print($2)}' $galin`
set axis=`awk '(NR==47) {print($2)}' $galin`
set pa=`awk '(NR==48) {print($2)}' $galin`

##############################################################
setenv ver 1.0
setenv galfit $ACSID'_'$no'.galfit.ver'$ver

# mag
setenv results1 " "
setenv results1 $results1" "`awk '(NR==8) {print($6)}' $galfit`
setenv results1 $results1" "`awk '(NR==9) {print($4)}' $galfit`

# Re
setenv results2 " "
setenv results2 $results2" "`awk '(NR==8) {print($7)}' $galfit`
setenv results2 $results2" "`awk '(NR==9) {print($5)}' $galfit`

# n
setenv results3 " "
setenv results3 $results3" "`awk '(NR==8) {print($8)}' $galfit`
setenv results3 $results3" "`awk '(NR==9) {print($6)}' $galfit`

# b/a
setenv results4 " "
setenv results4 $results4" "`awk '(NR==8) {print($9)}' $galfit`
setenv results4 $results4" "`awk '(NR==9) {print($7)}' $galfit`

# PA
setenv results5 " "
setenv results5 $results5" "`awk '(NR==8) {print($10)}' $galfit`
setenv results5 $results5" "`awk '(NR==9) {print($8)}' $galfit`


setenv mag `echo $results1 | awk '{print($1)}'`
setenv re `echo $results2 | awk '{print($1)}'`
setenv sersic `echo $results3 | awk '{print($1)}'`
setenv gal $ACSID'_'$no'.ver'$ver'.isogal.txt'
setenv ser $ACSID'_'$no'.ver'$ver'.isoser.txt'
 if ( -e $gal && -e $ser ) then
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $gal > tmp.isogal.txt
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $ser > tmp.isoser.txt
idl > & logidl.out <<EOF
`echo ".com mu_e"`
`echo "mu_e, "$mag", "$re", "$sersic", 0.05"`
EOF
setenv mu `awk '{print($0)}' temp.tmp`
 else
setenv mu "0 0 0 0 0 0"
 endif
##############################################################
##############################################################
setenv ver 1.2
setenv galfit $ACSID'_'$no'.galfit.ver'$ver

setenv results11 " "
setenv results11 $results11" "`awk '(NR==8) {print($6)}' $galfit`
setenv results11 $results11" "`awk '(NR==9) {print($4)}' $galfit`

setenv results12 " "
setenv results12 $results12" "`awk '(NR==8) {print($7)}' $galfit`
setenv results12 $results12" "`awk '(NR==9) {print($5)}' $galfit`

setenv results13 " "
setenv results13 $results13" "`awk '(NR==8) {print($8)}' $galfit`
setenv results13 $results13" "`awk '(NR==9) {print($6)}' $galfit`

setenv results14 " "
setenv results14 $results14" "`awk '(NR==8) {print($9)}' $galfit`
setenv results14 $results14" "`awk '(NR==9) {print($7)}' $galfit`

setenv results15 " "
setenv results15 $results15" "`awk '(NR==8) {print($10)}' $galfit`
setenv results15 $results15" "`awk '(NR==9) {print($8)}' $galfit`

setenv mag `echo $results11 | awk '{print($1)}'`
setenv re `echo $results12 | awk '{print($1)}'`
setenv sersic `echo $results13 | awk '{print($1)}'`
setenv gal $ACSID'_'$no'.ver'$ver'.isogal.txt'
setenv ser $ACSID'_'$no'.ver'$ver'.isoser.txt'
 if ( -e $gal && -e $ser ) then
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $gal > tmp.isogal.txt
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $ser > tmp.isoser.txt
idl > & logidl.out <<EOF
`echo ".com mu_e"`
`echo "mu_e, "$mag", "$re", "$sersic", 0.05"`
EOF
setenv mu1 `awk '{print($0)}' temp.tmp`
 else
setenv mu1 "0 0 0 0 0 0"
 endif
##############################################################
##############################################################
setenv ver 2.0
setenv galfit $ACSID'_'$no'.galfit.ver'$ver

setenv results21 " "
setenv results21 $results21" "`awk '(NR==8) {print($6)}' $galfit`
setenv results21 $results21" "`awk '(NR==9) {print($4)}' $galfit`

setenv results22 " "
setenv results22 $results22" "`awk '(NR==8) {print($7)}' $galfit`
setenv results22 $results22" "`awk '(NR==9) {print($5)}' $galfit`

setenv results23 " "
setenv results23 $results23" "`awk '(NR==8) {print($8)}' $galfit`
setenv results23 $results23" "`awk '(NR==9) {print($6)}' $galfit`

setenv results24 " "
setenv results24 $results24" "`awk '(NR==8) {print($9)}' $galfit`
setenv results24 $results24" "`awk '(NR==9) {print($7)}' $galfit`

setenv results25 " "
setenv results25 $results25" "`awk '(NR==8) {print($10)}' $galfit`
setenv results25 $results25" "`awk '(NR==9) {print($8)}' $galfit`


setenv mag `echo $results21 | awk '{print($1)}'`
setenv re `echo $results22 | awk '{print($1)}'`
setenv sersic `echo $results23 | awk '{print($1)}'`
setenv gal $ACSID'_'$no'.ver'$ver'.isogal.txt'
setenv ser $ACSID'_'$no'.ver'$ver'.isoser.txt'
 if ( -e $gal && -e $ser ) then
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $gal > tmp.isogal.txt
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $ser > tmp.isoser.txt
idl > & logidl.out <<EOF
`echo ".com mu_e"`
`echo "mu_e, "$mag", "$re", "$sersic", 0.05"`
EOF
setenv mu2 `awk '{print($0)}' temp.tmp`
 else
setenv mu2 "0 0 0 0 0 0"
 endif
##############################################################
##############################################################
setenv ver 2.5
setenv galfit $ACSID'_'$no'.galfit.ver'$ver

setenv results31 " "
setenv results31 $results31" "`awk '(NR==8) {print($6)}' $galfit`
setenv results31 $results31" "`awk '(NR==9) {print($4)}' $galfit`

setenv results32 " "
setenv results32 $results32" "`awk '(NR==8) {print($7)}' $galfit`
setenv results32 $results32" "`awk '(NR==9) {print($5)}' $galfit`

setenv results33 " "
setenv results33 $results33" "`awk '(NR==8) {print($8)}' $galfit`
setenv results33 $results33" "`awk '(NR==9) {print($6)}' $galfit`

setenv results34 " "
setenv results34 $results34" "`awk '(NR==8) {print($9)}' $galfit`
setenv results34 $results34" "`awk '(NR==9) {print($7)}' $galfit`

setenv results35 " "
setenv results35 $results35" "`awk '(NR==8) {print($10)}' $galfit`
setenv results35 $results35" "`awk '(NR==9) {print($8)}' $galfit`

setenv mag `echo $results31 | awk '{print($1)}'`
setenv re `echo $results32 | awk '{print($1)}'`
setenv sersic `echo $results33 | awk '{print($1)}'`
setenv gal $ACSID'_'$no'.ver'$ver'.isogal.txt'
setenv ser $ACSID'_'$no'.ver'$ver'.isoser.txt'
 if ( -e $gal && -e $ser ) then
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $gal > tmp.isogal.txt
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $ser > tmp.isoser.txt
idl > & logidl.out <<EOF
`echo ".com mu_e"`
`echo "mu_e, "$mag", "$re", "$sersic", 0.05"`
EOF
setenv mu3 `awk '{print($0)}' temp.tmp`
 else
setenv mu3 "0 0 0 0 0 0"
 endif
##############################################################
##############################################################
setenv ver 3.0
setenv galfit $ACSID'_'$no'.galfit.ver'$ver

setenv results41 " "
setenv results41 $results41" "`awk '(NR==8) {print($6)}' $galfit`
setenv results41 $results41" "`awk '(NR==9) {print($4)}' $galfit`

setenv results42 " "
setenv results42 $results42" "`awk '(NR==8) {print($7)}' $galfit`
setenv results42 $results42" "`awk '(NR==9) {print($5)}' $galfit`

setenv results43 " "
setenv results43 $results43" "`awk '(NR==8) {print($8)}' $galfit`
setenv results43 $results43" "`awk '(NR==9) {print($6)}' $galfit`

setenv results44 " "
setenv results44 $results44" "`awk '(NR==8) {print($9)}' $galfit`
setenv results44 $results44" "`awk '(NR==9) {print($7)}' $galfit`

setenv results45 " "
setenv results45 $results45" "`awk '(NR==8) {print($10)}' $galfit`
setenv results45 $results45" "`awk '(NR==9) {print($8)}' $galfit`

setenv mag `echo $results41 | awk '{print($1)}'`
setenv re `echo $results42 | awk '{print($1)}'`
setenv sersic `echo $results43 | awk '{print($1)}'`
setenv gal $ACSID'_'$no'.ver'$ver'.isogal.txt'
setenv ser $ACSID'_'$no'.ver'$ver'.isoser.txt'
 if ( -e $gal && -e $ser ) then
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $gal > tmp.isogal.txt
awk '(NR > 41) {print($1*sqrt(1-$6)"  "$18+19.43185)}' $ser > tmp.isoser.txt
idl > & logidl.out <<EOF
`echo ".com mu_e"`
`echo "mu_e, "$mag", "$re", "$sersic", 0.05"`
EOF
setenv mu4 `awk '{print($0)}' temp.tmp`
 else
setenv mu4 "0 0 0 0 0 0"
 endif
##############################################################



echo $mag $re $axis $pa $results1 $results2 $results3 $results4 $results5 $results11 $results12 $results13 $results14 $results15 $results21 $results22 $results23 $results24 $results25 $results31 $results32 $results33 $results34 $results35 $results41 $results42 $results43 $results44 $results45 $mu $mu1 $mu2 $mu3 $mu4



#1 SEx AUTO MAG
#2 SEx Re
#3 SEx AXIS RATIO (b/a)
#4 SEx PA

#5 GALFIT MAG           /  SIZE=1.0 (VER1.0)
#6 GALFIT ERR_MAG           /  SIZE=1.0 (VER1.0)
#7 GALFIT Re           /  SIZE=1.0 (VER1.0)
#8 GALFIT ERR_Re           /  SIZE=1.0 (VER1.0)
#9 GALFIT n           /  SIZE=1.0 (VER1.0)
#10 GALFIT ERR_n           /  SIZE=1.0 (VER1.0)
#11 GALFIT AXIS RATIO (b/a)           /  SIZE=1.0 (VER1.0)
#12 GALFIT ERR_AXIS RATIO (err_b/a)           /  SIZE=1.0 (VER1.0)
#13 GALFIT PA           /  SIZE=1.0 (VER1.0)
#14 GALFIT ERR_PA           /  SIZE=1.0 (VER1.0)

#15 GALFIT MAG           /  SIZE=1.2 (VER1.2)
#16 GALFIT ERR_MAG           /  SIZE=1.2 (VER1.2)
#17 GALFIT Re           /  SIZE=1.2 (VER1.2)
#18 GALFIT ERR_Re           /  SIZE=1.2 (VER1.2)
#19 GALFIT n           /  SIZE=1.2 (VER1.2)
#20 GALFIT ERR_n           /  SIZE=1.2 (VER1.2)
#21 GALFIT AXIS RATIO (b/a)           /  SIZE=1.2 (VER1.2)
#22 GALFIT ERR_AXIS RATIO (err_b/a)           /  SIZE=1.2 (VER1.2)
#23 GALFIT PA           /  SIZE=1.2 (VER1.2)
#24 GALFIT ERR_PA           /  SIZE=1.2 (VER1.2)

#25 GALFIT MAG           /  SIZE=2.0 (VER2.0)
#26 GALFIT ERR_MAG           /  SIZE=2.0 (VER2.0)
#27 GALFIT Re           /  SIZE=2.0 (VER2.0)
#28 GALFIT ERR_Re           /  SIZE=2.0 (VER2.0)
#29 GALFIT n           /  SIZE=2.0 (VER2.0)
#30 GALFIT ERR_n           /  SIZE=2.0 (VER2.0)
#31 GALFIT AXIS RATIO (b/a)           /  SIZE=2.0 (VER2.0)
#32 GALFIT ERR_AXIS RATIO (err_b/a)           /  SIZE=2.0 (VER2.0)
#33 GALFIT PA           /  SIZE=2.0 (VER2.0)
#34 GALFIT ERR_PA           /  SIZE=2.0 (VER2.0)

#35 GALFIT MAG           /  SIZE=2.5 (VER2.5)
#36 GALFIT ERR_MAG           /  SIZE=2.5 (VER2.5)
#37 GALFIT Re           /  SIZE=2.5 (VER2.5)
#38 GALFIT ERR_Re           /  SIZE=2.5 (VER2.5)
#39 GALFIT n           /  SIZE=2.5 (VER2.5)
#40 GALFIT ERR_n           /  SIZE=2.5 (VER2.5)
#41 GALFIT AXIS RATIO (b/a)           /  SIZE=2.5 (VER2.5)
#42 GALFIT ERR_AXIS RATIO (err_b/a)           /  SIZE=2.5 (VER2.5)
#43 GALFIT PA           /  SIZE=2.5 (VER2.5)
#44 GALFIT ERR_PA           /  SIZE=2.5 (VER2.5)

#45 GALFIT MAG           /  SIZE=3.0 (VER3.0)
#46 GALFIT ERR_MAG           /  SIZE=3.0 (VER3.0)
#47 GALFIT Re           /  SIZE=3.0 (VER3.0)
#48 GALFIT ERR_Re           /  SIZE=3.0 (VER3.0)
#49 GALFIT n           /  SIZE=3.0 (VER3.0)
#50 GALFIT ERR_n           /  SIZE=3.0 (VER3.0)
#51 GALFIT AXIS RATIO (b/a)           /  SIZE=3.0 (VER3.0)
#52 GALFIT ERR_AXIS RATIO (err_b/a)           /  SIZE=3.0 (VER3.0)
#53 GALFIT PA           /  SIZE=3.0 (VER3.0)
#54 GALFIT ERR_PA           /  SIZE=3.0 (VER3.0)


#55 MU_eff   SERSIC MODEL           /  SIZE=1.0 (VER1.0)
#56 MU_0     SERSIC MODEL           /  SIZE=1.0 (VER1.0)
#57 MU_eff   GALAXY PROFILE           /  SIZE=1.0 (VER1.0)
#58 MU_0     GALAXY PROFILE           /  SIZE=1.0 (VER1.0)
#59 MU_eff   SERSIC PROFILE           /  SIZE=1.0 (VER1.0)
#60 MU_0     SERSIC PROFILE           /  SIZE=1.0 (VER1.0)


#61 MU_eff   SERSIC MODEL           /  SIZE=1.2 (VER1.2)
#62 MU_0     SERSIC MODEL           /  SIZE=1.2 (VER1.2)
#63 MU_eff   GALAXY PROFILE           /  SIZE=1.2 (VER1.2)
#64 MU_0     GALAXY PROFILE           /  SIZE=1.2 (VER1.2)
#65 MU_eff   SERSIC PROFILE           /  SIZE=1.2 (VER1.2)
#66 MU_0     SERSIC PROFILE           /  SIZE=1.2 (VER1.2)

#67 MU_eff   SERSIC MODEL           /  SIZE=2.0 (VER2.0)
#68 MU_0     SERSIC MODEL           /  SIZE=2.0 (VER2.0)
#69 MU_eff   GALAXY PROFILE           /  SIZE=2.0 (VER2.0)
#70 MU_0     GALAXY PROFILE           /  SIZE=2.0 (VER2.0)
#71 MU_eff   SERSIC PROFILE           /  SIZE=2.0 (VER2.0)
#72 MU_0     SERSIC PROFILE           /  SIZE=2.0 (VER2.0)

#73 MU_eff   SERSIC MODEL           /  SIZE=2.5 (VER2.5)
#74 MU_0     SERSIC MODEL           /  SIZE=2.5 (VER2.5)
#75 MU_eff   GALAXY PROFILE           /  SIZE=2.5 (VER2.5)
#76 MU_0     GALAXY PROFILE           /  SIZE=2.5 (VER2.5)
#77 MU_eff   SERSIC PROFILE           /  SIZE=2.5 (VER2.5)
#78 MU_0     SERSIC PROFILE           /  SIZE=2.5 (VER2.5)

#79 MU_eff   SERSIC MODEL           /  SIZE=3.0 (VER3.0)
#80 MU_0     SERSIC MODEL           /  SIZE=3.0 (VER3.0)
#81 MU_eff   GALAXY PROFILE           /  SIZE=3.0 (VER3.0)
#82 MU_0     GALAXY PROFILE           /  SIZE=3.0 (VER3.0)
#83 MU_eff   SERSIC PROFILE           /  SIZE=3.0 (VER3.0)
#84 MU_0     SERSIC PROFILE           /  SIZE=3.0 (VER3.0)

#85 ID 
#86 ACS VER ID
#87 SE ID










