#!/usr/bin/csh

setenv ID $argv[1]
setenv cat ${ID}'.475.cat'
setenv  no_object $argv[2]
#echo $no_object
setenv coef $argv[3]
setenv ver 'ver'$argv[3]

setenv psf_root ${ID}'_'${no_object}'_'475

set n_line=`echo "$no_object+29" | bc -l`
#echo $n_line


setenv xy `awk -F: -v n="$n_line" '(NR==n) {print($0)}' ${cat}`

echo
echo -------------- SEXTRACTOR OUTPUT FoR THIS OBJECT --------------------
echo $xy
echo ----------------------------------------------------------------------

setenv x0 `echo $xy | awk '{print ($2)}'`
setenv y0 `echo $xy | awk '{print ($3)}'`

 echo X_c: $x0
 echo Y_c: $y0

setenv  psf_root 'tiny_'${ID}'_no'${no_object}'_'475
#echo $psf_root
./tinymagic_475.csh $psf_root  $x0  $y0


setenv check ${ID}'.segment.475.fits'
setenv badmap ${ID}'_'${no_object}'.badmap.475.'${ver}'.fits'
setenv NAXIS1 `dfits -x 1 ${check} | fitsort NAXIS1 | awk '(NR==2) {print($2)}'`
setenv NAXIS2 `dfits -x 1 ${check} | fitsort NAXIS2 | awk '(NR==2) {print($2)}'`
if (-e ehsan.fits) then
rm ehsan.fits
endif
./imcopy ${check}"[1:"$NAXIS1",1:"$NAXIS2"]"   ehsan.fits

setenv A `echo $xy | awk '{print ($20)}'`
setenv B `echo $xy | awk '{print ($21)}'`
setenv THETA `echo $xy | awk '{print ($19)}'`
setenv KRON_R `echo $xy | awk '{print ($33)}'`
echo THETA: $THETA
setenv mag `echo $xy | awk '{print ($14)}'`
setenv re  `echo $xy | awk '{print ($25)}'`
echo R_e: $re
echo Mag: $mag
setenv elips `echo $xy | awk '{print ($32)}'`

echo ELLIPTICITY: $elips
set ratio=`echo "1-$elips" | bc -l`
set pa=`echo "${THETA}+90" | bc -l`
echo AXIS RATIO \(b/a\): '0'$ratio

if (-e ${badmap}) then
rm ${badmap}
endif

# The considered area is $coef times the Kron_Radius of the tearget galaxy measured by SE

./maskmaker ehsan.fits ${badmap} $x0 $y0 $A $B $THETA $KRON_R $no_object $coef
rm ehsan.fits

########################## GALFIT MAKER #############################
setenv galin ${ID}'_'${no_object}'.gal.in.475.'${ver}
if (-e ${galin}) then
rm ${galin}
endif

setenv filename 'h_v'${ID}'_F475W_drz_cl_ver2.fits'
setenv file_rms 'h_v'${ID}'_F475W_rms_ver2.fits '
setenv galoutfile ${ID}'_'${no_object}'.gal.out.475.'${ver}'.fits'
setenv tinypsf ${psf_root}'00_psf.fits'
set coeff=`echo "$coef+0.1" | bc -l`
set x1=`echo "$x0-$coeff*$A*$KRON_R" | bc -l`
set x2=`echo "$x0+$coeff*$A*$KRON_R" | bc -l`
set y1=`echo "$y0-$coeff*$A*$KRON_R" | bc -l`
set y2=`echo "$y0+$coeff*$A*$KRON_R" | bc -l`


set x1=`./nodot $x1`
set x2=`./nodot $x2`
set y1=`./nodot $y1`
set y2=`./nodot $y2`

if ( $x1 <= 1 ) set x1=1
if ( $x2 > $NAXIS1 ) set x2=$NAXIS1
if ( $y1 <= 1 ) set y1=1
if ( $y2 > $NAXIS2 ) set y2=$NAXIS2



set size_x=`echo "$x2-$x1" | bc -l`
set size_y=`echo "$y2-$y1" | bc -l`
setenv size_xx `./nodot $size_x`
setenv size_yy `./nodot $size_y`


echo "================================================================================"  > $galin
echo "# IMAGE and GALFIT CONTROL PARAMETERS"   >> $galin
echo "A) "${filename}"[1]         # Input data image (FITS file)"   >> $galin
#echo "B) none            # Output data image block"   >> $galin
echo "B) "$galoutfile"            # Output data image block"   >> $galin
#echo "C) "${file_rms}"          # Sigma image name (made from data if blank or none) "   >> $galin
echo "C) none          # Sigma image name (made from data if blank or none) "   >> $galin
echo "D) "$tinypsf"               # Input PSF image and (optional) diffusion kernel"   >> $galin
echo "E) 1                        # PSF fine sampling factor relative to data"   >> $galin
echo "F) "$badmap"                # Bad pixel mask (FITS image or ASCII coord list)"   >> $galin
echo "G) none                     # File with parameter constraints (ASCII file)"    >> $galin
echo "H) "$x1" "$x2" "$y1" "$y2"     # Image region to fit (xmin xmax ymin ymax)"   >> $galin
echo "I) "$size_xx"  "$size_yy"          # Size of the convolution box (x y)"   >> $galin
echo "J) 26.068                          # Magnitude photometric zeropoint"   >> $galin
echo "K) 0.05  0.05                      # Plate scale (dx dy)   [arcsec per pixel]"   >> $galin
echo "O) regular                         # Display type (regular, curses, both)"   >> $galin
echo "P) 0                               # Options: 0=normal run; 1,2=make model/imgblock & quit"   >> $galin
echo   >> $galin
echo   >> $galin
echo "# THE OBJECT LIST BELOW can be however long or short as the complexity"   >> $galin
echo "# requires.  The user has complete freedom to mix and match the components"   >> $galin
echo "# by duplicating each object block."   >> $galin
echo   >> $galin
echo "# INITIAL FITTING PARAMETERS"   >> $galin
echo "#"   >> $galin
echo "# column 1:  Parameter number"   >> $galin
echo "# column 2: "   >> $galin
echo "#          -- Parameter 0: the allowed functions are: sersic, nuker, expdisk"   >> $galin
echo "#	      edgedisk, devauc, king, moffat, gaussian, ferrer, psf, sky"   >> $galin
echo "#	   -- Parameter 1-10: value of the initial parameters"   >> $galin
echo "#          -- Parameter C0: For diskiness/boxiness"   >> $galin
echo "#             <0 = disky"   >> $galin
echo "#             >0 = boxy"   >> $galin
echo "#          -- Parameter Z: Outputting image options, the options are:"   >> $galin
echo "#             0 = normal, i.e. subtract final model from the data to create"   >> $galin
echo "#		  the residual image"   >> $galin
echo "#	      1 = Leave in the model -- do not subtract from the data"   >> $galin
echo "#"   >> $galin
echo "# column 3: allow parameter to vary (yes = 1, no = 0)"   >> $galin
echo "# column 4: comment"   >> $galin
echo   >> $galin
echo "# Sersic function"   >> $galin
echo   >> $galin
echo "0) sersic                # Object type"   >> $galin
echo "1) "$x0"   "$y0"  1 1    # position x, y        [pixel]"   >> $galin
echo "3) "$mag"    1           # total magnitude    "   >> $galin
echo "4) "$re"      1          #     R_e              [Pixels]"   >> $galin
echo "5) 3       1             # Sersic exponent (deVauc=4, expdisk=1)  "   >> $galin
echo "9) 0"$ratio"       1     # axis ratio (b/a)   "   >> $galin
echo "10) "$pa"       1         # position angle (PA)  [Degrees: Up=0, Left=90]"   >> $galin
echo "Z) 0                     #  Skip this model in output image?  (yes=1, no=0)"   >> $galin
echo   >> $galin



# echo " 0) moffat             # object type"   >> $galin
# echo "1) "$x0"   "$y0" 1 1   # position x, y        [pixel]"   >> $galin
# echo " 3)  "$mag"      1       # total magnitude     "   >> $galin
# echo " 4) 3        1       #   FWHM               [Pixels]"   >> $galin
# echo " 5) 1.5        1       # powerlaw      "   >> $galin
# echo " 9)  0"$ratio"       1       # axis ratio (b/a)   "   >> $galin
# echo "10)   "$pa"       1       # position angle (PA)  [Degrees: Up=0, Left=90]"   >> $galin
# echo " Z) 0                  #  Skip this model in output image?  (yes=1, no=0)"   >> $galin



# Gaussian function

# echo " 0) gaussian           # object type"   >> $galin
# echo " 1)  "$x0"   "$y0"  1 1  # position x, y        [pixel]"   >> $galin
# echo " 3)  "$mag"      1       # total magnitude     "   >> $galin
# echo " 4) 2        1       #   FWHM               [pixels]"   >> $galin
# echo " 9) 1        1       # axis ratio (b/a)   "   >> $galin
# echo "10) 0         1       # position angle (PA)  [Degrees: Up=0, Left=90]"   >> $galin
# echo " Z) 0                  # leave in [1] or subtract [0] this comp from data?"   >> $galin


echo   >> $galin


echo "0) sky"   >> $galin
echo "1) 0.00       1       # sky background       [ADU counts]"   >> $galin
echo "2) 0.000      0       # dsky/dx (sky gradient in x) "   >> $galin
echo "3) 0.000      0       # dsky/dy (sky gradient in y) "   >> $galin
echo "Z) 0                  #  Skip this model in output image?  (yes=1, no=0)"   >> $galin
echo    >> $galin


##################################################################################
if (-e fit.log) then
rm fit.log
endif
galfit ${galin}  > galfit.logfile.log
setenv fitout ${ID}'_'${no_object}'.galfit.475.'${ver}
mv fit.log $fitout
rm galfit.01



setenv bad ${ID}_${no_object}.gal.out.475.${ver}.badmap.fits
if (-e ${bad}) then
rm ${bad}
endif

echo "./imcopy '"$badmap"["$x1":"$x2","$y1":"$y2"]'" $bad   >  temp.csh 
csh temp.csh
rm temp.csh
rm ${badmap}
mv $bad ${badmap}


setenv a `awk '(NR==8) {print($4)}' ${fitout}`
setenv b `awk '(NR==8) {print($5)}' ${fitout}`
set xc=`./nosuffix $a ','`
set yc=`./nosuffix $b ')'`
set cx=`echo "$xc-$x1" | bc -l`
set cy=`echo "$yc-$y1" | bc -l`



#echo $cx
#echo $cy

echo " "
echo "               X_c       Y_c        mag     Re       n       Ratio  Pa     ID  no.  C_x     C_Y"
awk -F: -v iidd="$ID" -v nnoo="$no_object" -v x="$cx" -v y="$cy" '(NR==8) {print($0"  "iidd"  "nnoo"  "x"  "y)}' $fitout

##################################### PREPARE IRAF CL FILE FOR ISOPHOT ###############################3
if (-e ${ID}_${no_object}.gal.out.475.${ver}.galaxy.fits) then
rm ${ID}_${no_object}.gal.out.${ver}.galaxy.fits
endif

if (-e ${ID}_${no_object}.gal.out.475.${ver}.sersic.fits) then
rm ${ID}_${no_object}.gal.out.${ver}.sersic.fits
endif


setenv a ${ID}_${no_object}.gal.out.475.${ver}.fits
setenv b ${ID}_${no_object}.gal.out.475.${ver}.galaxy.fits
echo "./imcopy '"$a"[1]' " $b  > temp.csh
csh temp.csh
rm temp.csh

setenv b ${ID}_${no_object}.gal.out.475.${ver}.sersic.fits
echo "./imcopy '"$a"[2]' " $b  > temp.csh
csh temp.csh
rm temp.csh


setenv NAXIS1 `dfits ${ID}_${no_object}.gal.out.475.${ver}.fits | fitsort NAXIS1 | awk '(NR==2) {print($2)}'`
setenv NAXIS2 `dfits ${ID}_${no_object}.gal.out.475.${ver}.fits | fitsort NAXIS2 | awk '(NR==2) {print($2)}'`

#echo NAXIS1: $NAXIS1
#echo NAXIS2: $NAXIS2

set caxis1=`echo "0.5*$NAXIS1" | bc -l`
set caxis2=`echo "0.5*$NAXIS2" | bc -l`
setenv ccaxis1 `./nodot $caxis1`
setenv ccaxis2 `./nodot $caxis2`

#echo X_c: $ccaxis1
#echo Y_c: $ccaxis2

setenv PA `awk '(NR==8) {print($10)}' ${ID}_${no_object}.galfit.475.${ver}`
#set PA0=`echo "90+$PA" | bc -l`

setenv eli `awk '(NR==8) {print($9)}' ${ID}_${no_object}.galfit.475.${ver}`
set ell=`echo "1-$eli" | bc -l`

setenv isogal  ${ID}_${no_object}.475.${ver}.isogal
setenv isoser  ${ID}_${no_object}.475.${ver}.isoser

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

setenv cl_iraf  ${ID}_${no_object}.475.${ver}.iraf.cl
if (-e ${cl_iraf}) then
rm ${cl_iraf}
endif

setenv plfile ${ID}_${no_object}.gal.out.475.${ver}.galaxy.pl
if (-e ${plfile}) then
rm ${plfile}
endif

echo "stsdas"  > ${cl_iraf}
echo "analysis"  >> ${cl_iraf}
echo "isophot"  >> ${cl_iraf}

echo "\!rm ${ID}_${no_object}.gal.out.475.${ver}.galaxy.pl"  >> ${cl_iraf}
echo "\!rm  "$isogal".tab"  >> ${cl_iraf}
echo "\!rm  "$isoser".tab"  >> ${cl_iraf}
echo "\!rm  "$isogal".txt"  >> ${cl_iraf}
echo "\!rm  "$isoser".txt"  >> ${cl_iraf}

set ell00=`echo "100*$ell" | bc -l`
set ell00=`./nodot $ell00`
if ( $ell00 <= 5 ) set ell=0.05

echo "imcopy ${badmap}   ${ID}_${no_object}.gal.out.475.${ver}.galaxy.pl"  >> ${cl_iraf}
echo "ellipse input='${ID}_${no_object}.gal.out.475.${ver}.galaxy.fits' output='"$isogal".tab' x0="$cx" y0="$cy" ellip0="$ell" pa0="$PA" sma=10 step=0.1 interac=no "  >> ${cl_iraf}
echo "ellipse input='${ID}_${no_object}.gal.out.475.${ver}.sersic.fits' output='"$isoser".tab' x0="$cx" y0="$cy" ellip0="$ell" pa0="$PA" sma=5 step=0.1 interac=no " >> ${cl_iraf}

echo "tdump "$isogal".tab cdfile=STDOUT datafile=STDOUT > "$isogal".txt"  >> ${cl_iraf}
echo "tdump "$isoser".tab cdfile=STDOUT datafile=STDOUT > "$isoser".txt"  >> ${cl_iraf}


echo "Please type [ cl <  "${cl_iraf}" ] in IRAF environment in same directory.  "
echo "Then: type [ isoexam table='${isogal}.tab' ] in IRAF to see isophots of original galaxy.  "
echo "      type [ isoexam table='${isoser}.tab' ] in IRAF to see isophots of Sersic fit.  "
echo "To plot the light profile, use [ ${isogal}.txt and ${isoser}.txt] in IDL/GNUPLOT/SM/PGPLOT "
echo
echo "  (by:E. Kourkchi 01 Jan 2010)"
echo " "

