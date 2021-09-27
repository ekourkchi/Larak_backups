#!/usr/bin/csh

setenv id0 $argv[1]
setenv no $argv[2]



echo 
echo "	\\epsfxsize=2.6in"
echo "	\\epsffile{"$id0"_"$no".galfit.ver2.5.paper.eps} &"
echo "	\\epsfxsize=1.8in "
echo "	\\epsffile{"$id0"_"$no".gal.out.ver2.5.galaxy.eps} & "
echo "	\\epsfxsize=1.8in "
echo "	\\epsffile{"$id0"_"$no".gal.out.ver2.5.residu.eps} \\\\ [0.4cm] "
echo 

./psfilemaker.csh "$id0"_"$no".galfit.ver2.5.paper
cp "$id0"_"$no".galfit.ver2.5.paper.eps /media/SARAH/kaar/Cody.ehsan/.



