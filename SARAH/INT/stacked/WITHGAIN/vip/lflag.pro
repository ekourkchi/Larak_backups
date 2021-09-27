pro lflag, filename, thresh=thresh, flag=flag

print, 'Thresh=', thresh
print, 'Flag=', flag

fits_read, filename, image, h


nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')

print, 'NAXIS1=', nx
print, 'NAXIS2=', ny

for i=1, nx do begin

  for j=1, ny do begin



if image[i-1,j-1] le thresh  then image[i-1,j-1]=flag


endfor
endfor


fits_write, 'lflag.'+filename, image, h

end