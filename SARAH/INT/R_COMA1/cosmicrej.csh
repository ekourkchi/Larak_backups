#!/usr/bin/csh

# setenv no $argv

foreach ID ( `awk '$1' $argv` )


setenv no 1
sex ${ID}'_'${no}'.fits' -c ../vip/cosmic.conf.sex \
-CHECKIMAGE_NAME 'cosmic.'${ID}'_'${no}'.fits' \
-FILTER_NAME ../vip/cosmic.ret.sex \
-PARAMETERS_NAME ../vip/cosmic.param.sex	\
-STARNNW_NAME ../vip/default.nnw \
-CATALOG_NAME cosmic.cat

if (-e "cosmic.cat") then
rm "cosmic.cat"
endif

setenv no 2
sex ${ID}'_'${no}'.fits' -c ../vip/cosmic.conf.sex \
-CHECKIMAGE_NAME 'cosmic.'${ID}'_'${no}'.fits' \
-FILTER_NAME ../vip/cosmic.ret.sex \
-PARAMETERS_NAME ../vip/cosmic.param.sex	\
-STARNNW_NAME ../vip/default.nnw \
-CATALOG_NAME cosmic.cat

if (-e "cosmic.cat") then
rm "cosmic.cat"
endif

setenv no 3
sex ${ID}'_'${no}'.fits' -c ../vip/cosmic.conf.sex \
-CHECKIMAGE_NAME 'cosmic.'${ID}'_'${no}'.fits' \
-FILTER_NAME ../vip/cosmic.ret.sex \
-PARAMETERS_NAME ../vip/cosmic.param.sex	\
-STARNNW_NAME ../vip/default.nnw \
-CATALOG_NAME cosmic.cat

if (-e "cosmic.cat") then
rm "cosmic.cat"
endif

setenv no 4
sex ${ID}'_'${no}'.fits' -c ../vip/cosmic.conf.sex \
-CHECKIMAGE_NAME 'cosmic.'${ID}'_'${no}'.fits' \
-FILTER_NAME ../vip/cosmic.ret.sex \
-PARAMETERS_NAME ../vip/cosmic.param.sex	\
-STARNNW_NAME ../vip/default.nnw \
-CATALOG_NAME cosmic.cat

if (-e "cosmic.cat") then
rm "cosmic.cat"
endif

end

