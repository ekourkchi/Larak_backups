#!/usr/bin/csh

# setenv ID $argv[1]


setenv no 1
foreach ID ( `awk '$1' $argv[1]` )
cp ${ID}'_'${no}'.corr.head' ${ID}'_'${no}'.esncorr.head' 
cp ${ID}'_'${no}'.corr.head' ${ID}'_'${no}'.esncorr2.head' 

end

setenv no 2
foreach ID ( `awk '$1' $argv[1]` )
cp ${ID}'_'${no}'.corr.head' ${ID}'_'${no}'.esncorr.head' 
cp ${ID}'_'${no}'.corr.head' ${ID}'_'${no}'.esncorr2.head' 


end

setenv no 3
foreach ID ( `awk '$1' $argv[1]` )
cp ${ID}'_'${no}'.corr.head' ${ID}'_'${no}'.esncorr.head' 
cp ${ID}'_'${no}'.corr.head' ${ID}'_'${no}'.esncorr2.head' 

end

setenv no 4
foreach ID ( `awk '$1' $argv[1]` )
cp ${ID}'_'${no}'.corr.head' ${ID}'_'${no}'.esncorr.head' 
cp ${ID}'_'${no}'.corr.head' ${ID}'_'${no}'.esncorr2.head' 



end
