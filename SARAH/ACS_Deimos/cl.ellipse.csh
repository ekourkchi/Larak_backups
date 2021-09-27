#!/usr/bin/csh

setenv ID $argv[1]
setenv  no_object $argv[2]
setenv ver $argv[3]


if (-e ${ID}_${no_object}.gal.out.${ver}.galaxy.fits) then
rm ${ID}_${no_object}.gal.out.${ver}.galaxy.fits
endif

if (-e ${ID}_${no_object}.gal.out.${ver}.sersic.fits) then
rm ${ID}_${no_object}.gal.out.${ver}.sersic.fits
endif


setenv a ${ID}_${no_object}.gal.out.${ver}.fits
setenv b ${ID}_${no_object}.gal.out.${ver}.galaxy.fits
echo "./imcopy '"$a"[1]' " $b  > temp.csh
csh temp.csh
rm temp.csh

setenv b ${ID}_${no_object}.gal.out.${ver}.sersic.fits
echo "./imcopy '"$a"[2]' " $b  > temp.csh
csh temp.csh
rm temp.csh


setenv NAXIS1 `dfits ${ID}_${no_object}.gal.out.${ver}.fits | fitsort NAXIS1 | awk '(NR==2) {print($2)}'`
setenv NAXIS2 `dfits ${ID}_${no_object}.gal.out.${ver}.fits | fitsort NAXIS2 | awk '(NR==2) {print($2)}'`

echo NAXIS1: $NAXIS1
echo NAXIS2: $NAXIS2

set caxis1=`echo "0.5*$NAXIS1" | bc -l`
set caxis2=`echo "0.5*$NAXIS2" | bc -l`
setenv ccaxis1 `./nodot $caxis1`
setenv ccaxis2 `./nodot $caxis2`

echo X_c: $ccaxis1
echo Y_c: $ccaxis2

setenv PA `awk '(NR==8) {print($10)}' ${ID}_${no_object}.galfit.${ver}`
set PA0=`echo "90+$PA" | bc -l`

setenv eli `awk '(NR==8) {print($9)}' ${ID}_${no_object}.galfit.${ver}`
set PA0=`echo "1-$eli" | bc -l`

setenv isogal  ${ID}_${no_object}.${ver}.isogal
setenv isoser  ${ID}_${no_object}.${ver}.isoser

if (-e ${isogal}.tab) then
rm ${isogal}.tab
endif
if (-e ${isoser}.tab) then
rm ${isoser}.tab
endif
if (-e ${isogal}.txt) then
rm ${isogal}.txt
endif
if (-e ${isoser}.txt) then
rm ${isoser}.txt
endif

setenv cl_iraf  ${ID}_${no_object}.${ver}.iraf.cl
if (-e ${cl_iraf}) then
rm ${cl_iraf}
endif


echo "ellipse input='${ID}_${no_object}.gal.out.${ver}.galaxy.fits' output='"$isogal".tab' x0="$ccaxis1" y0="$ccaxis2" ellip0="$eli" pa0="$PA0" sma=5 step=0.1 interac=no"  > ${cl_iraf}
echo "ellipse input='${ID}_${no_object}.gal.out.${ver}.sersic.fits' output='"$isoser".tab' x0="$ccaxis1" y0="$ccaxis2" ellip0="$eli" pa0="$PA0" sma=5 step=0.1 interac=no"  >> ${cl_iraf}

echo "tdump "$isogal".tab cdfile=STDOUT datafile=STDOUT > "$isogal".txt"  >> ${cl_iraf}
echo "tdump "$isoser".tab cdfile=STDOUT datafile=STDOUT > "$isoser".txt"  >> ${cl_iraf}

echo "please type [ cl <  "${cl_iraf}" ] in IRAF environment.  (by:Ehsan Kourkchi 31 Dec 09)"


exit

